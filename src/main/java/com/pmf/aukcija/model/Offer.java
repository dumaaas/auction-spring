package com.pmf.aukcija.model;

import java.io.Serializable;
import javax.persistence.*;

@Entity
@NamedQuery(name="Offer.findAll", query="SELECT o FROM Offer o")
public class Offer implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idOffer;

	private String time;	
	
	private double price;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="fk_idUserBuyer")
	private User user;

	//bi-directional many-to-one association to Advert
	@ManyToOne
	@JoinColumn(name="fk_idAdvert")
	private Advert advert;

	public Offer() {
	}

	public int getIdOffer() {
		return this.idOffer;
	}

	public void setIdOffer(int idOffer) {
		this.idOffer = idOffer;
	}

	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public String getTime() {
		return this.time;
	}

	public void setTime(String string) {
		this.time = string;
	}

	public Advert getAdvert() {
		return this.advert;
	}

	public void setAdvert(Advert advert) {
		this.advert = advert;
	}

}