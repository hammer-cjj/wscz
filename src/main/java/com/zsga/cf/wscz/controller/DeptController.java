package com.zsga.cf.wscz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zsga.cf.wscz.pojo.Dept;
import com.zsga.cf.wscz.service.DeptService;

@Controller
@RequestMapping("/dept")
public class DeptController {
	@Autowired
	private DeptService deptService;
	
	/**
	 * 查询所有部门
	 * @return
	 */
	@RequestMapping("/list")
	@ResponseBody
	public List<Dept> listDept() {
		List<Dept> deptList = null;
		try {
			deptList = deptService.listDept();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		
		return deptList;
	}
}
