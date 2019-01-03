package com.kh.et.tourBoard.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.et.tourBoard.model.service.TourBoardService;
import com.kh.et.tourBoard.model.vo.PageInfo;
import com.kh.et.tourBoard.model.vo.TourBoard;

/**
 * Servlet implementation class SelectTourBoardServlet
 */
@WebServlet("/selectList2.tbo")
public class SelectTourBoardServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectTourBoardServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*ArrayList<HashMap<String, Object>> list = new TourBoardService().selectThumbnailList();
		
		
		String page = "";
		if(list != null) {
			page = "views/company/tourBoard/com_main.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "사진게시판 조회 실패!");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);*/
		
		int currentPage;    //현재 페이지를 표시할 변수
		int limit;			//한 페이지에 게시글이 몇 개가 보여질 것인지 표시
		int maxPage;		//전체 페이지에서 가장 마지막 페이지
		int startPage;		//한번에 표시될 페이지가 시작할 페이지
		int endPage;		//한번에 표시될 페이지가 끝나는 페이지
		
		//현재 페이지 처리
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//한 페이지에 보여질 목록 개수
		limit = 4;
		TourBoardService tbs = new TourBoardService();
		int listCount = tbs.getListCount2();
		
		
		//총 페이지 수 계산   100 100page 
		//예를 들어, 목록 수가 123개면 페이지수는 13페이지가 필요하다.
		maxPage = (int)((double)listCount / limit);
				
		//현재 페이지에 보여줄 시작페이지 수
		//1, 11, 21, 31,... 1 2
		startPage = (((int)((double)currentPage / limit+0.9)) -1) * limit +1;
		
		//목록 아래쪽에 보여질 마지막 페이지 수(10, 20, 30, ....)
		endPage = startPage + 10 -1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		ArrayList<HashMap<String, Object>> list = new TourBoardService().selectList2(currentPage,limit);
		
		/*response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(list,response.getWriter());*/
	
		String page="";
		if(list != null) {
			page= "views/company/tourBoard/com_mainBottom.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			page ="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회 실패!");
			
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
		/*HashMap<String,Object> result = null;
		
		if(list != null && pi != null) {
			result = new HashMap<String,Object>();
			result.put("pi", pi);
			result.put("list", list);
			
			
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(result,response.getWriter());
		}*/
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
