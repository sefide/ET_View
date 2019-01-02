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
		String userPwd = request.getParameter("userPwdNew");
		String userEmail = request.getParameter("userEmail");
		String userName = request.getParameter("userName");
		int userNo = Integer.parseInt(request.getParameter("mno"));
		
		System.out.println("아이디 : " + userId);
		System.out.println("비번 : " + userPwd);
		System.out.println("이메일 : " + userEmail);
		System.out.println("이름 : " + userName);

		
		Member reqMember = new Member();
		reqMember.setM_id(userId);
		reqMember.setM_pwd(userPwd);
		reqMember.setM_email(userEmail);
		reqMember.setM_name(userName);
		
		int result = new MemberService().updateMember(reqMember);
		
		
		String page = "";
		if(result > 0) {
			request.getSession().setAttribute("loginUser", reqMember);	//-> loginUser : 로그인해서 들어갔던 회원 정보 / reqMember: 업데이트하려고 내가 입력한 정보로 체인지
			//response.sendRedirect("views/normal/myPage/myPage_main.jsp");
			request.setAttribute("msgTrue", "회원 정보가 수정되었습니다^O^");
			page = "/selectPlanList.pl?mno="+userNo;
			//request.getRequestDispatcher("views/normal/myPage/myPage_main.jsp").forward(request, response);
			
		}else {
			request.setAttribute("msgFalse", "회원정보가 변경되지 않았습니다");
			page = "views/normal/myPage/user_update.jsp";
			//request.getRequestDispatcher("views/normal/myPage/user_update.jsp").forward(request, response);
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
