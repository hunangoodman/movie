package com.zking.domain;

public class YuanXian {
	private int cid;
	private int hid;
	private int mid;
	private int price;
	private String cname;
	private String caddress;
	private String hname;
	private String sess;
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCaddress() {
		return caddress;
	}
	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}
	public String getHname() {
		return hname;
	}
	public void setHname(String hname) {
		this.hname = hname;
	}
	public String getSess() {
		return sess;
	}
	public void setSess(String sess) {
		this.sess = sess;
	}
	
	public YuanXian(int cid, int hid, int mid, int price,String cname,
			String caddress, String hname, String sess) {
		this.cid = cid;
		this.hid = hid;
		this.mid = mid;
		this.price = price;
		this.cname = cname;
		this.caddress = caddress;
		this.hname = hname;
		this.sess = sess;
	}
	public YuanXian() {
	}
	
}
