package com.zking.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.soft.dao.MovieDao;
import com.soft.daoimpl.MovieImpl;
import com.zking.domain.Movie;
import com.zking.domain.Order;
import com.zking.domain.YuanXian;

public class MovieService {

	private MovieDao mp=new MovieImpl();
	public void add(Movie movie) {
		
	}

	public void findByName(String name) {

	}

	public List<Movie> findByStatu(int i) throws SQLException {
		return mp.findByStatu(i);
	}

	public Map<String,List<Movie>> findByGener(String gener) {
		return mp.findByGener(gener);
	}

	public Object findBySearch(String val) {
		return mp.findBySearch(val);
	}

	public Object findById(int id) {
		return mp.findById(id);
	}

	public List<YuanXian> findAllCaname(int id) {
		return mp.findAllCaname(id);
	}

	public Object findHallInfo(int cid, int mid,int hid,String sess) {
		return mp.findHallInfo(cid,mid,hid,sess);
	}

	public List<Integer> findPlace(int cid, int mid,int hid,String sess) {
		List<Integer> list=mp.findPlace(cid,mid,hid,sess);
		return list;
	}

	public void insertPlace(int cid, int hid,int price,String sess,String[] zuoNum, String loginName) {
		mp.insertPlace(cid, hid,price,sess,zuoNum,loginName);
	}//cid,hid,sess,zuoNum,(String)request.getSession().getAttribute("loginName")£»

	public List<Order> findOrderByUname(String uname) {
		return mp.findOrderByUname(uname);
	}
	public String deleteOrder(int oid,int zuo,String username,int price) {
		return mp.deleteOrder(oid,zuo,username,price);
	}
}
