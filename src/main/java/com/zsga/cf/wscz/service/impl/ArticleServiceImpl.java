package com.zsga.cf.wscz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zsga.cf.wscz.mapper.ArticleMapper;
import com.zsga.cf.wscz.pojo.Article;
import com.zsga.cf.wscz.service.ArticleService;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleMapper articleMapper;
	
	/**
	 * 添加文章
	 */
	public int add(Article article) {
		return articleMapper.add(article);
	}

	/**
	 * 查询所有文章
	 */
	public List<Article> listAll(Article article) {
		return articleMapper.listAll(article);
	}

	/**
	 * 查看文章详情
	 */
	public Article viewDetail(int id) {
		return articleMapper.viewDetail(id);
	}

	/**
	 * 更新文章
	 */
	public int update(Article article) {
		return articleMapper.update(article);
	}

	/**
	 * 更新点击数
	 */
	public int updateHit(Article article) {
		return articleMapper.updateHit(article);
	}

	/**
	 * 删除文章
	 */
	public int delArticle(List<String> ids) {
		return articleMapper.delArticle(ids);
	}

}
