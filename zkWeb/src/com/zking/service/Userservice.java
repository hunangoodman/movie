package com.zking.service;

import com.soft.dao.UserDao;
import com.soft.daoimpl.UserDaoImpl;
import com.zking.domain.User;

public class Userservice{
	private UserDao udao=new UserDaoImpl();
	public boolean login(User user) {
		boolean flog=false;
		User user1=udao.login(user);
		if(user1!=null){
			if(user1.getPsw().equals(user.getPsw()))flog=true;
		}
		return flog;
	}
	public void regist(User user) {
		 udao.regist(user);
	}
	public boolean check(String string) {
		return udao.check(string);
	}
	
}
