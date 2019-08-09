package com.zsga.cf.wscz.service;

import java.util.List;

import com.zsga.cf.wscz.pojo.Article;
import com.zsga.cf.wscz.pojo.ArticleExt;

public interface ArticleService {
	int add(Article article);
	List<Article> listAll(Article article);
	Article viewDetail(int id);
	int update(Article article);
	int updateHit(Article article);
	int delArticle(List<String> ids);
	List<ArticleExt> top7();
}
