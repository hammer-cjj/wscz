package com.zsga.cf.wscz.mapper;

import java.util.List;

import com.zsga.cf.wscz.pojo.Article;

public interface ArticleMapper {
	//添加文章
	int add(Article article);
	//查询所有文章
	List<Article> listAll(Article article);
	//查看文章详情
	Article viewDetail(int id);
	//更新文章
	int update(Article article);
	//更新点击数
	int updateHit(Article article);
	//删除文章
	int delArticle(List<String> ids);
}
