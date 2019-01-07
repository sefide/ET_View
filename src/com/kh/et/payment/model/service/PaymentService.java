package com.kh.et.payment.model.service;

import static com.kh.et.common.JDBCTemplate.close;
import static com.kh.et.common.JDBCTemplate.getConnection;
import static com.kh.et.common.JDBCTemplate.rollback;
import static com.kh.et.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.et.company.model.dao.CompanyDao;
import com.kh.et.company.model.vo.Company;
import com.kh.et.company.model.vo.Coupon;
import com.kh.et.payment.model.dao.PaymentDao;
import com.kh.et.payment.model.vo.Payment;

public class PaymentService {
	
/*public Company insertPayment(int price, String apply, int cno) {
		
		Connection con = getConnection();
		
		int result=0;
		

		int result1 = new PaymentDao().insertPayment(con, price, apply,cno);
		System.out.println("service1");
		
		if(result1>0) {
			int tno  = new PaymentDao().selectCurrval(con);
		}
		int result2 = new PaymentDao().insertCoupon(con,cno);
		System.out.println("service2");
	
		int result3 = new PaymentDao().updateMemberPoint(con,pmNo);
		System.out.println("service3");
		
		Member loginUser = null;
		if(result1>0 && result2>0 && result3>0) {
			loginUser = new MemberDao().selectLoginUser(con, m);
		}else {
			rollback(con);
		}
		close(con);
		
		return loginUser;
	}*/

public int insertPayment(Payment p, Coupon c) {
	Connection con = getConnection();
	
	int result=0;
	

	int result1 = new PaymentDao().insertPayment(con,p);
	System.out.println("service1");
	
	if(result1>0) {
		int tno  = new PaymentDao().selectCurrval(con,p);
		p.setPayNo(tno);
	}
	int result2 = new PaymentDao().insertCoupon(con,c,p);
	System.out.println("service2");

	int result3 = new PaymentDao().updateCompanyCoupon(con,p);
	System.out.println("service3");
	
	if(result1>0 && result2>0 && result3>0) {
		commit(con);
		result =1;
	}else {
		rollback(con);
	}
	close(con);
	
	return result;
}


public int insertPremiumPayment(Payment p, Coupon c) {
	Connection con = getConnection();
	
	int result=0;
	

	int result1 = new PaymentDao().insertPremiumPayment(con,p);
	System.out.println("service1");
	
	if(result1>0) {
		int tno  = new PaymentDao().selectCurrval(con,p);
		p.setPayNo(tno);
	}
	int result2 = new PaymentDao().insertPremiumCoupon(con,c,p);
	System.out.println("service2");

	int result3 = new PaymentDao().updateCompanyPremiumCoupon(con,p);
	System.out.println("service3");
	
	if(result1>0 && result2>0 && result3>0) {
		commit(con);
		result =1;
	}else {
		rollback(con);
	}
	close(con);
	
	return result;
}
	

	public ArrayList<Payment> selectPayList(int currentPage, int limit, Company loginUser) {
		Connection con = getConnection();
		
		ArrayList<Payment> list = new PaymentDao().selectPayList(con, currentPage, limit, loginUser);
		
		close(con);
	
		return list;
	}

	public int getListpayList(Company loginUser) {
		Connection con = getConnection();
		
		int listCount = new PaymentDao().getListpayCoupon(con,loginUser);
		close(con);
		
		return listCount;
	}
	
	
	



}
