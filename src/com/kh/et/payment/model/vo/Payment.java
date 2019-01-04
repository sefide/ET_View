package com.kh.et.payment.model.vo;

import java.sql.Date;

public class Payment implements java.io.Serializable{
	
	private int payNo;
	private int payCno;
	private String payCardNum;
	private int price;
	private Date payDate;
	private String payCT;

	public Payment() {}

	public Payment(int payNo, int payCno, String payCardNum, int price, Date payDate, String payCT) {
		super();
		this.payNo = payNo;
		this.payCno = payCno;
		this.payCardNum = payCardNum;
		this.price = price;
		this.payDate = payDate;
		this.payCT = payCT;
	}




	public int getPayNo() {
		return payNo;
	}




	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}




	public int getPayCno() {
		return payCno;
	}




	public void setPayCno(int payCno) {
		this.payCno = payCno;
	}




	public String getPayCardNum() {
		return payCardNum;
	}




	public void setPayCardNum(String payCardNum) {
		this.payCardNum = payCardNum;
	}




	public int getPrice() {
		return price;
	}




	public void setPrice(int price) {
		this.price = price;
	}




	public Date getPayDate() {
		return payDate;
	}




	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}




	public String getPayCT() {
		return payCT;
	}




	public void setPayCT(String payCT) {
		this.payCT = payCT;
	}




	@Override
	public String toString() {
		return "Payment [payNo=" + payNo + ", payCno=" + payCno + ", payCardNum=" + payCardNum + ", price=" + price
				+ ", payDate=" + payDate + ", payCT=" + payCT + "]";
	}
	
	
	
	
	
}
