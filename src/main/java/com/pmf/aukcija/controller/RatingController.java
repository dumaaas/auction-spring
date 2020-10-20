package com.pmf.aukcija.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pmf.aukcija.model.Advert;
import com.pmf.aukcija.model.Offer;
import com.pmf.aukcija.model.Rating;
import com.pmf.aukcija.model.User;
import com.pmf.aukcija.service.AdvertService;
import com.pmf.aukcija.service.OfferService;
import com.pmf.aukcija.service.RatingService;
import com.pmf.aukcija.service.UserService;

@Controller
@RequestMapping(value="/auction")
public class RatingController {
	
	
	@Autowired
	AdvertService as;
	
	@Autowired
	UserService us;
	
	@Autowired 
	OfferService os;
	
	@Autowired
	RatingService rs;
	
	//Method used so user can rate buyer of his product
	@RequestMapping(value="rateBuyer", method=RequestMethod.POST) 
	public String rateBuyer(ModelMap modelMap, @RequestParam(value="ratingBuyer", required=false) String ratingBuyer, HttpServletRequest request) {
		Advert a = (Advert) request.getSession().getAttribute("advert");
		User u = (User) request.getSession().getAttribute("user");
		List<Advert> adverts = as.getAdvertsByUserByOrderByIdAdvertDesc(u);
		List<Offer> o = os.getOffersByAdvert(a);
		List<Rating> ratings = rs.getAllRatings();

		a.setRatingBuyer(ratingBuyer);
		
		as.save(a);
		
		double price=0;
		
		for(Offer offer : o) {
			double offerPrice = offer.getPrice();
			if(price < offerPrice) {
				price = offerPrice;
				System.out.println(price);
			}
		}
		
		Offer buyer = os.getOfferByPriceAndAdvert(price, a);	
		User realBuyer = buyer.getUser();	
	
		Rating rateBuyer = new Rating();
		
		Date date = new Date();	
		rateBuyer.setUser(realBuyer);
		rateBuyer.setAdvert(a);
		rateBuyer.setRateBuyer(ratingBuyer);
		rateBuyer.setTime(new Timestamp(date.getTime()));
		
		rs.save(rateBuyer);
		
		request.getSession().setAttribute("ratings", ratings);
		request.getSession().setAttribute("advert", a);
		request.getSession().setAttribute("adverts", adverts);
		
		return "myAuctions";
	}
	
	//Method used so user can rate user which sell product
	@RequestMapping(value="rateSeller", method=RequestMethod.POST) 
	public String rateSeller(@RequestParam(value="ratingSeller", required=false) String ratingSeller, HttpServletRequest request) {
		Advert a = (Advert) request.getSession().getAttribute("advert");
		List<Offer> offers = os.getAllOffersByOrderByIdOfferDesc();
		User u = us.getUseryByAdverts(a);
		List<Rating> ratings = rs.getAllRatings();
		User u2 = (User) request.getSession().getAttribute("user");
		List<Advert> adverts = as.getAllByOrderByIdAdvertDesc();
		List<Offer> finalno = new ArrayList<Offer>();
		List<Offer> myBids = new ArrayList<Offer>();
		
		a.setRatingSeller(ratingSeller);
		
		as.save(a);
		
		Rating rateBuyer = new Rating();
		
		Date date = new Date();
		rateBuyer.setUser(u);
		rateBuyer.setAdvert(a);
		rateBuyer.setRateSeller(ratingSeller);
		rateBuyer.setTime(new Timestamp(date.getTime()));
		
		rs.save(rateBuyer);
		
		for(Advert a2 : adverts) {
			List<Offer> o = os.getOffersByAdvert(a2); 
			double price=0;

			for(Offer offer : o) {
				double offerPrice = offer.getPrice();
				if(price < offerPrice) {
					price = offerPrice;
					System.out.println(price);
				}
			}
			
			Offer buyer = os.getOfferByPriceAndAdvert(price, a2);
			finalno.add(buyer);
			
		}
		
		for(Advert a2 : adverts) {
			List<Offer> of = (List<Offer>) os.getOffersByUserAndAdvert(u2, a2);
			double price=0;

			for(Offer offer : of) {
				double offerPrice = offer.getPrice();
				if(price < offerPrice) {
					price = offerPrice;
					System.out.println(price);
				}
			}
			
			Offer buyer = os.getOfferByPriceAndAdvert(price, a2);
			myBids.add(buyer);
		}
		
		request.getSession().setAttribute("offer1", finalno);
		request.getSession().setAttribute("myBids", myBids);
		request.getSession().setAttribute("offers", offers);
		request.getSession().setAttribute("ratings", ratings);
		request.getSession().setAttribute("advert", a);
		
		return "myBids";
	}
	
	
	
