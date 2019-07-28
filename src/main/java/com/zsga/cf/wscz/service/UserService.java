package com.zsga.cf.wscz.service;

import com.zsga.cf.wscz.pojo.User;

public interface UserService {
	User login(User user);
	int modifyPassword(User user);
}
