package com.zsga.cf.wscz.pojo;

/**
 * 文章实体类扩展
 * @author Administrator
 *
 */
public class ArticleExt extends Article {
	private Integer diff;  //和当前日期相差几天

	public Integer getDiff() {
		return diff;
	}

	public void setDiff(Integer diff) {
		this.diff = diff;
	}
	
}
