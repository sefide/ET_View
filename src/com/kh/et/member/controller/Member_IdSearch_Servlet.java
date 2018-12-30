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
		
		/*System.out.println("질문 : "+question);
		System.out.println("답 : "+answer);
		System.out.println("메일 : " + email);*/
		
		Member reqMember = new Member();
		reqMember.setM_question(question);
		reqMember.setM_answer(answer);
		reqMember.setM_email(email);
		
		Member loginUser = new MemberService().memberIdSearch(reqMember);
		
		
		String userId = loginUser.getM_id();	//변수 userId에 loginUer에 있는 아이디를 가져와서 저장
		
		System.out.println("질문 : " + userId);
		System.out.println("질문 : " + loginUser.getM_question());
		System.out.println("답 : " + loginUser.getM_answer());
		System.out.println("아이디: " + loginUser.getM_id());
		
		PrintWriter out = response.getWriter();
		
		if(userId != null) {
			out.append("({'result':'입력하신 정보와 일치하는 아이디는 ' + userId + '입니다'})");
		}else {
			out.append("fail");
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
