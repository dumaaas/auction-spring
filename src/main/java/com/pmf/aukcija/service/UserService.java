package com.pmf.aukcija.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pmf.aukcija.model.Advert;
import com.pmf.aukcija.model.Offer;
import com.pmf.aukcija.model.User;
import com.pmf.aukcija.repository.UserRepository;


@Service
public class UserService  {
	
	@Autowired
	UserRepository ur;
	
	public User getUserByUsernameAndPassword2(String username, String password) {
		return ur.findByUsernameAndPassword2(username, password);
	}
	
	public boolean isEmailValid(String email) {
		if(!email.contains("@")) {
			return true;
		}
		return false;
	}
	
	public boolean isUsernameShort(String username) {
		if(username.length()<6) {
			return true;
		}
		return false;
	}
	
	public boolean isFieldEmpty(String smth) {
		if(smth.length()==0) {
			return true;
		}
		return false;
	}
	
	public boolean isPasswordShort(String password) {
		if(password.length()<6) {
			return true;
		}
		return false;
	}
	
	public boolean doesPasswordsMatch(String password1, String password2) {
		if(!password1.equals(password2)) {
			return true;
		}
		return false;
	}
	
    public boolean isUserPresent(String username) {
    	User u = ur.findByUsername(username);
    	if(u!=null) {
    		return true;
    	} 
    	return false;
    	
    }
    
    public boolean isUserPresentEmail(String email) {
    	User u = ur.findByEmail(email);
    	if(u!=null) {
    		return true;
    	} 
    	return false;
    	
    }
	
	public User getUserByOffer(Offer offer) {
		return ur.findUserByOffers(offer);
	}
	
	public User getUserByFirstname(String firstname) {
		return ur.findByFirstname(firstname);
	}
	
	public List<User> getAllUser() {
		return ur.findAll();
	}
	
	public User getUserByUsername(String username) {
		return ur.findByUsername(username);
	}
	
	public User getUserByUsernameAndPassword(String username, String password) {
		return ur.findByUsernameAndPassword(username, password);
	}
	
	public User getUserByEmail(String email) {
		return ur.findByEmail(email);
	}
	
	public User getUserById(int idUser) {
		return ur.findById(idUser);
	}
	
	public User getUseryByAdverts(Advert advert) {
		return ur.findByAdverts(advert);
	}
	
	public void save(User u) {
		ur.save(u);
	}

}
