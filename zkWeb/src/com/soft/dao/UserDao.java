package com.soft.dao;

import com.zking.domain.User;

public interface UserDao {
	User login(User user);
	void regist(User user);
	boolean check(String string);
}
