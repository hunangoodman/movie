package com.soft.dao;

import java.util.List;
import java.util.Map;

import com.zking.domain.Movie;
import com.zking.domain.Order;
import com.zking.domain.YuanXian;

public interface MovieDao {
	void add(Movie movie);
	void findByName(String name);
	List<Movie> findByStatu(int i);
	Map<String,List<Movie>> findByGener(String gener);
	Object findBySearch(String val);
	Object findById(int id);
	List<YuanXian> findAllCaname(int id);
	List<Integer> findPlace(int cid, int mid, int hid,String sess);
	Object findHallInfo(int cid, int mid, int hid, String sess);
	List<Order> findOrderByUname(String uname);
	void insertPlace(int cid, int hid,int price,String sess, String[] zuoNum, String loginName);
	String deleteOrder(int oid,int zuo,String username,int price);
}