	//Method we use after form for showing all rates for one user we select from chechbox 
	//he get as a buyer and a seller.. also we can see how many POSITIVE, NEGATIVE, NEUTRAL user have..
	@RequestMapping(value="showRatings", method=RequestMethod.GET) 
	public String myRatings(HttpServletRequest request) {
		request.getSession().setAttribute("u", null);
		List<User> users = us.getAllUser();
		List<Advert> adverts = as.getAllByOrderByIdAdvertDesc();
		List<Rating> myRatings = rs.getAllRatingByOrderByIdRatingDesc();
		List<Offer> finalno = new ArrayList<Offer>();
		
		for(Advert a : adverts) {
			List<Offer> o = os.getOffersByAdvert(a); 
			double price=0;

			for(Offer offer : o) {
				if(offer!=null) {
					double offerPrice = offer.getPrice();
					if(price < offerPrice) {
						price = offerPrice;
						System.out.println(price);
					}
				} 
				
			}
			
			Offer buyer = os.getOfferByPriceAndAdvert(price, a);
			
			finalno.add(buyer);
		}
		
		String pozitivna = "POSITIVE";
		String negativna = "NEGATIVE";
		String neutralna = "NEUTRAL";
		
		int positiveRating2 = 0;
		int negativeRating2 = 0;
		int neutralRating2 = 0;

		User user = (User) request.getSession().getAttribute("user");
		
		for(Offer o : finalno) {
			try {
				if(user.getIdUser()==o.getUser().getIdUser()) {
					System.out.println("ODJE NE?");
					if(pozitivna.equals(o.getAdvert().getRatingBuyer())) {
						positiveRating2++;
						System.out.println("POZ:"+positiveRating2);
					}
					
					if(negativna.equals(o.getAdvert().getRatingBuyer())) {
						negativeRating2++;
						System.out.println("NEG:"+negativeRating2);
					}
					
					if(neutralna.equals(o.getAdvert().getRatingBuyer())) {
						neutralRating2++;
						System.out.println("NEU:"+neutralRating2);
					}
					
				} else {
					System.out.println("Lagano");
				}
			} catch(NullPointerException e) {
				System.out.println("Null!");
			}
			
		}
		
		int total2=positiveRating2+negativeRating2+neutralRating2;
		
		if(positiveRating2==0) {
			String ratingOveralPositive2 = "0/"+total2;
			request.getSession().setAttribute("ratingOveralPositive2", ratingOveralPositive2);
		} else {
			String ratingOveralPositive2 = positiveRating2+"/"+total2;
			request.getSession().setAttribute("ratingOveralPositive2", ratingOveralPositive2);
		}
		
		if(negativeRating2==0) {
			String ratingOveralNegative2 = "0/"+total2;
			request.getSession().setAttribute("ratingOveralNegative2", ratingOveralNegative2);
		} else {
			String ratingOveralNegative2 = negativeRating2+"/"+total2;
			request.getSession().setAttribute("ratingOveralNegative2", ratingOveralNegative2);
		}
		
		if(neutralRating2==0) {
			String ratingOveralNeutral2 = "0/"+total2;
			request.getSession().setAttribute("ratingOveralNeutral2", ratingOveralNeutral2);
		}  else {
			String ratingOveralNeutral2 = neutralRating2+"/"+total2;
			request.getSession().setAttribute("ratingOveralNeutral2", ratingOveralNeutral2);
		}
	
		int positiveRating = 0;
		int negativeRating = 0;
		int neutralRating = 0;
		
		List<Advert> advertsUser = as.getAdvertsByUserByOrderByIdAdvertDesc(user);
		
		for(Advert ad : advertsUser) {
			
			if(pozitivna.equals(ad.getRatingSeller())) {
				positiveRating++;
				System.out.println("POZ:"+positiveRating);
			} else if(negativna.equals(ad.getRatingSeller())){
				negativeRating++;
				System.out.println("NEG:"+negativeRating);
			} else if(neutralna.equals(ad.getRatingSeller())) {
				neutralRating++;
				System.out.println("NEU:"+neutralRating);
			}
			
		}
		
		int total=positiveRating+negativeRating+neutralRating;
		
		if(positiveRating==0) {
			String ratingOveralPositive = "0/"+total;
			request.getSession().setAttribute("ratingOveralPositive", ratingOveralPositive);
		} else {
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
		}  else {
			String ratingOveralNeutral = neutralRating+"/"+total;
			request.getSession().setAttribute("ratingOveralNeutral", ratingOveralNeutral);
		}
		
		request.getSession().setAttribute("users", users);
		request.getSession().setAttribute("adverts", adverts);
		request.getSession().setAttribute("offers", finalno);
		request.getSession().setAttribute("myRatings", myRatings);
		
		return "myRatings";
	}
	
