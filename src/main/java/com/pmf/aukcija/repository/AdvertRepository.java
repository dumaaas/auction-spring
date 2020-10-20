package com.pmf.aukcija.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.pmf.aukcija.model.Advert;
import com.pmf.aukcija.model.AdvertCategory;
import com.pmf.aukcija.model.User;

public interface AdvertRepository extends JpaRepository<Advert, Integer>{
	public List<Advert> findByCategoryOrderByIdAdvertDesc(AdvertCategory ac);
	public Advert findById(int id);
	public List<Advert> findByUserAndIsActiveOrderByIdAdvertDesc(User u, byte isActive);
	public List<Advert> findByUserOrderByIdAdvertDesc(User u);
	public List<Advert> findByUser(User u);
	public List<Advert> findAllByOrderByIdAdvertDesc();
	public List<Advert> findAllByIsActive(byte isActive);
}
