package com.learn.edu.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
@Entity
@Table(name = "challange_time")
@NamedQuery(name="ChallengeTime.findAll", query="SELECT c FROM ChallengeTime c")
public class ChallengeTime implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(length=200)
	private String sessionid;  
	private int totaltime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSessionid() {
		return sessionid;
	}
	public void setSessionid(String sessionid) {
		this.sessionid = sessionid;
	}
	public int getTotaltime() {
		return totaltime;
	}
	public void setTotaltime(int totaltime) {
		this.totaltime = totaltime;
	}
	@Override
	public String toString() {
		return "ChallengeTime [id=" + id + ", sessionid=" + sessionid + ", totaltime=" + totaltime + "]";
	}
	
	
}
