package com.kh.et.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.board.model.service.BoardService;

/**
 * Servlet implementation class claimBoardServlet
 */
@WebServlet("/claim.bo")
public class claimBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public claimBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reason = request.getParameter("radioVal");
		String userId = request.getParameter("userId");
		String boardNum = request.getParameter("boardNo");
		String boardwriter = request.getParameter("boardwriter");
		int userNo = Integer.parseInt(userId);
		int boardNo = Integer.parseInt(boardNum);
		
		System.out.println("얍 " + reason +userId + boardNo + boardwriter );
		
		int result = new BoardService().insertClaim(reason, userNo, boardNo, boardwriter	);
		
		if(result > 0) {
			System.out.println("신고완료 ");
			response.getWriter().println("SUCCESS");
		}else {
			System.out.println("신고 실패 ");
			response.getWriter().println("FAIL");
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
