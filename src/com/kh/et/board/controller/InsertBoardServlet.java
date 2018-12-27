package com.kh.et.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.et.board.model.service.BoardService;
import com.kh.et.board.model.vo.Board;
import com.kh.et.member.model.vo.Member;

/**
 * Servlet implementation class InsertBoardServlet
 */
@WebServlet("/insert.bo")
public class InsertBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		/*String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getM_no());*/
		System.out.println(title);
		System.out.println(content);
		
		Board b = new Board();
		b.setBtitle(title);
		b.setbContent(content);
		/*b.setbWriter(writer);
		*/
		int result = new BoardService().insertBoard(b);
		
		response.setContentType("application/json");
		new Gson().toJson(result);
		
		String page= "";
		if(result>0) {
			response.sendRedirect(request.getContextPath() + "/insert.bo");
		}else {
			request.setAttribute("msg", "게시판 작성 실패");
			/*request.getRequestDispatcher("").forward(request, response);*/
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
