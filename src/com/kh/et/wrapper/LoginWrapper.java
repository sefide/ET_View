package com.kh.et.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class LoginWrapper extends HttpServletRequestWrapper{

	public LoginWrapper(HttpServletRequest request) {
		super(request); // ServletRequest (부모)
	}
	
	@Override
	public String getParameter(String key) {
		String value = "";
		if(key != null && key.equals("userPwd")) { 
			value = getSha512(super.getParameter("userPwd"));  // 암호화 처리한다. 
		}else {
			value = super.getParameter(key); // 값을 그대로 돌려준다. 
		}
		return value;
	}

	private String getSha512(String pwd) {
		String encPwd = "";
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-512");
			byte[] bytes = pwd.getBytes(Charset.forName("UTF-8")); // 문자열을 쪼개서
			md.update(bytes); // 하나씩 다 암호화 처리
			
			encPwd = Base64.getEncoder().encodeToString(md.digest()); // 암호화 처리된 것들을 String으로 다시 만들어 !
					
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return encPwd;
	}
}
