package com.pmf.aukcija.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pmf.aukcija.model.Advert;
import com.pmf.aukcija.model.Offer;
import com.pmf.aukcija.model.User;

public interface OfferRepository extends JpaRepository<Offer, Integer> {
	public Offer findOfferByUserAndAdvert(User u, Advert a);
	public List<Offer> findOfferByAdvertOrderByIdOfferDesc(Advert a);
	public Offer findOfferByPriceAndAdvert(double price, Advert a);
	public List<Offer> findAllByOrderByIdOfferDesc();
	public List<Offer> getOffersByUserAndAdvert(User u, Advert a);
}
