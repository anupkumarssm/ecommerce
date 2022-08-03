package com.learn.edu.entity; 
import java.io.Serializable;
import javax.persistence.*;
 
@Entity
@NamedQuery(name="Orderitem.findAll", query="SELECT c FROM Orderitem c")
public class Orderitem implements Serializable {
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
	private String orderno;
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
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
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
	public String getOrderno() {
		return orderno;
	}
	public void setOrderno(String orderno) {
		this.orderno = orderno;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Orderitem [id=" + id + ", pname=" + pname + ", pid=" + pid + ", pprice=" + pprice + ", pqty=" + pqty
				+ ", pimg=" + pimg + ", username=" + username + ", orderno=" + orderno + ", getId()=" + getId()
				+ ", getPname()=" + getPname() + ", getPid()=" + getPid() + ", getPprice()=" + getPprice()
				+ ", getPqty()=" + getPqty() + ", getPimg()=" + getPimg() + ", getUsername()=" + getUsername()
				+ ", getOrderno()=" + getOrderno() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
}