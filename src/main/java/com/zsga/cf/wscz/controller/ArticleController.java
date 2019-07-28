package com.zsga.cf.wscz.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zsga.cf.wscz.pojo.Article;
import com.zsga.cf.wscz.pojo.Dept;
import com.zsga.cf.wscz.pojo.SignDetail;
import com.zsga.cf.wscz.pojo.User;
import com.zsga.cf.wscz.service.ArticleService;
import com.zsga.cf.wscz.service.DeptService;
import com.zsga.cf.wscz.service.SignDetailService;

@Controller
@RequestMapping("/article")
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	@Autowired
	private DeptService deptService;
	@Autowired
	private SignDetailService signDetailService;
	
	/**
	 * 分页模糊查询
	 * @param pn
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws ServletException 
	 */
	@RequestMapping("/search")
	public void search(@RequestParam(value="pn",defaultValue="1")Integer pn,
			HttpServletRequest request,HttpServletResponse response) throws Exception {
		PageHelper.startPage(pn, 15);
		String keyword = request.getParameter("keyword");
		int tiaojian = Integer.parseInt(request.getParameter("tiaojian"));
		List<Article> articleList = null;
		if (0 == tiaojian) {  //全文搜索
			Article art = new Article();
			art.setTitle(keyword);
			art.setContent(keyword);
			articleList = articleService.listAll(art);
		} else if (1 == tiaojian) { //按照标题搜索
			Article art = new Article();
			art.setTitle(keyword);
			articleList = articleService.listAll(art);
		} else if (2 == tiaojian) {  //按照内容搜索
			Article art = new Article();
			art.setContent(keyword);
			articleList = articleService.listAll(art);
		}
		request.setAttribute("tiaojian", tiaojian);
		request.setAttribute("keyword", keyword);
		PageInfo<Article> pageInfo = new PageInfo<Article>(articleList,5);
		request.setAttribute("pageInfo", pageInfo);
		request.getRequestDispatcher("/searchList.jsp").forward(request, response);
		
	}
	
	/**
	 * 分页查询文章
	 * @throws IOException 
	 * @throws ServletException 
	 */
	@RequestMapping("/foreground/list")
	public void list(@RequestParam(value="pn",defaultValue="1")Integer pn,
			HttpServletRequest request,HttpServletResponse response) throws Exception {
		PageHelper.startPage(pn, 15);
		List<Article> articleList = articleService.listAll(null);
		PageInfo<Article> pageInfo = new PageInfo<Article>(articleList,5);
		request.setAttribute("pageInfo", pageInfo);
		request.getRequestDispatcher("/articleList.jsp").forward(request, response); 
	}
	
	/**
	 * 查询后台所有文章
	 * @param article
	 * @param page
	 * @param rows
	 * @return
	 */
	@RequestMapping("/listAll")
	@ResponseBody
	public Map<String,Object> listAll(Article article,String page, String rows) {
		Map<String,Object> modelMap = new HashMap<String,Object>();
		PageHelper.startPage(Integer.parseInt(page), Integer.parseInt(rows));
		List<Article> articleList = articleService.listAll(article);
		if (null != articleList) {
			PageInfo<Article> pageInfo = new PageInfo<Article>(articleList);
			modelMap.put("rows", pageInfo.getList());
			modelMap.put("total", pageInfo.getTotal());
		}
		return modelMap;
	}
	
	@RequestMapping("/findById")
	public String findById(@RequestParam("id")Integer id,HttpServletRequest request) {
		//Map<String, Object> modelMap = new HashMap<String, Object>();
		Article article = articleService.viewDetail(id);
		request.setAttribute("article", article);
		return "modifyArticle";
	}
	
	/**
	 * 获取文章内容
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/findContent")
	@ResponseBody
	public Map<String,Object> findContent(@RequestParam("id")Integer id,HttpServletRequest request) {
		Map<String, Object> modelMap = new HashMap<String, Object>();
		Article article = articleService.viewDetail(id);
		if (null != article) {
			modelMap.put("success", true);
			modelMap.put("article", article);
		} else {
			modelMap.put("success", false);
		}
		return modelMap;
	}
	
	/**
	 * 查看文章
	 * @param id
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/viewDetail/{id}")
	public void viewDetail(@PathVariable("id") Integer id,HttpServletRequest request, HttpServletResponse response) throws Exception {
		Article article = articleService.viewDetail(id);
		if (null != article) {
			request.setAttribute("article", article);
		}
		//获取抄送的单位
		if (null != article.getChaoSongDept()) {
			String[] deptIds = (article.getChaoSongDept()).split(",");
			List<Dept> deptList = deptService.queryChaoSongDept(deptIds);
			String str = "";
			for (Dept d : deptList) {
				str += d.getDeptName() + ",";
			}
			str = str.substring(0, str.length() - 1);
			request.setAttribute("chaoSongDept", str);
		}
		//点击数增加
		int hit = article.getHit();
		Article art = new Article();
		art.setHit(hit + 1);
		art.setId(article.getId());
		articleService.updateHit(art);
		request.getRequestDispatcher("/showArticle.jsp").forward(request, response);
	}
	
	/**
	 * 添加,修改文章
	 * @param request
	 * @param article
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Map<String,Object> save(HttpServletRequest request, Article article) {
		Map<String,Object> modelMap = new HashMap<String,Object>();
		int signFlag = Integer.parseInt(article.getSignFlag());
		if (signFlag == 1) {  //需要签收
			if ("-1".equals(article.getSignDept() )) {  //签收单位是全部
				List<Dept> deptList = deptService.listDept();
				if (null != deptList && deptList.size() > 0) {
					String str = "";
					for (Dept d : deptList) {
						str += d.getId() + ",";
					}
					str = str.substring(0, str.length() - 1);
					article.setSignDept(str);
				}
			}
		}
		
		if (null != article.getChaoSongDept() && "-1".equals(article.getChaoSongDept())) { //抄送单位是全部
			List<Dept> deptList = deptService.listDept();
			if (null != deptList && deptList.size() > 0) {
				String str = "";
				for (Dept d : deptList) {
					str += d.getId() + ",";
				}
				str = str.substring(0, str.length() - 1);
				article.setChaoSongDept(str);
			}
		} 
		
		//发布时间
		article.setPubTime(new Date());
		//发布者
		User currentUser = (User) request.getSession().getAttribute("currentUser");
		article.setAuthor(currentUser.getUserName());
		int code = 0;
		if (article.getId() == null) { //新增
			code = articleService.add(article);
		} else {  //修改
			code = articleService.update(article);
			//删除该文章在签收详表中的所有数据
			signDetailService.del(article.getId());
		}
		if (code > 0) {
			if (signFlag == 1) {  //需要签收
				//插入到签收详情表
				String[] deptIds = article.getSignDept().split(",");
				List<Dept> deptList = deptService.querySignDept(deptIds);
				List<SignDetail> signDetailList = new ArrayList<SignDetail>();
				for (Dept dept : deptList) {
					SignDetail sd = new SignDetail();
					sd.setArticleId(article.getId());
					sd.setSignDeptName(dept.getDeptName());
					signDetailList.add(sd);
				}
				signDetailService.addBatch(signDetailList);
			}
			
			modelMap.put("success", true);
		} else {
			modelMap.put("success", false);
		}
		return modelMap;
	}
	
	/**
	 * 删除文章
	 * @param request
	 * @return
	 */
	@RequestMapping("/del")
	@ResponseBody
	public Map<String, Object> delArticle(HttpServletRequest request) {
		Map<String,Object> map=new HashMap<String, Object>();
		String id=request.getParameter("ids");
		List<String> list=new ArrayList<String>();
		String[] strs = id.split(",");
		for (String str : strs) {
			list.add(str);
		}
		try {
			//删除文章
			int result = 0; 
			result = articleService.delArticle(list);
			if (result > 0) {
				//删除签收信息
				signDetailService.delBatch(list);
				map.put("success", true);
			} else {
				map.put("success", false);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}
}
