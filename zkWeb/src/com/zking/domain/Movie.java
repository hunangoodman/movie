package com.zking.domain;

public class Movie {
	//moviepic,moviename,showtime,direct,act,grade,timelen,introduce,statu,count
	private int mid;
	private String moviepic;
	private String moviename;
	private String showtime;
	private String direct;
	private String act;
	private String grade;
	private String genre;
	private String timelen;
	private String introduce;
	private int statu;
	private int count;
	
	public Movie() {

	}
	public Movie(int mid, String moviepic, String moviename, String showtime,
			String direct, String act, String grade, String genre,
			String timelen, String introduce, int statu, int count) {
		this.mid = mid;
		this.moviepic = moviepic;
		this.moviename = moviename;
		this.showtime = showtime;
		this.direct = direct;
		this.act = act;
		this.grade = grade;
		this.genre = genre;
		this.timelen = timelen;
		this.introduce = introduce;
		this.statu = statu;
		this.count = count;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getMoviepic() {
		return moviepic;
	}
	public void setMoviepic(String moviepic) {
		this.moviepic = moviepic;
	}
	public String getMoviename() {
		return moviename;
	}
	public void setMoviename(String moviename) {
		this.moviename = moviename;
	}
	public String getShowtime() {
		return showtime;
	}
	public void setShowtime(String showtime) {
		this.showtime = showtime;
	}
	public String getDirect() {
		return direct;
	}
	public void setDirect(String direct) {
		this.direct = direct;
	}
	public String getAct() {
		return act;
	}
	public void setAct(String act) {
		this.act = act;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getTimelen() {
		return timelen;
	}
	public void setTimelen(String timelen) {
		this.timelen = timelen;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public int getStatu() {
		return statu;
	}
	public void setStatu(int statu) {
		this.statu = statu;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
