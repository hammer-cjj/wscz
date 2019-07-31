package com.zsga.cf.wscz.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zsga.cf.wscz.pojo.Article;
import com.zsga.cf.wscz.pojo.SignDetail;
import com.zsga.cf.wscz.service.ArticleService;
import com.zsga.cf.wscz.service.SignDetailService;
import com.zsga.cf.wscz.util.IpUtil;

@Controller
@RequestMapping("/signDetail")
public class SignDetailController {
	
	@Autowired
	private SignDetailService signDetailService;
	@Autowired
	private ArticleService articleService;
	
	/**
	 * 查询某篇文章的签收列表
	 * @param articleId
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/list/{articleId}")
	public void list(@PathVariable("articleId") Integer articleId,HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<SignDetail> signDetailList = signDetailService.querySign(articleId);
		if (null != signDetailList) {
			request.setAttribute("signDetailList", signDetailList);
		}
		Article article = articleService.viewDetail(articleId);
		request.setAttribute("article", article);
		request.getRequestDispatcher("/signList.jsp").forward(request, response);
	}
	
	/**
	 * 签收文章
	 * @param signDetail
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/sign")
	public void sign(SignDetail signDetail,HttpServletRequest request, HttpServletResponse response) throws Exception {
		signDetail.setSignDate(new Date());
		signDetail.setSignFlag(1);
		signDetail.setSignIp(IpUtil.getIp(request));
		int code = signDetailService.updateSign(signDetail);
		if (code > 0) {
			list(signDetail.getArticleId(),request,response);
		}
	}
	
	/**
	 * 查询签收详情
	 * @param articleId
	 * @param request
	 * @param response
	 * @throws Exception 
	 * @throws ServletException 
	 */
	@RequestMapping("/detail/{articleId}")
	public void detail(@PathVariable("articleId") Integer articleId,HttpServletRequest request, HttpServletResponse response) throws Exception {
		List<SignDetail> signDetailList = signDetailService.queryDetail(articleId);
		if (null != signDetailList) {
			request.setAttribute("signDetailList", signDetailList);
		}
		Article article = articleService.viewDetail(articleId);
		request.setAttribute("article", article);
		request.getRequestDispatcher("/signDetail.jsp").forward(request, response);
	}
}
