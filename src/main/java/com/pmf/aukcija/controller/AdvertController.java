package com.pmf.aukcija.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;



@Controller
@RequestMapping(value="/auction")
public class AdvertController {
	
	@Autowired
	UserService us;
	
	@Autowired
	AdvertCategoryService acs;
	
	@Autowired
	AdvertService as;
	
	@Autowired
	OfferService os;
	
	@Autowired
	MessageService ms;
	
	@Autowired 
	RatingService rs;
	
	//Method for viewing specific auctions after filter form in welcome.jsp
	@RequestMapping(value="showAdverts", method=RequestMethod.POST)
	public String showAdverts(@ModelAttribute("advertCategory") Integer advertCategory, ModelMap modelMap) {
		List<AdvertCategory> advertCategories = acs.getAllAdvertCategories();
		List<Message> messages = ms.getAllMessages();
		AdvertCategory ac = acs.getAdvertCategoryById(advertCategory);
		List<Advert> adverts = as.getAdvertsByCategory(ac);
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
		
		modelMap.addAttribute("messages", messages);
		modelMap.addAttribute("advertCategories", advertCategories);
		modelMap.addAttribute("buyer", finalno);
		modelMap.addAttribute("adverts", adverts);
		
		return "welcome";
	}
	
	//Method for viewing specific advert we choose from welcome page
	@RequestMapping(value="advert", method=RequestMethod.GET)
	public String advert(@RequestParam(value ="idProduct", required =false) Integer id, ModelMap modelMap, HttpServletRequest request) {
		Advert advert = as.getAdvertById(id);
		List<Offer> offers = os.getOffersByAdvert(advert);
		User u = us.getUseryByAdverts(advert);
		Rating rating = rs.getRatingByUserAndAdvert(u, advert);
		List<Offer> o = os.getOffersByAdvert(advert); 
		List<Message> messages = ms.getAllMessages();
		
		//Finding offer with bigest price so we can get buyer of specific advert
		double price=0;
		
		for(Offer offer : o) {
			double offerPrice = offer.getPrice();
			if(price < offerPrice) {
				price = offerPrice;
			}
		}
		
		Offer buyer = os.getOfferByPriceAndAdvert(price, advert);
		
		modelMap.addAttribute("buyer", buyer);
		request.getSession().setAttribute("messages", messages);
		request.getSession().setAttribute("rating", rating);
		request.getSession().setAttribute("offers", offers);
		request.getSession().setAttribute("advert", advert);
		
		return "advert";	
	}
	
	//Method for closing bid. If user is owner of auction, he can close auction on button ACTIVE..
	@RequestMapping(value="closeBid", method=RequestMethod.GET) 
	public String closeBid(@RequestParam(value="idProduct", required=false) Integer id, ModelMap modelMap,  HttpServletRequest request) {
		Advert advert = as.getAdvertById(id);
		User userAdvert = us.getUseryByAdverts(advert);
		User userLogedIn = (User) request.getSession().getAttribute("user");
		int idUserAdvert = userAdvert.getIdUser();
		int idUserLogedIn = userLogedIn.getIdUser();
		Rating rating = rs.getRatingByUserAndAdvert(userAdvert, advert);
		
		//Checking if logedIn user is owner of the advert so if he is, he can close auction. If he is not,
		//he can't. If auction is closed, we update advert in DB.
		if(idUserAdvert==idUserLogedIn) {
			double price=0;
			advert.setIsActive((byte) 0);
			List<Offer> o = os.getOffersByAdvert(advert); 
			
			for(Offer offer : o) {
				double offerPrice = offer.getPrice();
				if(price < offerPrice) {
					price = offerPrice;
					System.out.println(price);
				}
			}
			
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			advert.setTime(format.format(new Date()));
			
			Offer buyer = os.getOfferByPriceAndAdvert(price, advert);
			User buyer2 = us.getUserByOffer(buyer);
				
			advert.setBuyer(buyer2.getUsername());	
			as.save(advert);
			
			modelMap.addAttribute("buyer", buyer);	
			request.getSession().setAttribute("rating", rating);
			request.getSession().setAttribute("advert", advert);
			
			return "redirect:advert?idProduct="+id;
		}
		
		modelMap.addAttribute("rating", rating);
		request.getSession().setAttribute("advert", advert);
		
		return "redirect:advert?idProduct="+id;
	}
	
	//When we visit specific advert, we are allowed to add comments while advert is active
	@RequestMapping(value="addComment", method=RequestMethod.POST) 
	public String addComment(@RequestParam("content") String content, HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
		Advert a = (Advert) request.getSession().getAttribute("advert");
		List<Message> messages = ms.getAllMessages();
		int id = a.getIdAdvert();
		
		Message message = new Message();
		
		message.setUser(u);
		message.setAdvert(a);
		message.setContent(content);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		message.setTime(format.format(new Date()));
		
		ms.save(message);
		
		request.getSession().setAttribute("messages", messages);
	
		return "redirect:advert?idProduct="+id;
	}
	
	//Method for sending user to addAuction.jsp
	@RequestMapping(value="addAuction", method=RequestMethod.GET)
	public String addAuction(HttpServletRequest request) {
		return "addAuction";
	}
	
