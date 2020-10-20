package com.pmf.aukcija.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pmf.aukcija.model.Advert;
import com.pmf.aukcija.model.Offer;
import com.pmf.aukcija.model.User;
import com.pmf.aukcija.repository.OfferRepository;

@Service
public class OfferService {
	
	@Autowired
	OfferRepository of;

	public List<Offer> getOffersByUserAndAdvert(User u, Advert a) {
		return of.getOffersByUserAndAdvert(u, a);
	}
	
	public List<Offer> getAllOffersByOrderByIdOfferDesc() {
		return of.findAllByOrderByIdOfferDesc();
	}
	
	public Offer getOfferByUserAndAdvert(User u, Advert a) {
		return of.findOfferByUserAndAdvert(u, a);
	}
	
	public List<Offer> getAllOffers() {
		return of.findAll();
	}
	
	public List<Offer> getOffersByAdvert(Advert a) {
		return of.findOfferByAdvertOrderByIdOfferDesc(a);
	}
	
	public Offer getOfferByPriceAndAdvert(double price, Advert advert) {
		return of.findOfferByPriceAndAdvert(price, advert);
	}
	
	public void save(Offer o) {
		of.save(o);
	}
}
