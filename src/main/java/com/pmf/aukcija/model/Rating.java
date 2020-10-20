package com.pmf.aukcija.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;


/**
 * The persistent class for the Rating database table.
 * 
 */
@Entity
@NamedQuery(name="Rating.findAll", query="SELECT r FROM Rating r")
public class Rating implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idRating;
	
	@Temporal(TemporalType.TIMESTAMP)
	private Date time;

	private String rateBuyer;

	private String rateSeller;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="fk_idUserBuyer")
	private User user;

	//bi-directional many-to-one association to Advert
	@ManyToOne
	@JoinColumn(name="fk_idAdvert")
	private Advert advert;

	public Rating() {
	}

	public int getIdRating() {
		return this.idRating;
	}

	public void setIdRating(int idRating) {
		this.idRating = idRating;
	}

	public String getRateBuyer() {
		return this.rateBuyer;
	}

	public void setRateBuyer(String rateBuyer) {
		this.rateBuyer = rateBuyer;
	}

	public String getRateSeller() {
		return this.rateSeller;
	}

	public void setRateSeller(String rateSeller) {
		this.rateSeller = rateSeller;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public Date getTime() {
		return this.time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Advert getAdvert() {
		return this.advert;
	}

	public void setAdvert(Advert advert) {
		this.advert = advert;
	}

}