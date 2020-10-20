package com.pmf.aukcija.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pmf.aukcija.model.Advert;
import com.pmf.aukcija.model.AdvertCategory;
import com.pmf.aukcija.model.Message;
import com.pmf.aukcija.model.Offer;
import com.pmf.aukcija.model.User;
import com.pmf.aukcija.service.AdvertCategoryService;
import com.pmf.aukcija.service.AdvertService;
import com.pmf.aukcija.service.MessageService;
import com.pmf.aukcija.service.OfferService;
import com.pmf.aukcija.service.RatingService;
import com.pmf.aukcija.service.UserService;


@Controller
@RequestMapping("/auction")
public class UserController {
	
	@Autowired
	AdvertCategoryService acs;
	
	@Autowired
	AdvertService as;
	
	@Autowired
	UserService us;
	
	@Autowired 
	OfferService os;
	
	@Autowired
	RatingService rs;
	
	@Autowired
	MessageService ms;
	
	//Method where user is redirected after login.. he can see home page with auctions..
	@RequestMapping(value="welcome", method=RequestMethod.GET)
	public String welcome(HttpServletRequest request) {
		List<AdvertCategory> advertCategories = acs.getAllAdvertCategories();
		List<Advert> adverts = as.getAllByOrderByIdAdvertDesc();
		List<Offer> finalno = new ArrayList<Offer>();
		List<Message> messages = ms.getAllMessages();
		
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
		
		request.getSession().setAttribute("messages", messages);
		request.getSession().setAttribute("advertCategories", advertCategories);
		request.getSession().setAttribute("offers", finalno);
		request.getSession().setAttribute("adverts", adverts);
		
		return "welcome";
		
	}
	
	@RequestMapping(value="userProfile", method=RequestMethod.GET) 
	public String userProfile() {
		return "userProfile";
	}
	
	@RequestMapping(value="allUsers", method=RequestMethod.GET) 
	public String allUsers(HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
		List<User> users = us.getAllUser();
		List<Advert> adverts = as.getAllByUser(u);
		List<Advert> lastFive = new ArrayList();
		
		if(adverts.size()<5) {
			lastFive=adverts;
		} else {
			lastFive = adverts.subList(adverts.size()-5, adverts.size());
		}
		
		String pozitivna = "POSITIVE";
		String negativna = "NEGATIVE";
		String neutralna = "NEUTRAL";
		
		int positiveRating = 0;
		int negativeRating = 0;
		int neutralRating = 0;
		
		for(Advert ad : adverts) {
			
			if(pozitivna.equals(ad.getRatingSeller())) {
				positiveRating++;
			} else if(negativna.equals(ad.getRatingSeller())){
				negativeRating++;
			} else if(neutralna.equals(ad.getRatingSeller())) {
				neutralRating++;
			}
			
		}
		
		int total=positiveRating+negativeRating+neutralRating;
		
		if(positiveRating==0) {
			String ratingOveralPositive = "0/"+total;
			request.getSession().setAttribute("ratingOveralPositive", ratingOveralPositive);
		}  else {
			String ratingOveralPositive = positiveRating+"/"+total;
			request.getSession().setAttribute("ratingOveralPositive", ratingOveralPositive);
		}
		
		if(negativeRating==0) {
			String ratingOveralNegative = "0/"+total;
			request.getSession().setAttribute("ratingOveralNegative", ratingOveralNegative);
		} else {
			String ratingOveralNegative = negativeRating+"/"+total;
			request.getSession().setAttribute("ratingOveralNegative", ratingOveralNegative);
		}
		
		if(neutralRating==0) {
			String ratingOveralNeutral = "0/"+total;
			request.getSession().setAttribute("ratingOveralNeutral", ratingOveralNeutral);
		} else {
			String ratingOveralNeutral = neutralRating+"/"+total;
			request.getSession().setAttribute("ratingOveralNeutral", ratingOveralNeutral);
		}
		
		request.getSession().setAttribute("lastFive", lastFive);
		request.getSession().setAttribute("u", null);
		request.getSession().setAttribute("users", users);
		return "allUsers";
	}
	
