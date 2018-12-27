package com.kh.et.company.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.company.model.service.CompanyService;
import com.kh.et.company.model.vo.Company;
import com.kh.et.company.model.vo.PageInfo;



/**
 * Servlet implementation class SelectCompanyListServlet
 */
@WebServlet("/selectList.co")
public class SelectCompanyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCompanyListServlet() {
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
		
		//현재 페이지 수 처리
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//한 페이지에 보여질 목록 갯수
		limit = 10;
				
		CompanyService cs = new CompanyService();
		
		//전체 게시글 수 조회
		int listCount = cs.getListCount();
		
		//총 페이지 수 계산
		//예를 들어, 목록 수가 123개면 페이지수는 13페이지가 필요하다
		maxPage = (int)((double)listCount / limit + 0.9);	//소수형으로 받은 후 정수형으로 형변환
		
		//현재 페이지에 보여줄 시작페이지 수
		//1, 11, 21, 31,...
		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		
		//목록 아래쪽에 보여질 마지막 페이지 수(10, 20, 30,...)
		endPage = startPage + 10 - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);	//페이징에 필요한 매개변수 넣어 객체 생성
		
		ArrayList<Company> list = new CompanyService().selectList(currentPage, limit);	//게시물 리스트에서 현재페이지, 한 페이지에 보이게 할 글의 수를 넣어 리스트 생성
		
		System.out.println(list);
		
		String page = "";
		
		if(list != null) {	//게시물의 목록이 있을 시
			page = "views/manager/tourCompany/manager_company.jsp";	//게시물의 목록을 보여주고
			request.setAttribute("list", list);	//보여주려는 목록을 넣어준다
			request.setAttribute("pi", pi);		//페이징에 필요한 것들도 넣어주기
		}else {
			page = "views/common/normal/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회 실패!");
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
