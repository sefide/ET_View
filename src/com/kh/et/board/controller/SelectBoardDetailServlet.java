package com.kh.et.board.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.board.model.service.BoardService;
import com.kh.et.board.model.vo.Board;

/**
 * Servlet implementation class SelectBoardDetailServlet
 */
@WebServlet("/selectDetail.bo")
public class SelectBoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectBoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*System.out.println("수정 서비스 들어온다!");*/
		int num = Integer.parseInt(request.getParameter("num"));
		
		/*System.out.println("update: "+num);*/
		
		HashMap<String, Object> b = new BoardService().selectOne(num);
		
		String page = "";
		if(b != null) {
			page = "views/normal/board/boardUpdate.jsp";
			request.setAttribute("b", b);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 수정용 상세보기 실패!");
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
