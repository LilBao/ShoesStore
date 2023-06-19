package com.fpoly.Untils;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Service;

@Service
public class Hash {
	public String HashPass(String pass) {
		String hashPass = BCrypt.gensalt();
		return BCrypt.hashpw(pass, hashPass);
	}
	
	public Boolean verify(String pass, String hashPass) {
		return BCrypt.checkpw(pass, hashPass);
	}
}
