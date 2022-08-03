package com.learn.edu.entity;

import java.io.Serializable;
import javax.persistence.*;
import java.sql.Timestamp;


/**
 * The persistent class for the question database table.
 * 
 */
@Entity
@NamedQuery(name="Question.findAll", query="SELECT q FROM Question q")
public class Question implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private Timestamp createdon;
	
	@Column(columnDefinition="TEXT")
	private String name;
	
	private int subcategoryid;

	public Question() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Timestamp getCreatedon() {
		return this.createdon;
	}

	public void setCreatedon(Timestamp createdon) {
		this.createdon = createdon;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSubcategoryid() {
		return subcategoryid;
	}

	public void setSubcategoryid(int subcategoryid) {
		this.subcategoryid = subcategoryid;
	}

	@Override
	public String toString() {
		return "Question [id=" + id + ", createdon=" + createdon + ", name=" + name + ", subcategoryid=" + subcategoryid
				+ "]";
	}

}