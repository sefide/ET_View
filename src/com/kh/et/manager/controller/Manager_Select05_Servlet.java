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

/*탈퇴회원 관리*/
@WebServlet("/select05.mng")
public class Manager_Select05_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Manager_Select05_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		/* 탈퇴회원 조회페이징 */
		int currentPage2;	//현재페이지 표시
		int limit2;			//한페이지에 게시글이 몇개보여질 것인지 표시
		int maxPage2;		//전체페이지에서 가장마지막페이지
		int startPage2;		//한번에 표시될페이지가 시작할 페이지
		int endPage2;		//한번에 표시될페이지가 끝나는페이지
		
		//현재페이지 처리
		currentPage2 = 1; //아무것도값이없을때는 1번부터 보여줌
		
		if(request.getParameter("currentPage2")!= null) {
			//currentPage값을 현재페이지로 등록
			currentPage2=Integer.parseInt(request.getParameter("currentPage2"));
		}
		
		//한페이지에 보여질 목록갯수
		limit2=10;

		ManagerService ms2 = new ManagerService();
		
		int listOutCount = ms2.getOutListCount();
		
		//총 페이지수 계산
		//ex) 목록수 123(=>(int)(12.3+0.9))개 -> 페이지 13개필요
		maxPage2 = (int)((double)listOutCount/limit2 + 0.9);
		
		//현재페이지에 보여줄 시작페이지 수
		//1, 11, 21, 31, ...
		startPage2 = (((int)((double)currentPage2/limit2 + 0.9))-1)*limit2+1;
		
		//목록아래쪽에 보여질 마지막 페이지수 (10,20,30, ...)
		endPage2 = startPage2+10-1;
		
		if(maxPage2<endPage2) {
			endPage2=maxPage2;
		}
		
		//페이징처리에 쓸 변수들 가지고있는 객체생성
		PageInfo pi2 = new PageInfo(currentPage2,listOutCount,limit2,maxPage2,startPage2,endPage2);
	
		ArrayList<Member> outList = new ManagerService().selectOutList(currentPage2,limit2);
		
		
		String page="";
		if(outList!=null) {
			page="views/manager/normalMember/manager_out.jsp";
			request.setAttribute("outList", outList);
			request.setAttribute("pi2", pi2);
			
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "탈퇴회원 조회 실패!");
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
