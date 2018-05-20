package com.soft.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import com.soft.dao.MovieDao;
import com.soft.dao.jdbcUtils;
import com.zking.domain.Movie;
import com.zking.domain.Order;
import com.zking.domain.YuanXian;

public class MovieImpl implements MovieDao {
	private static  PreparedStatement ps=null;
	private static  ResultSet rs=null;
	private static Connection con=null;
	@Override
	public void add(Movie movie) {
		
	}

	@Override
	public void findByName(String name) {

	}

	@Override
	public List<Movie> findByStatu(int i) {
		List<Movie> list=null;
		String sql="select * from movie where statu=?";
		try {
			con=jdbcUtils.getConnection();
			rs=jdbcUtils.ObjectOldPrama(con, sql, i).executeQuery();
			list=new ArrayList<Movie>();
			while(rs.next()){//moviepic,moviename,showtime,direct,act,grade,timelen,introduce,statu,count
				Movie movie=new Movie(rs.getInt("mid"),rs.getString("moviepic"),rs.getString("moviename"),
						rs.getString("showtime"),rs.getString("direct"),rs.getString("act"),
						rs.getString("grade"),rs.getString("genre"),rs.getString("timelen"),rs.getString("introduce"),
						rs.getInt("statu"),rs.getInt("count"));
				list.add(movie);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				jdbcUtils.clase(con);
			} catch (SQLException e) {
			}
		}
		return list;
	}

