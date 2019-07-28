package com.zsga.cf.wscz.pojo;

/**
 * 用户实体类
 * @author quadcopter
 *
 */
public class Dept {
	//编号
	private int id;
	//部门单位
	private String deptName;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
}
