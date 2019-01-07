package com.kh.et.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.et.board.model.service.BoardService;
import com.kh.et.board.model.vo.BoardInterest;
import com.kh.et.plan.model.service.PlanService;
import com.kh.et.plan.model.vo.PlanInterest;

/**
 * Servlet implementation class ClickLikeBoardServlet
 */
@WebServlet("/clickLikeBoard.bo")
public class ClickLikeBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClickLikeBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("글 좋아요당");
		int bno = Integer.parseInt(request.getParameter("bno"));
		int user = Integer.parseInt(request.getParameter("user"));
		String writer = request.getParameter("writer");
		
		System.out.println("플랜번호 = "+bno);
		System.out.println("로그인 유저 = "+user);
		System.out.println("플랜 작성자 = "+writer);

		BoardInterest bi = new BoardInterest();
		bi.setBno(bno);
		bi.setUser(user);
		bi.setWriter(writer);
		
		int result = new BoardService().clickLike(bi);
		System.out.println( "결과는.."+result);
		
		response.setContentType("application/json");
		new Gson().toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