	@RequestMapping(value="myProfile3", method=RequestMethod.POST)
	public String myProfile3(@RequestParam(value ="idUser", required=false) int id,HttpServletRequest request) {
		User u = us.getUserById(id);
		List<Advert> adverts = as.getAllByUser(u);
		List<Advert> lastFive = new ArrayList();
		
		if(adverts.size()<5) {
			lastFive=adverts;
		} else {
			lastFive = adverts.subList(adverts.size()-5, adverts.size());
		}
		
		String pozitivna = "POSITIVE";
		String negativna = "NEGATIVE";
		String neutralna = "NEUTRAL";
		
		int positiveRating = 0;
		int negativeRating = 0;
		int neutralRating = 0;
			
		for(Advert ad : adverts) {
			
			if(pozitivna.equals(ad.getRatingSeller())) {
				positiveRating++;
			} else if(negativna.equals(ad.getRatingSeller())){
				negativeRating++;
			} else if(neutralna.equals(ad.getRatingSeller())) {
				neutralRating++;
			}
			
		}
		
		int total=positiveRating+negativeRating+neutralRating;
		
		if(positiveRating==0) {
			String ratingOveralPositive = "0/"+total;
			request.getSession().setAttribute("ratingOveralPositive", ratingOveralPositive);
		}  else {
			String ratingOveralPositive = positiveRating+"/"+total;
			request.getSession().setAttribute("ratingOveralPositive", ratingOveralPositive);
		}
		
		if(negativeRating==0) {
			String ratingOveralNegative = "0/"+total;
			request.getSession().setAttribute("ratingOveralNegative", ratingOveralNegative);
		} else {
			String ratingOveralNegative = negativeRating+"/"+total;
			request.getSession().setAttribute("ratingOveralNegative", ratingOveralNegative);
		}
		
		if(neutralRating==0) {
			String ratingOveralNeutral = "0/"+total;
			request.getSession().setAttribute("ratingOveralNeutral", ratingOveralNeutral);
		} else {
			String ratingOveralNeutral = neutralRating+"/"+total;
			request.getSession().setAttribute("ratingOveralNeutral", ratingOveralNeutral);
		}
		
		request.getSession().setAttribute("lastFive", lastFive);
		request.getSession().setAttribute("u", u);
		return "allUsers";
	}
	
	@RequestMapping(value="myProfile2", method=RequestMethod.GET)
	public String myProfile2(@RequestParam(value ="idUser", required =false) int id,HttpServletRequest request) {
		User u = us.getUserById(id);
		List<Advert> adverts = as.getAllByUser(u);
		List<Advert> lastFive = new ArrayList();
		
		if(adverts.size()<5) {
			lastFive=adverts;
		} else {
			lastFive = adverts.subList(adverts.size()-5, adverts.size());
		}
		
		String pozitivna = "POSITIVE";
		String negativna = "NEGATIVE";
		String neutralna = "NEUTRAL";
		
		int positiveRating = 0;
		int negativeRating = 0;
		int neutralRating = 0;
		
		for(Advert ad : adverts) {
			
			if(pozitivna.equals(ad.getRatingSeller())) {
				positiveRating++;
			} else if(negativna.equals(ad.getRatingSeller())){
				negativeRating++;
			} else if(neutralna.equals(ad.getRatingSeller())) {
				neutralRating++;
			}
			
		}
		
		int total=positiveRating+negativeRating+neutralRating;
		
		if(positiveRating==0) {
			String ratingOveralPositive = "0/"+total;
			request.getSession().setAttribute("ratingOveralPositive", ratingOveralPositive);
		}  else {
			String ratingOveralPositive = positiveRating+"/"+total;
			request.getSession().setAttribute("ratingOveralPositive", ratingOveralPositive);
		}
		
		if(negativeRating==0) {
			String ratingOveralNegative = "0/"+total;
			request.getSession().setAttribute("ratingOveralNegative", ratingOveralNegative);
		} else {
			String ratingOveralNegative = negativeRating+"/"+total;
			request.getSession().setAttribute("ratingOveralNegative", ratingOveralNegative);
		}
		
		if(neutralRating==0) {
			String ratingOveralNeutral = "0/"+total;
			request.getSession().setAttribute("ratingOveralNeutral", ratingOveralNeutral);
		} else {
			String ratingOveralNeutral = neutralRating+"/"+total;
			request.getSession().setAttribute("ratingOveralNeutral", ratingOveralNeutral);
		}
		
		request.getSession().setAttribute("lastFive", lastFive);
		request.getSession().setAttribute("u", u);
		
		return "userProfile2";
	}
	
