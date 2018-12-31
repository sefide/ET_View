package com.kh.et.common.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.board.model.service.BoardService;
import com.kh.et.board.model.vo.Board;
import com.kh.et.plan.model.service.PlanService;
import com.kh.et.plan.model.vo.City;
import com.kh.et.tourBoard.model.service.TourBoardService;

/**
 * Servlet implementation class SelectTopContentsServlet
 */
@WebServlet("/selectTopContents.me")
public class SelectTopContentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SelectTopContentsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HashMap<String, Object> planMap = new PlanService().selectTopPlan(); // planMap- (인기순위, 해당 플랜) , CityMap
		HashMap<String, City> cityList = new PlanService().selectTopCity();
		ArrayList<HashMap<String, Object>> tourList = new TourBoardService().selectTopTour();
		ArrayList<Board> boardMap = new BoardService().selectTopBoard();

		String page = "";
		if (planMap != null && cityList != null && tourList != null && boardMap != null) {
			page = "index.jsp";
			System.out.println("좋아");
			request.setAttribute("topPlan", planMap);
			request.setAttribute("topCity", cityList);
			request.setAttribute("topTour", tourList);
			request.setAttribute("topBoard", boardMap);

			request.getRequestDispatcher(page).forward(request, response);

		} else {
			System.out.println("에러발생 ");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
