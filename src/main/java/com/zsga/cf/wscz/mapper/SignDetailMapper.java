package com.zsga.cf.wscz.mapper;

import java.util.List;

import com.zsga.cf.wscz.pojo.Article;
import com.zsga.cf.wscz.pojo.SignDetail;

public interface SignDetailMapper {
	//批量添加签收详情
	int addBatch(List<SignDetail> signDetailList);
	//查询签收列表
	List<SignDetail> querySign(int articleId);
	//更新签收
	int updateSign(SignDetail signDetail);
	//查询签收详情
	List<SignDetail> queryDetail(int articleId);
	//删除
	int del(int articleId);
	//批量删除
	int delBatch(List<String> articleIds);
}
