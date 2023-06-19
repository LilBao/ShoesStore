package com.fpoly.Untils;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Session {
	@Autowired
	HttpSession session;
	
	public <T> T get(String name) {
		var nameSession = session.getAttribute(name);
		if (nameSession!=null) {
			return (T) nameSession;
		}
		return null;
	}
	
	public void set(String name, Object value) {
		session.setAttribute(name, value);
	}
	
	public void remove(String name) {
		session.setAttribute(name, null);
	}
}
