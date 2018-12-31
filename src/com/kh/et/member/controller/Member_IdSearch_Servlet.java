package com.kh.et.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.et.member.model.service.MemberService;
import com.kh.et.member.model.vo.Member;

/**
 * Servlet implementation class Member_Search_Servlet
 */
@WebServlet("/idsearch.me")
public class Member_IdSearch_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_IdSearch_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String question = request.getParameter("userQuestion");
		String answer = request.getParameter("userAnwser");
		String email = request.getParameter("userEmail");
		
		System.out.println("질문 : "+question);
		System.out.println("답 : "+answer);
		System.out.println("메일 : " + email);
		
		Member reqMember = new Member();
		reqMember.setM_question(question);
		reqMember.setM_answer(answer);
		reqMember.setM_email(email);
		
		Member loginUser = new MemberService().memberIdSearch(reqMember);
		
		
		if(loginUser != null) {
			response.getWriter().print(loginUser.getM_id());
			
			//request.setAttribute("loginUser", loginUser);	//->request
			//request.getRequestDispatcher("/views/normal/member/user_search.jsp").forward(request, response);	
		}else {
			response.getWriter().println("FAIL");
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
