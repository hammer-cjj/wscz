package com.zsga.cf.wscz.service;

import java.util.List;

import com.zsga.cf.wscz.pojo.Dept;

public interface DeptService {
	List<Dept> listDept();
	List<Dept> querySignDept(String[] deptIds);
	List<Dept> queryChaoSongDept(String[] deptIds);
}
