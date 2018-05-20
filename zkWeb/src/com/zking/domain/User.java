package com.zking.domain;

public class User {
	private String username;
	private String psw;
	private int sumprice=0;
	
	public int getSumPrice() {
		return sumprice;
	}
	public void setSumPrice(int statu) {
		this.sumprice = statu;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPsw() {
		return psw;
	}
	public void setPsw(String psw) {
		this.psw = psw;
	}
	public User(String username, String psw) {
		this.username = username;
		this.psw = psw;
	}
	public User(String username, String psw,int money) {
		this.username = username;
		this.psw = psw;
		this.sumprice=money;
	}
	public User() {
	
	}
	
}
