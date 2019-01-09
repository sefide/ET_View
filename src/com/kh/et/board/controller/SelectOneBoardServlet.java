package com.kh.et.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.board.model.service.BoardService;
import com.kh.et.board.model.vo.Board;
import com.kh.et.member.model.vo.Member;
import com.kh.et.tourBoard.model.service.TourBoardService;

/**
 * Servlet implementation class SelectOneBoardServlet
 */
@WebServlet("/selectOne.bo")
public class SelectOneBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		System.out.println(num);
		
		HashMap<String, Object> aList = new BoardService().selectOne(num);
		
		
		
		/*ArrayList<HashMap<String, Object>> list=new BoardService().selectOne(num);*/
		/*String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getM_no());*/
		
		
		String page = "";
		
		if(aList != null) {
			page = "views/normal/board/boardDetail.jsp";
			request.setAttribute("aList", aList);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 상세조회 실패!");
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
