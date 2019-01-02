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

/**
 * Servlet implementation class SelectQnAListServlet
 */
@WebServlet("/selectQnAList.pl")
public class SelectQnAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectQnAListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mno = Integer.parseInt(request.getParameter("mno"));	//세션에 담긴 로그인 정보에서 회원번호 빼오기
		
		//내 QnA리스트, 내가 스크랩한 QnA리스트 보기
		HashMap<String, Board> QnAlist = new BoardService().selectMyActivityQnA(mno);	//뽑아올 보드를 해쉬맵에 담기
		
		String page ="";
		if(QnAlist != null) {
			request.setAttribute("QnAlist", QnAlist);
			page = "views/normal/myPage/myPage_activity_history.jsp";
		
		}else {
			request.setAttribute("msg", "Q&A스크랩 리스트 조회 실패");
			page = "views/normal/myPage/myPage_main.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		//내 소식 보기
		ArrayList<Object> ActivityList = new BoardService().selectMyNewsBoard(mno);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
