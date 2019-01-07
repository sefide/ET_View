package com.kh.et.tourBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.tourBoard.model.service.TourBoardService;
import com.kh.et.tourBoard.model.vo.TourBoard;

/**
 * Servlet implementation class DeleteCompanyTourBoardServlet
 */
@WebServlet("/deleteTourBoard.tbo")
public class DeleteCompanyTourBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCompanyTourBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num=request.getParameter("tno");
		int tno=Integer.parseInt(num);
		System.out.println("num : " + num);
		
		TourBoard reqTour=new TourBoard();
		reqTour.setTno(tno);
		
		int result=new TourBoardService().deleteTourBoard(reqTour);
		
		String page="";
		if(result>0 ) {
			page="/et/selectList.tbo";
			response.sendRedirect(page);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "삭제 실패");
			RequestDispatcher view=request.getRequestDispatcher(page);
			view.forward(request, response);
			
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
