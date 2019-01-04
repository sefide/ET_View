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
 * Servlet implementation class Member_TowNaver_Login_Servlet
 */
@WebServlet("/snsLogin.me")
public class Member_Sns_Login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_Sns_Login_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = (String)request.getAttribute("userId");
		String password = (String)request.getAttribute("userPwd");
		Member member = new Member();
		member.setM_id(email);
		member.setM_pwd(password);
		
		Member loginUser = new MemberService().loginCheck(member);
		String view = "";
		if(loginUser != null) {
			request.getSession().setAttribute("loginUser", loginUser);
			view = "first.jsp";
			response.sendRedirect(view);
		}else {
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
