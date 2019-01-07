package com.kh.et.manager.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.manager.model.service.ManagerService;

/**
 * Servlet implementation class DeleteTravelServlet
 */
@WebServlet("/deleteTravel.mng")
public class DeleteTravelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTravelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] box=request.getParameterValues("chkValue");
		
		ArrayList<Integer>list= new ArrayList<>();
		
		for(String num:box) {
			StringTokenizer token=new StringTokenizer(num,",");
			while(token.hasMoreTokens()) {
				String s_number=token.nextToken();
				int number=Integer.parseInt(s_number);
				list.add(number);
			}
		}
		
		int result=new ManagerService().deleteTravel(list);
		String page="";
		if(result>0) {
			page="/et/selectCity.mng";
			response.sendRedirect(page);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "실패");
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
