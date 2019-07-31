package com.zsga.cf.wscz.util;

import javax.servlet.http.HttpServletRequest;

public class IpUtil {
	public static String getIp(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");  
		// 获取IP地址         
		try {
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("Proxy-Client-IP");  
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("WL-Proxy-Client-IP");  
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("HTTP_CLIENT_IP");  
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
	        }  
	        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
	            ip = request.getRemoteAddr();  
	        }  
	        return ip;
		} catch (Exception e) {
			e.printStackTrace();
		}   
		return ip;
	}
}
