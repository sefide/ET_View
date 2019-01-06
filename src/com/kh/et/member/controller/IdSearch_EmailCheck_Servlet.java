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
 * Servlet implementation class IdSearch_EmailCheck_Servlet
 */
@WebServlet("/emailCheck.me")
public class IdSearch_EmailCheck_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdSearch_EmailCheck_Servlet() {
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
		
		Member reqMember = new Member();
		reqMember.setM_question(question);
		reqMember.setM_answer(answer);
		
		Member loginUser = new MemberService().memberIdSearchEmailCheck(reqMember);
		
		if(loginUser != null) {
			response.getWriter().println(loginUser.getM_email());
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
