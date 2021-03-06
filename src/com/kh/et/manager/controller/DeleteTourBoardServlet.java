package com.kh.et.manager.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.manager.model.service.ManagerService;

/**
 * Servlet implementation class DeleteTourBoardServlet
 */
@WebServlet("/deleteTourBoard.mng")
public class DeleteTourBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTourBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] box=request.getParameterValues("chkValue");
		
		List<Integer> list = new ArrayList<>();
		
		for(String num:box) {
			StringTokenizer token = new StringTokenizer(num, ",");
			while(token.hasMoreTokens()) {
				String s_number = token.nextToken();
				int number = Integer.parseInt(s_number);
				list.add(number);
				System.out.println(list);
			}
		}
		
		 int result=new ManagerService().deleteTourBoards(list);
		
		
		String page="";
		
		if(result>0) {
			
			page="/et/selectTour.mng";
			response.sendRedirect(page);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "수정하기실패!");
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
