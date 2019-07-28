package com.zsga.cf.wscz.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zsga.cf.wscz.mapper.UserMapper;
import com.zsga.cf.wscz.pojo.User;
import com.zsga.cf.wscz.service.UserService;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper userMapper;

	/**
	 * 根据用户名和密码登陆
	 */
	public User login(User user) {
		return userMapper.login(user);
	}

	/**
	 * 修改密码
	 */
	public int modifyPassword(User user) {
		return userMapper.modifyPassword(user);
	}
}
