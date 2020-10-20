package com.pmf.aukcija.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pmf.aukcija.model.Advert;
import com.pmf.aukcija.model.Offer;
import com.pmf.aukcija.model.User;
import com.pmf.aukcija.service.AdvertService;
import com.pmf.aukcija.service.OfferService;
import com.pmf.aukcija.service.UserService;

@Controller
@RequestMapping("/auction")
public class OfferController {

	@Autowired
	OfferService os;
	
	@Autowired
	UserService us;
	
	@Autowired
	AdvertService as;
	
	//Method for bidding on auction
	@RequestMapping(value="offer", method=RequestMethod.POST) 
	public String offer(@ModelAttribute("currentPrice") Double currentPrice, @ModelAttribute("advert") Advert advert, @ModelAttribute("user") User user,  HttpServletRequest request) {
		Advert a = (Advert) request.getSession().getAttribute("advert");
		User u = (User) request.getSession().getAttribute("user");
		List<Offer> offers = os.getAllOffersByOrderByIdOfferDesc();
		
		//If user is owner of auction, he can't bid. All others registered users are allowed if they bid more then current bid
		if(a.getUser().getIdUser()==u.getIdUser()) {
			return "redirect:/auction/advert?idProduct="+a.getIdAdvert();
		} else {
			int idAdvert = a.getIdAdvert();
			
			Offer offer = new Offer();
			
			if(a.getCurrentPrice()>=currentPrice) {
				return "redirect:/auction/advert?idProduct="+idAdvert;
			} 
			
			a.setCurrentPrice(advert.getCurrentPrice());
			
			offer.setAdvert(a);
			offer.setUser(u);	
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			offer.setTime(format.format(new Date()));
			offer.setPrice(a.getCurrentPrice());
			
			as.save(a);
			os.save(offer);
			
			request.getSession().setAttribute("offers", offers);
			request.getSession().setAttribute("offer", offer);
			request.getSession().setAttribute("advert", a);
			
			return "redirect:/auction/advert?idProduct="+idAdvert;
		}	
	}
	
}
