package com.kh.et.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		//포인트 작성 부분
		Member m = new Member();
		//포인트 작성 부분입니다.
		String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getM_no());
		
		System.out.println(title);
		System.out.println(content);
		System.out.println(writer);
		
		Board b = new Board();
		m.setM_no(Integer.parseInt(writer));
		b.setBtitle(title);
		b.setbContent(content);
		b.setbWriter(writer);
		
		//포인트 작성 부분 m 추가 헀습니다. int 형을 Member형으로 바꿈.
		Member result = new BoardService().insertBoard(b,m);
		//포인트 작성 부분 입니다.
		String page = "";
		//result 조건 변경, 세션 추가
		if(result != null) {
			request.getSession().setAttribute("loginUser", result);
			response.sendRedirect(request.getContextPath() + "/selectList.bo");
		}else {
			request.setAttribute("msg", "게시판 작성 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
