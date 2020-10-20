package com.pmf.aukcija.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pmf.aukcija.model.AdvertCategory;

public interface AdvertCategoryRepository extends JpaRepository<AdvertCategory, Integer> {
	public AdvertCategory findById(int id);
}
