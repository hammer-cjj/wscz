package com.zsga.cf.wscz.pojo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 文章实体类
 * @author quadcopter
 *
 */
public class Article {
	//编号
	private Integer id;
	//内容
	private String content;
	//标题
	private String title;
	//浏览数
	private int hit;
	//签发人
	private String signFaPerson;
	//等级：0：一般；1：加急；2特级；
	private int djFlag;
	//签收单位
	private String signDept;
	//承办单位
	private String chengBanDept;
	//发布时间
	@DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
	private Date pubTime;
	//是否签收：0：否；1：是
	private String signFlag;
	//抄送单位
	private String chaoSongDept;
	//公文号
	private String gwh;
	//发布者
	private String author;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getSignFaPerson() {
		return signFaPerson;
	}
	public void setSignFaPerson(String signFaPerson) {
		this.signFaPerson = signFaPerson;
	}
	public int getDjFlag() {
		return djFlag;
	}
	public void setDjFlag(int djFlag) {
		this.djFlag = djFlag;
	}
	public String getSignDept() {
		return signDept;
	}
	public void setSignDept(String signDept) {
		this.signDept = signDept;
	}
	public String getChengBanDept() {
		return chengBanDept;
	}
	public void setChengBanDept(String chengBanDept) {
		this.chengBanDept = chengBanDept;
	}
	public Date getPubTime() {
		return pubTime;
	}
	public void setPubTime(Date pubTime) {
		this.pubTime = pubTime;
	}
	public String getSignFlag() {
		return signFlag;
	}
	public void setSignFlag(String signFlag) {
		this.signFlag = signFlag;
	}
	public String getChaoSongDept() {
		return chaoSongDept;
	}
	public void setChaoSongDept(String chaoSongDept) {
		this.chaoSongDept = chaoSongDept;
	}
	public String getGwh() {
		return gwh;
	}
	public void setGwh(String gwh) {
		this.gwh = gwh;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
}
