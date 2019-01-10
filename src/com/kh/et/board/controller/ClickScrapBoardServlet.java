package com.kh.et.board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.board.model.service.BoardService;
import com.kh.et.board.model.vo.BoardInterest;
import com.kh.et.plan.model.service.PlanService;
import com.kh.et.plan.model.vo.PlanInterest;

/**
 * Servlet implementation class ClickScrapBoardServlet
 */
@WebServlet("/clickScrapBoard.bo")
public class ClickScrapBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClickScrapBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("pno"));
		int user = Integer.parseInt(request.getParameter("user"));
		String writer = request.getParameter("bwriter");
		
		int bwriter = new BoardService().getbwriter(writer);
		
		String scrapStatus = request.getParameter("status");
		
		
		BoardInterest bi = new BoardInterest();
		bi.setBno(bno);
		bi.setUser(user);
		bi.setBwriter(bwriter);
				
		int result = new BoardService().clickScrap(bi,scrapStatus);
		
		String page = "";
		
		if(result > 0) {
			response.sendRedirect("/et/selectOne.bo?num="+bno);
			
		} else {
			request.setAttribute("msg", "스크랩에 실패하였습니다.");
			RequestDispatcher view = request.getRequestDispatcher(page);
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
