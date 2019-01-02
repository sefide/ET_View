package com.kh.et.board.controller;

import java.io.IOException;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.board.model.service.BoardService;
import com.kh.et.board.model.vo.Board;

import sun.util.logging.resources.logging;

/**
 * Servlet implementation class UpdateBoardServlet
 */
@WebServlet("/update.bo")
public class UpdateBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*System.out.println("수정에 들어왔다!");*/
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String date = request.getParameter("date");
		int num = Integer.parseInt(request.getParameter("num"));
		
		
		/*System.out.println("수정 글 번호는 뭐야? : "+num);
		System.out.println(title);
		System.out.println(content);
		System.out.println(date);*/
		
		java.sql.Date day = null;
		
		if(date != "") {
			String[] drr = date.split("-");
			int[] irr = new int[drr.length];
			for(int i = 0; i < irr.length; i++) {
				irr[i] = Integer.parseInt(drr[i]);
			}
			
			day = new java.sql.Date(new GregorianCalendar(irr[0], irr[1] - 1, irr[2]).getTimeInMillis());
		}else {
			day = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}
		
		Board b =new Board();
		b.setBtitle(title);
		b.setbContent(content);
		b.setbDate(day); 
		b.setbNo(num);
		
		int result = new BoardService().updateBoard(b);
		
		String page = "";
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/selectList.bo");
		}else {
			request.setAttribute("msg", "공지사항 수정 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
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
