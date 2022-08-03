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
@Table(name = "challange_count")
@NamedQuery(name="ChallangeCount.findAll", query="SELECT c FROM ChallangeCount c")
public class ChallangeCount implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(length=200)
	private String sessionid; 
	private int status; 
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getTotaltime() {
		return totaltime;
	}
	public void setTotaltime(int totaltime) {
		this.totaltime = totaltime;
	}
	@Override
	public String toString() {
		return "ChallangeCount [id=" + id + ", sessionid=" + sessionid + ", status=" + status + ", totaltime="
				+ totaltime + "]";
	} 
	
	
	 
}