	//Method used so user who is loged in can see all rates he get as a seller and buyer from other users..
	@RequestMapping(value="myRatings", method=RequestMethod.POST)
	public String myRatings(@RequestParam(value="idUser", required=false) Integer idUser, HttpServletRequest request) {
		request.getSession().setAttribute("myRatings", null);
		User u = us.getUserById(idUser);
		List<Advert> adverts = as.getAllByOrderByIdAdvertDesc();
		List<Offer> offers = os.getAllOffers();
		List<Rating> ratings = rs.getRatingsByUserOrderByIdRatingDesc(u);
		List<Offer> finalno = new ArrayList<Offer>();
		
		for(Advert a : adverts) {
			List<Offer> o = os.getOffersByAdvert(a); 
			double price=0;

			for(Offer offer : o) {
				if(offer!=null) {
					double offerPrice = offer.getPrice();
					if(price < offerPrice) {
						price = offerPrice;
						System.out.println(price);
					}
				}
			}
			
			Offer buyer = os.getOfferByPriceAndAdvert(price, a);
			
			finalno.add(buyer);
			
		}
		
		String pozitivna = "POSITIVE";
		String negativna = "NEGATIVE";
		String neutralna = "NEUTRAL";
		
		int positiveRating2 = 0;
		int negativeRating2 = 0;
		int neutralRating2 = 0;

		
		for(Offer o : finalno) {
			try {
				if(u.getIdUser()==o.getUser().getIdUser()) {
					
					if(pozitivna.equals(o.getAdvert().getRatingBuyer())) {
						positiveRating2++;
						System.out.println("POZ:"+positiveRating2);
					}
					
					if(negativna.equals(o.getAdvert().getRatingBuyer())) {
						negativeRating2++;
						System.out.println("NEG:"+negativeRating2);
					}
					
					if(neutralna.equals(o.getAdvert().getRatingBuyer())) {
						neutralRating2++;
						System.out.println("NEU:"+neutralRating2);
					}
					
				}
			} catch(NullPointerException e) {
				System.out.println("Null!");
			}
			
		}
		
		int total2=positiveRating2+negativeRating2+neutralRating2;
		
		if(positiveRating2==0) {
			String ratingOveralPositive2 = "0/"+total2;
			request.getSession().setAttribute("ratingOveralPositive2", ratingOveralPositive2);
		} else {
			String ratingOveralPositive2 = positiveRating2+"/"+total2;
			request.getSession().setAttribute("ratingOveralPositive2", ratingOveralPositive2);
		}
		
		if(negativeRating2==0) {
			String ratingOveralNegative2 = "0/"+total2;
			request.getSession().setAttribute("ratingOveralNegative2", ratingOveralNegative2);
		} else {
			String ratingOveralNegative2 = negativeRating2+"/"+total2;
			request.getSession().setAttribute("ratingOveralNegative2", ratingOveralNegative2);
		}
		
		if(neutralRating2==0) {
			String ratingOveralNeutral2 = "0/"+total2;
			request.getSession().setAttribute("ratingOveralNeutral2", ratingOveralNeutral2);
		}  else {
			String ratingOveralNeutral2 = neutralRating2+"/"+total2;
			request.getSession().setAttribute("ratingOveralNeutral2", ratingOveralNeutral2);
		}
		
		int positiveRating = 0;
		int negativeRating = 0;
		int neutralRating = 0;
		
		List<Advert> advertsUser = as.getAdvertsByUserByOrderByIdAdvertDesc(u);
		
		for(Advert ad : advertsUser) {
			
			if(pozitivna.equals(ad.getRatingSeller())) {
				positiveRating++;
				System.out.println("POZ:"+positiveRating);
			} else if(negativna.equals(ad.getRatingSeller())){
				negativeRating++;
				System.out.println("NEG:"+negativeRating);
			} else if(neutralna.equals(ad.getRatingSeller())) {
				neutralRating++;
				System.out.println("NEU:"+neutralRating);
			}
		}
		
		
		int total=positiveRating+negativeRating+neutralRating;
		
		if(positiveRating==0) {
			String ratingOveralPositive = "0/"+total;
			request.getSession().setAttribute("ratingOveralPositive", ratingOveralPositive);
		} else {
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
		}  else {
			String ratingOveralNeutral = neutralRating+"/"+total;
			request.getSession().setAttribute("ratingOveralNeutral", ratingOveralNeutral);
		}
		
		request.getSession().setAttribute("finalno", finalno);
		request.getSession().setAttribute("u", u);
		request.getSession().setAttribute("adverts", adverts);
		request.getSession().setAttribute("offers", offers);
		request.getSession().setAttribute("ratings", ratings);
		
		return "myRatings";
	}
	
}
