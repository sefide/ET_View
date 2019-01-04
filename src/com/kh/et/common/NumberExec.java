package com.kh.et.common;

public class NumberExec {

	public String commaMoney (int price) {
		String str = String.format("%,d", price);
		return str;
		
	}
	
}
