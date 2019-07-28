package com.zsga.cf.wscz.util;

import java.net.InetAddress;
import java.net.UnknownHostException;

public class IpUtil {
	public static String getIp() {
		String ip = "";
		// 获取本地IP地址         
		try {
			ip = InetAddress.getLocalHost().getHostAddress();
			
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}   
		return ip;
	}
}