	@Override
	public Map<String,List<Movie>>  findByGener(String gener) {
		List<Movie> list=null;
		Map<String,List<Movie>> map= null;
		String sql="select * from movie where genre like ?";
		String sql2="select bgpic from genre where genrel=?";
		try {
			con=jdbcUtils.getConnection();
			rs=jdbcUtils.ObjectOldPrama(con, sql, "%"+gener+"%").executeQuery();
			list=new ArrayList<Movie>();
			while(rs.next()){//moviepic,moviename,showtime,direct,act,grade,timelen,introduce,statu,count
				Movie movie=new Movie(rs.getInt("mid"),rs.getString("moviepic"),rs.getString("moviename"),
						rs.getString("showtime"),rs.getString("direct"),rs.getString("act"),
						rs.getString("grade"),rs.getString("genre"),rs.getString("timelen"),rs.getString("introduce"),
						rs.getInt("statu"),rs.getInt("count"));
				list.add(movie);
			}
			rs=jdbcUtils.ObjectOldPrama(con, sql2, gener).executeQuery();
			String bgpic=null;
			if(rs.next()){
				bgpic=rs.getString("bgpic");
			}
			 map=new HashMap<String, List<Movie>>();
			 map.put(bgpic, list);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				jdbcUtils.clase(con);
			} catch (SQLException e) {
			}
		}
		return map;
	}

	@Override
	public Object findBySearch(String val) {
		List<Movie> list=null;
		String sql="select * from movie where moviename like ?";
		try {
			con=jdbcUtils.getConnection();
			rs=jdbcUtils.ObjectOldPrama(con, sql, "%"+val+"%").executeQuery();
			list=new ArrayList<Movie>();
			while(rs.next()){
				Movie movie=new Movie(rs.getInt("mid"),rs.getString("moviepic"),rs.getString("moviename"),
						rs.getString("showtime"),rs.getString("direct"),rs.getString("act"),
						rs.getString("grade"),rs.getString("genre"),rs.getString("timelen"),rs.getString("introduce"),
						rs.getInt("statu"),rs.getInt("count"));
				list.add(movie);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				jdbcUtils.clase(con);
			} catch (SQLException e) {
			}
		}
		return list;
	}

	@Override
	public Object findById(int id) {
		Movie movie=null;
		String sql="select * from movie where mid=?";
		try {
			con=jdbcUtils.getConnection();
			rs=jdbcUtils.ObjectOldPrama(con, sql, id).executeQuery();
			if(rs.next()){
				movie=new Movie(rs.getInt("mid"),rs.getString("moviepic"),rs.getString("moviename"),
						rs.getString("showtime"),rs.getString("direct"),rs.getString("act"),
						rs.getString("grade"),rs.getString("genre"),rs.getString("timelen"),rs.getString("introduce"),
						rs.getInt("statu"),rs.getInt("count"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				jdbcUtils.clase(con);
			} catch (SQLException e) {
			}
		}
		return movie;
	}

	@Override
	public List<YuanXian> findAllCaname(int id) {
		List<YuanXian> list=null;
		String sql="select m.mid,c.*,h.* from movie m,cinema c,hallinfo h where m.mid=h.mid and h.cid=c.cid and m.mid=?";
		try {
			con=jdbcUtils.getConnection();
			rs=jdbcUtils.ObjectOldPrama(con, sql, id).executeQuery();
			list=new ArrayList<YuanXian>();
			while(rs.next()){
				YuanXian yx=new YuanXian(rs.getInt("cid"),rs.getInt("hid"),rs.getInt("mid"),
				rs.getInt("price"),rs.getString("cname"),rs.getString("caddress"),
				rs.getString("hname"),rs.getString("sess"));
				list.add(yx);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				jdbcUtils.clase(con);
			} catch (SQLException e) {
			}
		}
		return list;
	}

	@Override
	public Object findHallInfo(int cid, int mid,int hid,String sess) {
		YuanXian hall=null;
		String sql="select m.mid,c.*,h.* from movie m,cinema c,hallinfo h where m.mid=h.mid and h.cid=c.cid and m.mid=? and c.cid=? and hid=? and sess=?";
		try {
			con=jdbcUtils.getConnection();
			rs=jdbcUtils.ObjectOldPrama(con, sql,mid,cid,hid,sess).executeQuery();
			if(rs.next()){
				hall=new YuanXian(rs.getInt("cid"),rs.getInt("hid"),rs.getInt("mid"),
						rs.getInt("price"),rs.getString("cname"),rs.getString("caddress"),
						rs.getString("hname"),rs.getString("sess"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				jdbcUtils.clase(con);
			} catch (SQLException e) {
			}
		}
		return hall;
	}

	@Override
	public List<Integer> findPlace(int cid, int mid,int hid,String sess) {
		String sql="select p.zuo from movie m,hallinfo h,cinema c ,place p where m.mid=h.mid and c.cid=p.cid and h.hid=p.hid and m.mid=? and c.cid=? and h.hid=? and h.sess=?;";
		List<Integer> list=null;
		try {
			con=jdbcUtils.getConnection();
			rs=jdbcUtils.ObjectOldPrama(con, sql,mid,cid,hid,sess).executeQuery();
			list=new ArrayList<Integer>();
			while(rs.next()){
				Integer zuo=rs.getInt("zuo");
				list.add(zuo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				jdbcUtils.clase(con);
			} catch (SQLException e) {
			}
		}
		return list;
	}
	@Override
	public void insertPlace(int cid, int hid,int price,String sess,String[] zuoNum,String loginName) {
		String sql="insert into place values(?,?,?,?,?,?)";
		String sql2="insert into orderinfo(uname,zuo,cid,hid,uid,sumc) values(?,?,?,?,?,?)";
		String sql3="update uUser set sumprice=sumprice-? where username=?";
		try {
			con=jdbcUtils.getConnection();
			String uid=UUID.randomUUID().toString().substring(0, 18);
			int prices=price/zuoNum.length;
			for(int i=0;i<zuoNum.length;i++){
				jdbcUtils.ObjectOldPrama(con, sql,hid,zuoNum[i],cid,sess,loginName,prices).execute();
				jdbcUtils.ObjectOldPrama(con, sql2,loginName,zuoNum[i],cid,hid,uid,price).execute();
			}
			jdbcUtils.ObjectOldPrama(con, sql3,price,loginName).execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			} catch (SQLException e) {
			}
		}
	}
	@Override
	public List<Order> findOrderByUname(String uname) {
		 List<Order> list=null;
		String sql="select o.oid,o.sumc,o.uname,c.cname,h.hname,p.price,p.zuo,p.sess,o.uid from orderinfo o,place p,cinema c,hallinfo h where "
				+ "o.cid=c.cid and o.hid=h.hid and o.zuo=p.zuo and p.sess=h.sess and o.uname=?";
		try {
			con=jdbcUtils.getConnection();
			rs=jdbcUtils.ObjectOldPrama(con, sql,uname).executeQuery();
			list=new ArrayList<Order>();
			while(rs.next()){//String uname,String sess,int zuo,int cid, int hid, int uid, int sumc
				Order or=new Order(rs.getInt("oid"),rs.getString("uname"),rs.getString("cname"),rs.getString("hname"),rs.getInt("zuo"),
						rs.getString("sess"),rs.getString("uid"),rs.getInt("sumc"),rs.getInt("price"));
				list.add(or);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			} catch (SQLException e) {
			}
		}
		return list;
	}
	@Override
	public String deleteOrder(int oid,int zuo,String username,int price) {
		String sql1="delete from orderinfo where oid=?";
		String sql3="delete from place where zuo=? and username=?";	
		String sql2="update uUser set sumprice=sumprice+? where username=?";
		try {
			jdbcUtils.ObjectOldPrama(con, sql1,oid).execute();
			jdbcUtils.ObjectOldPrama(con, sql3,zuo,username).execute();
			jdbcUtils.ObjectOldPrama(con, sql2,price,username).execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "1";
		
	}
}
