package com.soft.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.zking.domain.Movie;

public class jdbcUtils {
	private static ComboPooledDataSource datasourse=new ComboPooledDataSource();
	private static PreparedStatement ps=null;
	private static Connection con=null;
	
	public static Connection getConnection() throws SQLException{
		if(con!=null)return con;
		return datasourse.getConnection();
	}
	
	public static DataSource getDataSource(){
		return datasourse;
	}
//	public static void beginTransaction() throws SQLException{
//		Connection con=tl.get();
//		if(con!=null)throw new SQLException("�Ѿ��������񣬲����ظ�����");
//		con=getConnection();
//		tl.set(con);
//	}
//	public static void commitTransaction() throws SQLException{
//		Connection con=tl.get();
//		if(con==null)throw new SQLException("����δ�������񣬲����ύ");
//		con.commit();
//		con.close();
//		tl.remove();
//	}
//	public static void rollbackTransaction() throws SQLException{
//		Connection con=tl.get();
//		if(con==null)throw new SQLException("����δ�������񣬲��ܻع�");
//		con.rollback();
//		con.close();
//		tl.remove();
//	}
	
	public static PreparedStatement ObjectOldPrama(Connection com,String sql,Object ...param) throws SQLException{
		ps=com.prepareStatement(sql);
		for(int i=0;i<param.length;i++){
			ps.setObject(i+1, param[i]);
		}
		return ps;
	}
	public static void clase(Connection con) throws SQLException{
		if(con!=null)con.close();
	}
}
