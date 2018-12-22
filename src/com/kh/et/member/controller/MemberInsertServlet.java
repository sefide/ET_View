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
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/insert.me")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userQuestion = request.getParameter("userQuestion");
		String userAwser = request.getParameter("userAwser");
		String userEmail = request.getParameter("userEmail");
		String userName = request.getParameter("userName");
		
		MemberNormal reqMember = new MemberNormal();
		reqMember.setM_id(userId);
		reqMember.setM_pwd(userPwd);
		reqMember.setN_quetion(userQuestion);
		reqMember.setN_answer(userAwser);
		reqMember.setM_email(userEmail);
		reqMember.setM_name(userName);
		
		int result = new MemberService().insertMember(reqMember);
		
		if(result > 0) {
			response.sendRedirect("views/normal/member/user_login.jsp");
		}else {
			request.setAttribute("msg", "회원가입에 실패햇어ㅠㅠ");
			request.getRequestDispatcher("views/normal/member/user_join.jsp").forward(request, response);
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
