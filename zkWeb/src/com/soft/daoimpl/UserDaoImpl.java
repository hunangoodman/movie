package com.soft.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.soft.dao.UserDao;
import com.soft.dao.jdbcUtils;
import com.zking.domain.User;

public class UserDaoImpl implements UserDao {
	 static  Connection con=null;
	 static  ResultSet rs=null;
	
	@Override
	public User login(User user) {
		User user1=null;
		try {
			con=jdbcUtils.getConnection();
			String sql="select * from uUser where username=?";
			rs= jdbcUtils.ObjectOldPrama(con, sql, user.getUsername()).executeQuery();
			if(rs.next()){			
				user1=new User(rs.getString("username"),rs.getString("psw"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				jdbcUtils.clase(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return user1;
	}

	@Override
	public void regist(User user) {
		try {
			con=jdbcUtils.getConnection();
			String sql="insert into uUser(username,psw,sumprice,manager) values(?,?,?,?)";
			jdbcUtils.ObjectOldPrama(con, sql,user.getUsername(),user.getPsw(),200,0).execute();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				jdbcUtils.clase(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public boolean check(String string) {
		boolean flog=false;
		try {
			con=jdbcUtils.getConnection();
			String sql="select username from uUser where username=?";
			rs= jdbcUtils.ObjectOldPrama(con, sql, string).executeQuery();
			if(rs.next()){			
				flog=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				jdbcUtils.clase(con);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return flog;
	}

//	public boolean regist(User user) {
//		boolean flog=false;
//		try {
//			String sql="select username from uUser where username=?";
//			rs=jdbc.ObjectLoad(sql,user.getUsername()).executeQuery();
//			if(!rs.next()){
//				String sql2="insert into uUser(username,psw) values(?,?)";
//				jdbc.ObjectLoad(sql2,user.getUsername(),user.getPsw()).execute();
//				flog=true;
//			}	
//			jdbc.clase(rs);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}; 
//		return flog;
//	}

}
