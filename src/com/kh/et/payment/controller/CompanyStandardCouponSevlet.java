package com.kh.et.payment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.company.model.service.CompanyService;
import com.kh.et.company.model.vo.Company;
import com.kh.et.company.model.vo.Coupon;
import com.kh.et.payment.model.service.PaymentService;
import com.kh.et.payment.model.vo.Payment;

/**
 * Servlet implementation class CompanyStandardCouponSevlet
 */
@WebServlet("/paymentStandardCouponCompany.pco")
public class CompanyStandardCouponSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompanyStandardCouponSevlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int price = Integer.parseInt(request.getParameter("price"));
		String apply = request.getParameter("apply");
		int cno = Integer.parseInt(request.getParameter("cno"));
		System.out.println("가격:"+price);
		System.out.println("승인번호:"+apply);
		System.out.println("유저번호:"+cno);
		
		Payment p = new Payment();
		p.setPayCno(cno);
		p.setPrice(price);
		p.setPayCardNum(apply);
		Coupon c = new Coupon();
		

		
		int result = new PaymentService().insertPayment(p,c);
		
		String page="";
		if(result>0) {
			int count = p.getPrice()/2;
			Company loginUser = (Company)request.getSession().getAttribute("loginCompany");
			int stdC = loginUser.getcStandard()+count;
			loginUser.setcStandard(stdC);
			request.getSession().setAttribute("loginCompany", loginUser);
			response.sendRedirect(request.getContextPath()+"/selectList.tbo");
		}else {
			request.setAttribute("msg", "비공개 실패");
			page = "views/common/errorPage.jsp";
			//request.getRequestDispatcher("views/normal/member/user_join.jsp").forward(request, response);
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
