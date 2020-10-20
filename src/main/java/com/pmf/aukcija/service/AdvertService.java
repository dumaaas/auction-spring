package com.pmf.aukcija.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pmf.aukcija.model.Advert;
import com.pmf.aukcija.model.AdvertCategory;
import com.pmf.aukcija.model.User;
import com.pmf.aukcija.repository.AdvertRepository;

@Service
public class AdvertService {

	@Autowired
	AdvertRepository ar;
	
	public List<Advert> getAllByUser(User u) {
		return ar.findByUser(u);
	}
	
	public List<Advert> getAllByIsActive(byte isActive) {
		return ar.findAllByIsActive(isActive);
	}
	
	public List<Advert> getAllByOrderByIdAdvertDesc() {
		return ar.findAllByOrderByIdAdvertDesc();
	}
	
	public List<Advert> getAdvertsByUserByOrderByIdAdvertDesc(User u) {
		return ar.findByUserOrderByIdAdvertDesc(u);
	}
	
	public List<Advert> getAdvertsByUserAndIsActive(User u, byte isActive) {
		return ar.findByUserAndIsActiveOrderByIdAdvertDesc(u, isActive);
	}
	
	public List<Advert> getAdvertsByCategory(AdvertCategory ac) {
		return ar.findByCategoryOrderByIdAdvertDesc(ac);
	}
	
	public Advert getAdvertById(int id) {
		return ar.findById(id);
	}
	
	public List<Advert> getAllAdverts() {
		return ar.findAll();
	}
	
	public void save(Advert a) {
		ar.save(a);
	}
	
}
