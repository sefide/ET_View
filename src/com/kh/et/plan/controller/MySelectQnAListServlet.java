package com.kh.et.plan.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MySelectQnAListServlet
 */
@WebServlet("/selectMyQnAList.bo")
public class MySelectQnAListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MySelectQnAListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//----------------------------- 페이징처리 추가 ----------------------------
			int currentPage;	//현재 페이지를 표시할 변수
			int limit;			//한 페이지에 게시글이 몇 개가 보여질 것인지 표시
			int maxPage;		//전체 페이지에서 가장 마지막 페이지
			int startPage;		//한번에 표시될 페이지가 시작할 페이지
			int endPage;		//한번에 표시될 페이지가 끝나는 페이지
			
			//현재 페이지 처리
			currentPage = 1;
			
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
		
			//한 페이지에 보여질 목록 갯수
			limit = 10;
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
