package com.zking.domain;

public class Hallinfo {
	private int hid;
	private int cid;
	private int mid;
	private int price;
	private String hname;
	private String sess;
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
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
	public Hallinfo() {

	}
	public Hallinfo(int hid, int cid, int mid, int price, String hname,
			String sess) {
		this.hid = hid;
		this.cid = cid;
		this.mid = mid;
		this.price = price;
		this.hname = hname;
		this.sess = sess;
	}
	
	
}
