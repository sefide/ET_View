package com.kh.et.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class NumberExec {

	public String commaMoney (int price) {
		String str = String.format("%,d", price);
		return str;
		
	}
	
	public long getDayDiff(String strEndDate) {
		Date today = new Date();
        String strFormat = "yyyyMMdd";    //strStartDate 와 strEndDate 의 format
        long diffDay = 0;
        
        //SimpleDateFormat 을 이용하여 startDate와 endDate의 Date 객체를 생성한다.
        SimpleDateFormat sdf = new SimpleDateFormat(strFormat);
        try{
            Date endDate = sdf.parse(strEndDate);
 
            // 두 날짜 사이의 시간 차이(ms)를 하루 동안의 ms(24시*60분*60초*1000밀리초) 로 나눈다.
            diffDay = (today.getTime() - endDate.getTime()) / (24*60*60*1000);
            
        }catch(ParseException e){
            e.printStackTrace();
        }
		return diffDay;

	}
	
	
	
	
	
	
	
	
	
	
	
}
