package com.zking.domain;

public class Order {
	//rs.getString("uname"),rs.getString("cname"),rs.getString("hname"),rs.getInt("zuo"),
	private int oid;
	private String uname;
	private String cname;
	private String hname;
	private int zuo;
	private String sess;
	private String uid;
	private int sumprice;
	private int price;
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getOid() {
		return oid;
	}
	public void setOid(int oid) {
		this.oid = oid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public int getZuo() {
		return zuo;
	}
	public void setZuo(int zuo) {
		this.zuo = zuo;
	}
	public String getSess() {
		return sess;
	}
	public void setSess(String sess) {
		this.sess = sess;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Order() {
		
	}
	public Order(int oid,String uname, String cname, String hname, int zuo,
			String sess, String uid,int sumprice,int price) {
		super();
		this.oid=oid;
		this.uname = uname;
		this.cname = cname;
		this.hname = hname;
		this.zuo = zuo;
		this.sess = sess;
		this.uid = uid;
		this.sumprice=sumprice;
		this.price=price;
	}
}