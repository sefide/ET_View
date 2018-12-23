package com.kh.et.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.member.model.service.MemberService;
import com.kh.et.member.model.vo.MemberNormal;

/**
 * Servlet implementation class Member_Update_Servlet
 */
@WebServlet("/update.me")
public class Member_Update_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_Update_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text; charset=utf-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String newPwd1 = request.getParameter("newPwd1");
		String newPwd2 = request.getParameter("newPwd2");
		String userEmail = request.getParameter("userEmail");
		String userName = request.getParameter("userName");
		
		/*System.out.println("아이디 : " + userId);
		System.out.println("비번 : " + userPwd);
		System.out.println("수정비번 : " + newPwd1);
		System.out.println("수정비번 확인 : " + newPwd2);
		System.out.println("이메일 : " + userEmail);
		System.out.println("이름 : " + userName);*/
		
		MemberNormal reqMember = new MemberNormal();
		
		reqMember.setM_id(userId);
		reqMember.setM_pwd(newPwd1);
		reqMember.setM_email(userEmail);
		reqMember.setM_name(userName);
		
		int result = new MemberService().updateMember(reqMember);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
