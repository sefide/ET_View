package com.kh.et.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.kh.et.board.model.service.BoardService;
import com.kh.et.plan.model.service.PlanService;

/**
 * Servlet implementation class CountBoardScrapServlet
 */
@WebServlet("/countboardscrap.bo")
public class CountBoardScrapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CountBoardScrapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int bno = Integer.parseInt(request.getParameter("bno"));
			
		int scrap = new BoardService().countScrap(bno);
		
		response.setContentType("application/json");
		
		JSONObject json = new JSONObject();
		
		json.put("scrap", scrap);
		
		System.out.println("servlet에서 오기전의 scrap 수야! : "+scrap);
		
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(json.toJSONString());
	
		request.setAttribute("scrap", scrap);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
