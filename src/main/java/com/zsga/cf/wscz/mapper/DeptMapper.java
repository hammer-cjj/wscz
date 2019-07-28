package com.zsga.cf.wscz.mapper;

import java.util.List;

import com.zsga.cf.wscz.pojo.Dept;

public interface DeptMapper {
	List<Dept> listDept();
	List<Dept> querySignDept(String[] deptIds);
	List<Dept> queryChaoSongDept(String[] deptIds);
}
