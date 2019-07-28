package com.zsga.cf.wscz.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zsga.cf.wscz.pojo.User;
import com.zsga.cf.wscz.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	/**
	 * 根据用户名和密码登陆
	 * @param user
	 * @param request
	 * @return
	 */
	@RequestMapping("/login")
	public void login(User user, HttpServletRequest request, HttpServletResponse response) {
		User resultUser = userService.login(user);
		try {
			if (resultUser == null) {
				request.setAttribute("errMsg", "用户名或密码错误!");
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			} else {
				request.getSession().setAttribute("currentUser", resultUser);
				response.sendRedirect("/wscz/main.jsp");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 修改密码
	 * @param request
	 * @return
	 */
	@RequestMapping("/modifyPassword")
	@ResponseBody
	public Map<String, Object> modifyPassword(HttpServletRequest request) {
		Map<String,Object> map=new HashMap<String, Object>();
		String id = request.getParameter("id");
		String newPassword = request.getParameter("newPassword");
		User user = new User();
		user.setId(Integer.parseInt(id));
		user.setPassword(newPassword);
		int result = userService.modifyPassword(user);
		if (result > 0) {
			map.put("success", true);
		} else {
			map.put("success", false);
		}
		return map;
	}
	
	/**
	 * 退出登陆
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("currentUser");
		return "redirect:/index.jsp";
	}
}
