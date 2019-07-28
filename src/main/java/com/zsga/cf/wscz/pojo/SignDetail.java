package com.zsga.cf.wscz.pojo;

import java.util.Date;

/**
 * 文件签收实体类
 * @author quadcopter
 *
 */
public class SignDetail {
	//编号
	private int id;
	//签收部门
	private String signDeptName;
	//签收IP
	private String signShouPerson;
	//签收日期
	private Date signDate;
	//文章Id
	private int articleId;
	//是否签收 0：未签收；1已签收
	private int signFlag;
	//签收IP
	private String signIp;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getSignDeptName() {
		return signDeptName;
	}
	public void setSignDeptName(String signDeptName) {
		this.signDeptName = signDeptName;
	}
	public String getSignShouPerson() {
		return signShouPerson;
	}
	public void setSignShouPerson(String signShouPerson) {
		this.signShouPerson = signShouPerson;
	}
	public Date getSignDate() {
		return signDate;
	}
	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}
	public int getArticleId() {
		return articleId;
	}
	public void setArticleId(int articleId) {
		this.articleId = articleId;
	}
	public int getSignFlag() {
		return signFlag;
	}
	public void setSignFlag(int signFlag) {
		this.signFlag = signFlag;
	}
	public String getSignIp() {
		return signIp;
	}
	public void setSignIp(String signIp) {
		this.signIp = signIp;
	}
}
