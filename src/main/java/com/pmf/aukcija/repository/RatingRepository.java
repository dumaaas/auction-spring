package com.pmf.aukcija.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pmf.aukcija.model.Advert;
import com.pmf.aukcija.model.Rating;
import com.pmf.aukcija.model.User;

public interface RatingRepository extends JpaRepository<Rating, Integer>{
	public Rating findRatingByUserAndAdvertAndRateSeller(User u, Advert a, String rs);
	public Rating findRatingByUserAndAdvertAndRateBuyer(User u, Advert a, String bs);
	public Rating findRatingByUserAndAdvert(User u, Advert a);
	public List<Rating> findAllRatingByOrderByIdRatingDesc();
	public List<Rating> findRatingsByUserOrderByIdRatingDesc(User u);
}
