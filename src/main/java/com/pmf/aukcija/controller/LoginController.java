package com.pmf.aukcija.controller;

import java.text.SimpleDateFormat;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pmf.aukcija.model.Advert;
import com.pmf.aukcija.model.AdvertCategory;
import com.pmf.aukcija.model.Message;
import com.pmf.aukcija.model.Offer;
import com.pmf.aukcija.model.Rating;
import com.pmf.aukcija.model.User;
import com.pmf.aukcija.service.AdvertCategoryService;
import com.pmf.aukcija.service.AdvertService;
import com.pmf.aukcija.service.MessageService;
import com.pmf.aukcija.service.OfferService;
import com.pmf.aukcija.service.RatingService;
import com.pmf.aukcija.service.UserService;


@Controller
@RequestMapping(value="/auth")
public class LoginController {
	
	@Autowired
	AdvertCategoryService acs;
	
	@Autowired
	AdvertService as;
	
	@Autowired
	UserService us;
	
	@Autowired 
	OfferService os;
	
	@Autowired
	MessageService ms;
	
	@Autowired
	RatingService rs;
	
	//LogOut 
	@RequestMapping(value="/logout", method = RequestMethod.GET)
		public String logoutPage (HttpServletRequest request, HttpServletResponse response){
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
				if (auth != null){    
					SecurityContextHolder.getContext().setAuthentication(null);
				}
		request.getSession().setAttribute("user", null);
	        return "redirect:/auth/userLogin";
	    }
	 
	//Method for Login. Getting informations for login.jsp.. 
	@RequestMapping(value="userLogin", method=RequestMethod.GET)
	public String userLogin(HttpServletRequest request) {
		return "login";	
	}
	
	//Method for Login. After a form, we get informations about user and check if if have that user in
	//our DB. If we have, then we are good to proceed to welcome page. Otherwise, we stay on login page
	//and try again. Also we send all informations we need in welcome.jsp.
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(ModelMap modelMap, @ModelAttribute("username") String username, @ModelAttribute("password") String password, HttpServletRequest request) {
		User u=us.getUserByUsernameAndPassword2(username, password);
		List<AdvertCategory> advertCategories = acs.getAllAdvertCategories();
		List<Message> messages = ms.getAllMessages();
		List<Rating> rating = rs.getAllRatings();
		List<Advert> adverts = as.getAllByOrderByIdAdvertDesc();
		List<Offer> finalno = new ArrayList<Offer>();
		
		//Finding all offers by advert and price and putting them in a list so we can
		//have a list of best offers and then easy find buyer of product
		for(Advert a : adverts) {
			List<Offer> o = os.getOffersByAdvert(a); 
			double price=0;

			for(Offer offer : o) {
				double offerPrice = offer.getPrice();
				
				if(price < offerPrice) {
					price = offerPrice;
					System.out.println(price);
				}
			
			}
			
			Offer buyer = os.getOfferByPriceAndAdvert(price, a);
			
			finalno.add(buyer);
			
		}
		
		
		if(u!=null) {
			request.getSession().setAttribute("user", u);
			request.getSession().setAttribute("advertCategories", advertCategories);
			request.getSession().setAttribute("offers", finalno);
			request.getSession().setAttribute("messages", messages);
			request.getSession().setAttribute("rating", rating);
			request.getSession().setAttribute("adverts", adverts);		
			
			return "welcome";
			
		} else {
			modelMap.addAttribute("wrongUsernameOrPassword", "wrongUsernameOrPassword");
			
			return "login";
		}
	}

	
	
	//Method for Registration..
	@RequestMapping(value="registracija", method=RequestMethod.GET)
	public String registracija(ModelMap modelMap) {
		return "registration";
	}
	
	//Method for Registration. After form, we send all informations that we have to store in our DB and add 
	//new User. Also we check some validations here.. After registration, user is redirected to login page. 
	@RequestMapping(value="registration", method=RequestMethod.POST)
	public String register(@ModelAttribute("user") User u, ModelMap modelMap) {
		
	    if(us.isUserPresent(u.getUsername())) {
			modelMap.addAttribute("userExist", "userExist");
			return "registration";
		} else if(us.isUserPresentEmail(u.getEmail())) {
			modelMap.addAttribute("emailExist", "emailExist");
			return "registration";
		} else if(us.isPasswordShort(u.getPassword())) {
			modelMap.addAttribute("shortPassword", "shortPassword");
			return "registration";
		} else if(us.doesPasswordsMatch(u.getPassword(), u.getPassword2())) {
			modelMap.addAttribute("doesntMatch", "doesntMatch");
			return "registration";
		} else if(us.isUsernameShort(u.getUsername())) {
			modelMap.addAttribute("shortUsername", "shortUsername");
			return "registration";
		} else if(us.isEmailValid(u.getEmail())) {
			modelMap.addAttribute("notValidEmail", "notValidEmail");
			return "registration";                        
		} 
	    else {
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			u.setTime(format.format(new Date()));
			u.setUsername(u.getUsername());
			u.setFirstname(u.getFirstname());
			u.setLastname(u.getLastname());
			u.setPassword(passwordEncoder.encode(u.getPassword()));
			u.setPassword2(u.getPassword2());
			u.setEmail(u.getEmail());
			u.setRole((byte) 1);
			
			us.save(u);
			
			return "login";
		}
	
	
	}
}
