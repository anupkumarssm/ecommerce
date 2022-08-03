package com.learn.edu.entity;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the sub_category database table.
 * 
 */
@Entity
@Table(name="sub_category")
@NamedQuery(name="SubCategory.findAll", query="SELECT s FROM SubCategory s")
public class SubCategory implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	@Column(name="category_id")
	private int categoryId;
	@Column(length=100)
	private String name;
	
	@Column(length=100)
	private String price;
	
	@Column(length=100)
	private String description;
	
	@Column(length=100)
	private String image;

	private int status;

	public SubCategory() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCategoryId() {
		return this.categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatus() {
		return this.status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	

}