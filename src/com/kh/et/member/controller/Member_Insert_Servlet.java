package com.kh.et.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.member.model.service.MemberService;
import com.kh.et.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/insert.me")
public class Member_Insert_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_Insert_Servlet() {
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
		String userName = request.getParameter("userName");
		String userQuestion = request.getParameter("userQuestion");
		String userAnwser = request.getParameter("userAnwser");
		String userEmail = request.getParameter("userEmail");
		
		System.out.println(userId);
		System.out.println(userPwd);
		System.out.println(userName);
		System.out.println(userQuestion);
		System.out.println(userAnwser);
		System.out.println(userEmail);
		
		Member reqMember = new Member();
		reqMember.setM_id(userId);
		reqMember.setM_pwd(userPwd);
		reqMember.setM_name(userName);
		reqMember.setM_question(userQuestion);
		reqMember.setM_answer(userAnwser);
		reqMember.setM_email(userEmail);
		

		int result = new MemberService().insertMember(reqMember);
		
		String page="";
		if(result > 0) {
			request.setAttribute("joinmsg", "ET Planner에 오신걸 환영합니다~^O^");
			page = "views/normal/member/user_login.jsp";
			//response.sendRedirect("views/normal/member/user_login.jsp");
		}else {
			request.setAttribute("msg", "회원가입에 실패햇어ㅠㅠ");
			page = "views/normal/member/user_join.jsp";
			//request.getRequestDispatcher("views/normal/member/user_join.jsp").forward(request, response);
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
