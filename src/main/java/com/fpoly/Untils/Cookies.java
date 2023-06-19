package com.fpoly.Untils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Cookies {
	@Autowired
	HttpServletResponse resp;
	
	@Autowired 
	HttpServletRequest req;
	
	public Cookie add(String name, String value, int hours) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(hours);
		cookie.setPath("/");
		resp.addCookie(cookie);
		return cookie;
	}
	
	public String get(String name) {
		Cookie[] cookies = req.getCookies();
		if (cookies!=null) {
			for (Cookie e : cookies) {
				if (e.getName().equals(name)) {
					return e.getValue();
				}
			}
		}
		return "";
	}
	
	public void remove(String name) {
		Cookie[] cookies = req.getCookies();
		if (cookies!=null) {
			for (Cookie e : cookies) {
				if (e.getName().equalsIgnoreCase(name)) {
					e.setMaxAge(0);
					e.setPath("/");
					resp.addCookie(e);
					break;
				}
			}
		}
	}
}
