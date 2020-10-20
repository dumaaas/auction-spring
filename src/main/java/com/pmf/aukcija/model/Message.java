package com.pmf.aukcija.model;

import java.io.Serializable;
import javax.persistence.*;



/**
 * The persistent class for the Message database table.
 * 
 */
@Entity
@NamedQuery(name="Message.findAll", query="SELECT m FROM Message m")
public class Message implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idMessage;

	private String content;

	private String time;

	//bi-directional many-to-one association to User
	@ManyToOne
	@JoinColumn(name="fk_idUserBuyer")
	private User user;

	//bi-directional many-to-one association to Advert
	@ManyToOne
	@JoinColumn(name="fk_idAdvert")
	private Advert advert;

	public Message() {
	}

	public int getIdMessage() {
		return this.idMessage;
	}

	public void setIdMessage(int idMessage) {
		this.idMessage = idMessage;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTime() {
		return this.time;
	}

	public void setTime(String string) {
		this.time = string;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Advert getAdvert() {
		return this.advert;
	}

	public void setAdvert(Advert advert) {
		this.advert = advert;
	}

}