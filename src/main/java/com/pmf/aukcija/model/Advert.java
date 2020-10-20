package com.pmf.aukcija.model;

import java.io.Serializable;
import javax.persistence.*;

import java.util.List;


/**
 * The persistent class for the Advert database table.
 * 
 */
@Entity
@NamedQuery(name="Advert.findAll", query="SELECT a FROM Advert a")
public class Advert implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idAdvert;
	
	private String time;

	private double currentPrice;

	private String description;

	private byte isActive;

	private String name;

	private String ratingBuyer;
	
	private String ratingSeller;

	private double startingPrice;
	
	private String buyer;
	

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="fk_idUserSeller")
	private User user;

	//bi-directional many-to-one association to AdvertCategory
	@ManyToOne
	@JoinColumn(name="fk_idAdvertCategory")
	private AdvertCategory category;

	//bi-directional many-to-one association to Message
	@OneToMany(mappedBy="advert")
	private List<Message> messages;

	//bi-directional many-to-one association to Offer
	@OneToMany(mappedBy="advert")
	private List<Offer> offers;

	//bi-directional many-to-one association to Rating
	@OneToMany(mappedBy="advert")
	private List<Rating> ratings;
	
	

	public Advert() {
	}

	public int getIdAdvert() {
		return this.idAdvert;
	}

	public void setIdAdvert(int idAdvert) {
		this.idAdvert = idAdvert;
	}

	public double getCurrentPrice() {
		return this.currentPrice;
	}

	public void setCurrentPrice(double currentPrice) {
		this.currentPrice = currentPrice;
	}

	public String getDescription() {
		return this.description;
	}
	
	public String getTime() {
		return this.time;
	}

	public void setTime(String string) {
		this.time = string;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public byte getIsActive() {
		return this.isActive;
	}

	public void setIsActive(byte isActive) {
		this.isActive = isActive;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRatingBuyer() {
		return this.ratingBuyer;
	}
	
	public void setRatingBuyer(String ratingBuyer) {
		this.ratingBuyer = ratingBuyer;
	}

	public void setRatingSeller(String ratingSeller) {
		this.ratingSeller = ratingSeller;
	}
	
	public String getRatingSeller() {
		return this.ratingSeller;
	}




	public double getStartingPrice() {
		return this.startingPrice;
	}

	public void setStartingPrice(double startingPrice) {
		this.startingPrice = startingPrice;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public AdvertCategory getAdvertCategory() {
		return this.category;
	}

	public void setAdvertCategory(AdvertCategory category) {
		this.category=category;
	}

	public List<Message> getMessages() {
		return this.messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

	public Message addMessage(Message message) {
		getMessages().add(message);
		message.setAdvert(this);

		return message;
	}

	public Message removeMessage(Message message) {
		getMessages().remove(message);
		message.setAdvert(null);

		return message;
	}

	public List<Offer> getOffers() {
		return this.offers;
	}

	public void setOffers(List<Offer> offers) {
		this.offers = offers;
	}

	public Offer addOffer(Offer offer) {
		getOffers().add(offer);
		offer.setAdvert(this);

		return offer;
	}

	public Offer removeOffer(Offer offer) {
		getOffers().remove(offer);
		offer.setAdvert(null);

		return offer;
	}

	public List<Rating> getRatings() {
		return this.ratings;
	}

	public void setRatings(List<Rating> ratings) {
		this.ratings = ratings;
	}

	public Rating addRating(Rating rating) {
		getRatings().add(rating);
		rating.setAdvert(this);

		return rating;
	}

	public Rating removeRating(Rating rating) {
		getRatings().remove(rating);
		rating.setAdvert(null);

		return rating;
	}

	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}

}