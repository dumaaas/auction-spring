package com.pmf.aukcija.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pmf.aukcija.model.Advert;
import com.pmf.aukcija.model.Rating;
import com.pmf.aukcija.model.User;
import com.pmf.aukcija.repository.RatingRepository;

@Service
public class RatingService {
	
	@Autowired
	RatingRepository rr;

	public List<Rating> getAllRatingByOrderByIdRatingDesc() {
		return rr.findAllRatingByOrderByIdRatingDesc();
	}
	
	public Rating getRatingByUserAndAdvert(User u, Advert a) {
		return rr.findRatingByUserAndAdvert(u, a);
	}
	
	public List<Rating> getAllRatings() {
		return rr.findAll();
	}
	
	public Rating getRatingByUserAndAdvertAndRatingSeller(User u, Advert a, String rs) {
		return rr.findRatingByUserAndAdvertAndRateSeller(u, a, rs);
	}
	
	public Rating getRatingByUserAndAdvertAndRatingBuyer(User u, Advert a, String bs) {
		return rr.findRatingByUserAndAdvertAndRateBuyer(u, a, bs);
	}
	
	public void save(Rating r) {
		rr.save(r);
	}

	public List<Rating> getRatingsByUserOrderByIdRatingDesc(User u) {
		return rr.findRatingsByUserOrderByIdRatingDesc(u);
	}
}
