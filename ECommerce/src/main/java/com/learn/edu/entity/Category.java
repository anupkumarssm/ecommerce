package com.learn.edu.entity;

import java.io.Serializable;
import javax.persistence.*;

import org.springframework.web.multipart.MultipartFile;


/**
 * The persistent class for the category database table.
 * 
 */
@Entity
@NamedQuery(name="Category.findAll", query="SELECT c FROM Category c")
public class Category implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(length=100)
	private String name;
	private String image;
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	private int status;
	
	  @Transient
	    private MultipartFile productImage;
	  

	public Category() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
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
	 public MultipartFile getProductImage() {
	        return productImage;
	    }

	    public void setProductImage(MultipartFile productImage) {
	        this.productImage = productImage;
	    }
}