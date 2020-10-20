package com.pmf.aukcija.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.pmf.aukcija.model.Advert;
import com.pmf.aukcija.model.Offer;
import com.pmf.aukcija.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	public User findByUsernameAndPassword(String username, String password);
	public User findByUsername(String username);
	public User findByEmail(String email);
	public User findById(int idUser);
	public User findByAdverts(Advert advert);
	public User findByFirstname(String firstname);
	public User findUserByOffers(Offer offer);
	public User findByUsernameAndPassword2(String username, String password);
	
}
