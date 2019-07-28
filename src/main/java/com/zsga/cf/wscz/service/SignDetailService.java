package com.zsga.cf.wscz.service;

import java.util.List;

import com.zsga.cf.wscz.pojo.SignDetail;

public interface SignDetailService {
	int addBatch(List<SignDetail> signDetailList);
	List<SignDetail> querySign(int articleId);
	int updateSign(SignDetail signDetail);
	List<SignDetail> queryDetail(int articleId);
	int del(int articleId);
	int delBatch(List<String> articleIds);
}
