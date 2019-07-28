package com.zsga.cf.wscz.service.impl;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zsga.cf.wscz.mapper.DeptMapper;
import com.zsga.cf.wscz.pojo.Dept;
import com.zsga.cf.wscz.service.DeptService;

@Service
public class DeptServiceImpl implements DeptService {

	@Autowired
	private DeptMapper deptMapper;
	
	/**
	 * 查询所有部门
	 */
	public List<Dept> listDept() {
		return deptMapper.listDept();
	}

	/**
	 * 查询需要签收的部门
	 */
	public List<Dept> querySignDept(String[] deptIds) {
		return deptMapper.querySignDept(deptIds);
	}

	/**
	 * 查询需要抄送的部门
	 */
	public List<Dept> queryChaoSongDept(String[] deptIds) {
		return deptMapper.queryChaoSongDept(deptIds);
	}

}
