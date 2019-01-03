package com.kh.et.manager.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.manager.model.service.ManagerService;
import com.kh.et.manager.model.vo.Manager;



/**
 * Servlet implementation class ManagerTravelUpdateOneServlet
 */
@WebServlet("/updateOne.mng")
public class ManagerTravelUpdateOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerTravelUpdateOneServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String[] testChk = request.getParameterValues("chkValue");
		int comNo = 0;
		for(String msg : testChk) {
			System.out.println("테스트 체크!!! :" + msg);
			comNo = Integer.parseInt(msg);
		}
		
		ArrayList<HashMap<String,Object>> list=new ManagerService().updateOne(testChk);
		
		String page="";
		
		if(list!=null) {
			page="views/manager/plan/cityUpdateForm.jsp";
			request.setAttribute("list1", list);
			request.setAttribute("comNo", comNo);
			
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세보기 실패!");
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
