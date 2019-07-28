package com.zsga.cf.wscz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zsga.cf.wscz.mapper.SignDetailMapper;
import com.zsga.cf.wscz.pojo.SignDetail;
import com.zsga.cf.wscz.service.SignDetailService;

@Service
public class SignDetailServiceImpl implements SignDetailService {
	
	@Autowired
	private SignDetailMapper signDetailMapper;

	/**
	 * 批量添加签收详情 (签收部门和被签收的文章ID)
	 */
	public int addBatch(List<SignDetail> signDetailList) {
		return signDetailMapper.addBatch(signDetailList);
	}

	/**
	 * 查询签收列表
	 */
	public List<SignDetail> querySign(int articleId) {
		return signDetailMapper.querySign(articleId);
	}

	/**
	 * 更新签收
	 */
	public int updateSign(SignDetail signDetail) {
		return signDetailMapper.updateSign(signDetail);
	}

	/**
	 * 查询签收详情
	 */
	public List<SignDetail> queryDetail(int articleId) {
		return signDetailMapper.queryDetail(articleId);
	}

	/**
	 * 删除
	 */
	public int del(int articleId) {
		return signDetailMapper.del(articleId);
	}

	/**
	 * 批量删除
	 */
	public int delBatch(List<String> articleIds) {
		return signDetailMapper.delBatch(articleIds);
	}

}
