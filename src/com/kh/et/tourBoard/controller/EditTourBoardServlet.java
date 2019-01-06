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

import com.kh.et.tourBoard.model.service.TourBoardService;
import com.kh.et.tourBoard.model.vo.TourBoard;

/**
 * Servlet implementation class EditTourBoardServlet
 */
@WebServlet("/editOne.tbo")
public class EditTourBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTourBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num=request.getParameter("num");
		System.out.println(num);
		
		ArrayList<HashMap<String, Object>> list=new TourBoardService().editOne(num);
		
		String page="";
		
		if(list!=null) {
			
			page="views/company/tourBoard/com_EditBoard.jsp";
			request.setAttribute("list",list);
			
		
		}else {
			
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "이게 안되나");
		}
		RequestDispatcher view=request.getRequestDispatcher(page);
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
