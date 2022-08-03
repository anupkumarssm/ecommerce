package com.learn.edu.entity; 
import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the category database table.
 * 
 */
@Entity
@NamedQuery(name="Cart.findAll", query="SELECT c FROM Cart c")
public class Cart implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	@Column(length=100)
	private String pname;
	private String pid;
	private String pprice;
	private String pqty;
	private String pimg;
	private String username;
	private int status;
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPprice() {
		return pprice;
	}
	public void setPprice(String pprice) {
		this.pprice = pprice;
	}
	public String getPqty() {
		return pqty;
	}
	public void setPqty(String pqty) {
		this.pqty = pqty;
	}
	public String getPimg() {
		return pimg;
	}
	public void setPimg(String pimg) {
		this.pimg = pimg;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	
 

}