package com.pmf.aukcija.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pmf.aukcija.model.AdvertCategory;
import com.pmf.aukcija.repository.AdvertCategoryRepository;

@Service
public class AdvertCategoryService {
	
	@Autowired
	AdvertCategoryRepository acr;

	public List<AdvertCategory> getAllAdvertCategories() {
		return acr.findAll();
	}
	
	public AdvertCategory getAdvertCategoryById(int id) {
		return acr.findById(id);
	}
	
}
