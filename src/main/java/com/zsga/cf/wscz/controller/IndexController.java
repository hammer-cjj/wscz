package com.zsga.cf.wscz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	/**
	 * 跳转到发布文章页面
	 * @return
	 */
	@RequestMapping("/writeArticle")
	public String writeArticle() {
		return "writeArticle";
	}
	
	/**
	 * 跳转到文章管理页面
	 * @return
	 */
	@RequestMapping("/articleManage")
	public String articleManage() {
		return "articleManage";
	}
}
