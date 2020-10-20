package com.pmf.aukcija.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the AdvertCategory database table.
 * 
 */
@Entity
@NamedQuery(name="AdvertCategory.findAll", query="SELECT a FROM AdvertCategory a")
public class AdvertCategory implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idAdvertCategory;

	private String category;

	public AdvertCategory() {
	}

	public int getIdAdvertCategory() {
		return this.idAdvertCategory;
	}

	public void setIdAdvertCategory(int idAdvertCategory) {
		this.idAdvertCategory=idAdvertCategory;
	}

	public String getCategory() {
		return this.category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

}