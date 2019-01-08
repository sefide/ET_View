package com.kh.et.common;

public class NumberExec {

	public String commaMoney (int price) {
		String str = String.format("%,d", price);
		return str;
		
	}
	
	//플랜 도시 이름 길이 제한
	public String lengthsplit(String str, int length) {
		if(str.length() >= length){
		    return str.substring(0,length)+" ...";
		}
		return str;
	}
	
	
	
}
