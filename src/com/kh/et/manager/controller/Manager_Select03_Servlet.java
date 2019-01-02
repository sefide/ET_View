package com.kh.et.manager.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.manager.model.service.ManagerService;
import com.kh.et.member.model.vo.Member;
import com.kh.et.member.model.vo.PageInfo;

/*회원 정지시키기*/
@WebServlet("/select03.mng")
public class Manager_Select03_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Manager_Select03_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		int currentPage;	//현재페이지 표시
		int limit;			//한페이지에 게시글이 몇개보여질 것인지 표시
		int maxPage;		//전체페이지에서 가장마지막페이지
		int startPage;		//한번에 표시될페이지가 시작할 페이지
		int endPage;		//한번에 표시될페이지가 끝나는페이지
		
		//현재페이지 처리
		currentPage = 1; //아무것도값이없을때는 1번부터 보여줌
		
		if(request.getParameter("currentPage")!= null) {
			//currentPage값을 현재페이지로 등록
			currentPage=Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//한페이지에 보여질 목록갯수
		limit=10;
		
		/*블랙리스트 회원목록 보여줌 -> 선택하면 정지시킬 수 있도록*/
		int BlackListCount = new ManagerService().getBlackListCount();
		System.out.println("카운트 : "+BlackListCount);
		
		//총 페이지수 계산
		//ex) 목록수 123(=>(int)(12.3+0.9))개 -> 페이지 13개필요
		maxPage = (int)((double)BlackListCount/limit + 0.9);
		
		//현재페이지에 보여줄 시작페이지 수
		//1, 11, 21, 31, ...
		startPage = (((int)((double)currentPage/limit + 0.9))-1)*limit+1;
		
		//목록아래쪽에 보여질 마지막 페이지수 (10,20,30, ...)
		endPage = startPage+10-1;
		
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		
		//페이징처리에 쓸 변수들 가지고있는 객체생성
		PageInfo pi = new PageInfo(currentPage,BlackListCount,limit,maxPage,startPage,endPage);
				
		ArrayList<Member> BlackList = new ManagerService().selectBlackList(currentPage,limit);

		String page="";
		if(BlackList!=null) {
			page="views/manager/normalMember/manager_check_black.jsp";
			request.setAttribute("BlackList", BlackList);
			System.out.println("사이즈  :"+BlackList.size());
			request.setAttribute("pi", pi); //PageInfo도 같이전달
			
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "블랙회원 조회 실패!");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);

		
	}

	
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