	//Method that gets informations about a loged in user, so we can see myProfile.jsp 
	@RequestMapping(value="myProfile", method=RequestMethod.GET)
	public String myProfile(HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
		List<Advert> adverts = as.getAllByUser(u);
		List<Advert> lastFive = new ArrayList();
		
		if(adverts.size()<5) {
			lastFive=adverts;
		} else {
			lastFive = adverts.subList(adverts.size()-5, adverts.size());
		}
		
		String pozitivna = "POSITIVE";
		String negativna = "NEGATIVE";
		String neutralna = "NEUTRAL";
		
		int positiveRating = 0;
		int negativeRating = 0;
		int neutralRating = 0;
		
		for(Advert ad : adverts) {
			
			if(pozitivna.equals(ad.getRatingSeller())) {
				positiveRating++;
			} else if(negativna.equals(ad.getRatingSeller())){
				negativeRating++;
			} else if(neutralna.equals(ad.getRatingSeller())) {
				neutralRating++;
			}
			
		}
		
		int total=positiveRating+negativeRating+neutralRating;
		
		if(positiveRating==0) {
			String ratingOveralPositive = "0/"+total;
			request.getSession().setAttribute("ratingOveralPositive", ratingOveralPositive);
		}  else {
			String ratingOveralPositive = positiveRating+"/"+total;
			request.getSession().setAttribute("ratingOveralPositive", ratingOveralPositive);
		}
		
		if(negativeRating==0) {
			String ratingOveralNegative = "0/"+total;
			request.getSession().setAttribute("ratingOveralNegative", ratingOveralNegative);
		} else {
			String ratingOveralNegative = negativeRating+"/"+total;
			request.getSession().setAttribute("ratingOveralNegative", ratingOveralNegative);
		}
		
		if(neutralRating==0) {
			String ratingOveralNeutral = "0/"+total;
			request.getSession().setAttribute("ratingOveralNeutral", ratingOveralNeutral);
		} else {
			String ratingOveralNeutral = neutralRating+"/"+total;
			request.getSession().setAttribute("ratingOveralNeutral", ratingOveralNeutral);
		}
		
		request.getSession().setAttribute("lastFive", lastFive);
		
		return "userProfile";
	}
	
	//Method that get informations about user, and send him on editProfile.jsp
	@RequestMapping(value="editProfile", method=RequestMethod.GET)
	public String editProfile(HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
		
		request.getSession().setAttribute("user", u);
		
		return "editProfile";
	}
	
	//Method that allow user to change informations about himself and update them in database
	@RequestMapping(value="backToProfile", method=RequestMethod.POST)
	public String backToProfile(@RequestParam(value="password2", required=false) String password2, @RequestParam(value="password", required=false) String password, @RequestParam(value="description", required=false) String description, @RequestParam(value="city", required=false) String city, @RequestParam(value="country", required=false) String country, @RequestParam(value="phoneNumber", required=false) String phoneNumber, @RequestParam(value="email", required=false) String email, @RequestParam(value="username", required=false) String username,HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
	
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		u.setCity(city);
		u.setCountry(country);
		u.setDescription(description);
		u.setEmail(email);
		u.setPhoneNumber(phoneNumber);
		u.setFirstname(u.getFirstname());
		u.setLastname(u.getLastname());
		u.setPassword(passwordEncoder.encode(password));
		u.setPassword2(password2);
		u.setUsername(username);
		
		us.save(u);
		
		return "userProfile";
		
	}
	
}