	//Method that allows us to add new auction and store it in our DB..
	@RequestMapping(value="newAuction", method=RequestMethod.POST)
	public String newAuction(@RequestParam(value="name", required=false) String name, @RequestParam(value="description", required=false) String description, @RequestParam(value="startingPrice", required=false) Double startingPrice, @RequestParam(value="advertCategory", required=false) Integer idAdvertCategory, HttpServletRequest request) {
		AdvertCategory ac = acs.getAdvertCategoryById(idAdvertCategory);
		User u = (User) request.getSession().getAttribute("user");
		
		Advert newAdvert = new Advert();
		
	    newAdvert.setAdvertCategory(ac);
		newAdvert.setUser(u);
		newAdvert.setStartingPrice(startingPrice);
		newAdvert.setCurrentPrice(startingPrice);
		newAdvert.setName(name);
		newAdvert.setDescription(description);
		newAdvert.setIsActive((byte) 1);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		newAdvert.setTime(format.format(new Date()));
		
		as.save(newAdvert);
		
		String success = "You just added new advert: "+newAdvert.getName();
		
		request.getSession().setAttribute("success", success);
		request.getSession().setAttribute("newAdvert", newAdvert);
		
		return "advertNew";
	}
	
	//Method that shows all auctions that loged in user set on auction
	@RequestMapping(value="showAdvertsActiveClosed", method=RequestMethod.POST)
	public String showAdvertsActiveClosed(@RequestParam(value="isActive", required=false) Byte isActive, ModelMap modelMap, HttpServletRequest request) {
		//nadji listu usera po oglasu
		User u = (User) request.getSession().getAttribute("user");
		List<Advert> adverts = as.getAdvertsByUserAndIsActive(u, (byte) isActive);

		modelMap.addAttribute("adverts", adverts);

		return "myAuctions";
		
	}
	
	//Method that get informations about adverts and send user on myAuction.jsp
	@RequestMapping(value="myAuctions", method=RequestMethod.GET) 
	public String myAuctions(HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
		List<Advert> adverts = as.getAdvertsByUserByOrderByIdAdvertDesc(u);
		List<Offer> finalno = new ArrayList<Offer>();
		
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
		
		request.getSession().setAttribute("buyer", finalno);
		request.getSession().setAttribute("adverts", adverts);
		
		return "myAuctions";
		
	}
	
	//Method that show all auction where user bid..
	@RequestMapping(value="showAdvertsBids", method=RequestMethod.GET)
	public String showAdvertsBids(ModelMap modelMap, HttpServletRequest request) {
		User u = (User) request.getSession().getAttribute("user");
		List<Advert> adverts = as.getAllByOrderByIdAdvertDesc();
		List<Offer> offers = os.getAllOffersByOrderByIdOfferDesc();
		List<Rating> ratings = rs.getAllRatings();
		List<Offer> finalno = new ArrayList<Offer>();
		List<Offer> myBids = new ArrayList<Offer>();
		
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
		
		for(Advert a : adverts) {
			List<Offer> of = (List<Offer>) os.getOffersByUserAndAdvert(u, a);
			double price=0;

			for(Offer offer : of) {
				double offerPrice = offer.getPrice();
				if(price < offerPrice) {
					price = offerPrice;
					System.out.println(price);
				}
			}
			
			Offer buyer = os.getOfferByPriceAndAdvert(price, a);
			myBids.add(buyer);
		}
		
		modelMap.addAttribute("offers", offers);
		modelMap.addAttribute("ratings", ratings);
		modelMap.addAttribute("offer1", finalno);
		modelMap.addAttribute("myBids", myBids);
		
		return "myBids";
		
	}
	
	@RequestMapping(value="activeAdvertReport", method=RequestMethod.GET) 
	public void activeAdvertReport(HttpServletResponse response) throws Exception { 
		List<Advert> activeAdverts = as.getAllByIsActive((byte) 1);
		
		response.setContentType("text/html");
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(activeAdverts);
		InputStream inputStream = this.getClass().getResourceAsStream("/jasperreports/ActiveAuctionsReport.jrxml");
		JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
		Map<String, Object> params = new HashMap<String, Object>();
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
		inputStream.close();
		
		response.setContentType("application/x-download");
		response.addHeader("Content-disposition", "attachment; filename=ActiveAuctionsReport.pdf");
		OutputStream out = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint,out);
	}
	
	@RequestMapping(value="closedAuctionsReport", method=RequestMethod.GET) 
	public void closedAuctionsReport(HttpServletResponse response, HttpServletRequest request) throws Exception { 
		User u = (User) request.getSession().getAttribute("user");
		List<Advert> closedAdverts = as.getAdvertsByUserAndIsActive(u, (byte) 0) ;
		List<Offer> finalno = new ArrayList<Offer>();
		
		for(Advert a : closedAdverts) {
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
		
		for(Offer o : finalno) {
			for(Advert a : closedAdverts) {
				if(o.getAdvert().getIdAdvert()==a.getIdAdvert()) {
					
				}
			}
		}
		int size = closedAdverts.size();
		response.setContentType("text/html");
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(closedAdverts);
		InputStream inputStream = this.getClass().getResourceAsStream("/jasperreports/MyClosedAuctions.jrxml");
		JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("size", size);
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
		inputStream.close();
		
		response.setContentType("application/x-download");
		response.addHeader("Content-disposition", "attachment; filename=MyClosedAuctions.pdf");
		OutputStream out = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint,out);
	}
	
}
