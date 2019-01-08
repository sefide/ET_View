package com.kh.et.wrapper;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class Member_LoginWrapper extends HttpServletRequestWrapper{

	public Member_LoginWrapper(HttpServletRequest request) {
		super(request);	//super : 부모(ServletRequest) =>ServletRequest의 request를 부르게따
	}
	
	@Override	//부모의 getParameter를 오버라이드 하여 getParameter를 새로 정의했다.
	public String getParameter(String key) {
		String value = "";
		if(key != null && key.equals("userPwd")) {	//키 값이 userPwd일경우
			value = getSha512(super.getParameter("userPwd"));	//getSha512라는 메소드를 거쳐 암호화 처리를하여 반환하고,
		}else {
			value = super.getParameter(key);	//아니면 암호화 처리를 하지 않고 그냥 그대로 반환한다.
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
