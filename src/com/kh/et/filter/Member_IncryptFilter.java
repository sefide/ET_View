package com.kh.et.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

import com.kh.et.wrapper.Member_LoginWrapper;

/**
 * Servlet Filter implementation class IncryptFilter
 */
@WebFilter("*.me")	//매핑명칭에 .me를 가진 모든 서블릿은 이 필터를 거치게 된다.
public class Member_IncryptFilter implements Filter {

    /**
     * Default constructor. 
     */
    public Member_IncryptFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//	ServletRequest가 부모 / HttpServletRequest가 후손이기 때문에
		//	부모가 후손의 클래스를 사용하기 위해서 Down-casting 처리 필요
			HttpServletRequest hRequest= (HttpServletRequest)request;
			
		//	다운캐스팅 처리하여 만든 hRequest를 매개변수로 LoginWrapper를 부릅니당
		// LoginWrapper로 가보겠습니다	
			Member_LoginWrapper lw = new Member_LoginWrapper(hRequest);
		
			chain.doFilter(lw, response);
		}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
