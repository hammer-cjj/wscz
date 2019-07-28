package com.zsga.cf.wscz.mapper;

import com.zsga.cf.wscz.pojo.User;

public interface UserMapper {
	//根据用户名和密码登陆
	User login(User user);
	//更改密码
	int modifyPassword(User user);
}
