package com.kh.et.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.board.model.service.BoardService;
import com.kh.et.member.model.vo.Member;

/**
 * Servlet implementation class claimBoardServlet
 */
@WebServlet("/claim.bo")
public class ClaimBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClaimBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reason = request.getParameter("radioVal"); // reason
		String userNoStr = request.getParameter("userNo"); // 로그인 유저 번호 
		String boardNum = request.getParameter("boardNo"); // 보드 번호 
		String boardwriter = request.getParameter("boardwriter"); // 보드 작성자 아이디 
		String loginUserId = request.getParameter("loginUserId"); // 로그인 유저 아이디
		int userNo = Integer.parseInt(userNoStr);
		int boardNo = Integer.parseInt(boardNum);
		
		if(boardwriter.equals(loginUserId)) { // 자신의 게시물 
			System.out.println("신고 실패 - 자신의 게시물");
			response.getWriter().println("FAIL_SAMEUSER");
			response.getWriter().close();
		}else {
			int result = new BoardService().insertClaim(reason, userNo, boardNo, boardwriter);
			
			if(result > 0) {
				System.out.println("신고 완료 ");
				response.getWriter().println("SUCCESS");
				response.getWriter().close();
			}else if(result == -1){
				System.out.println("신고 실패 - 이전에 신고함 ");
				response.getWriter().println("FAIL_EXIST");
				response.getWriter().close();
			} else {
				System.out.println("신고 실패 ");
				response.getWriter().println("FAIL_NORMAL");
				response.getWriter().close();
			}
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
