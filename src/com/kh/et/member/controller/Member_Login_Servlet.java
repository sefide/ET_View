package com.kh.et.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.member.model.service.MemberService;
import com.kh.et.member.model.vo.Member;

/**
 * Servlet implementation class Member_Login_Servlet
 */
@WebServlet("/login.me")
public class Member_Login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_Login_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		System.out.println("userId : " + userId);
		System.out.println("userPwd : " + userPwd);
		
		Member reqMember = new Member();
		reqMember.setM_id(userId);
		reqMember.setM_pwd(userPwd);
		
		Member loginUser = new MemberService().loginCheck(reqMember);
		
		if(loginUser != null) {//성공
			request.getSession().setAttribute("loginUser", loginUser);	//세션불러와서 로그인 정보 넣고
			
			response.sendRedirect("first.jsp");
		}else {//실패
			request.setAttribute("msg", "로그인 실패했어!!!!");
			request.getRequestDispatcher("views/normal/member/user_login.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
