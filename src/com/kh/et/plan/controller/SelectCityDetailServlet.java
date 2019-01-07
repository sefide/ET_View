package com.kh.et.plan.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.google.gson.Gson;
import com.kh.et.tourBoard.model.service.TourBoardService;
import com.kh.et.tourBoard.model.vo.Attachment;
import com.kh.et.tourBoard.model.vo.TourBoard;

/**
 * Servlet implementation class SelectCityDetailServlet
 */
@WebServlet("/cityDetail.pl")
public class SelectCityDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCityDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); 
		String cityName = request.getParameter("cityName");
		int cityNum = Integer.parseInt(request.getParameter("cityNum"));
		System.out.println("cityName : " + cityName);
		System.out.println("cityNum : " + cityNum);
		

		
//		관련 투어 정보 뽑아오기 ~~~ !
		ArrayList<HashMap<String, Object>> tourList = new TourBoardService().selectCityTourList(cityNum);
		// t : tourBoar / a : attachment 
		// 3개의 map 
		// 6개의 object 
		
//		날씨 정보 뽑아오기 ~!!
		String weatherURL = "";
		String placeURL = "";
		switch(cityName) { // 10개도시 날씨 정보  
			case "파리" : { weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_07150.html"; 
							placeURL = "http://hikersbay.com/europe/france/paris/attraction.html?lang=ko"; break;}
			case "런던" : { weatherURL= "http://www.weather.go.kr/repositary/sfc/climate/world/w_03776.html"; 
							placeURL = "http://hikersbay.com/europe/uk/london/attraction.html?lang=ko"; break;}
			case "앙카라" : { weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_17130.html"; break;}
			case "리스본" : { weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_08536.html"; 
							placeURL = "http://hikersbay.com/europe/portugal/lisbon/attraction.html?lang=ko"; break;}
			case "아테네" : { weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_16714.html"; 
							placeURL = "http://hikersbay.com/europe/greece/athens/attraction.html?lang=ko"; break;}
			case "프라하" : { weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_11518.html"; 
							placeURL = "http://hikersbay.com/europe/czechrepublic/prague/attraction.html?lang=ko"; break;	}
			case "베를린" : {	weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_10384.html"; 
							placeURL = "http://hikersbay.com/europe/germany/berlin/attraction.html?lang=ko"; break; }
			case "마드리드" : { weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_08222.html";
							placeURL = "http://hikersbay.com/europe/spain/madrid/attraction.html?lang=ko"; break; }
			case "로마" : { weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_16242.html"; 
							placeURL = "http://hikersbay.com/europe/italy/rome/attraction.html?lang=ko"; break; }
			case "베니스" : { placeURL = "http://hikersbay.com/europe/italy/venice/attraction.html?lang=ko"; break; }
			case "빈" : { weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_11035.html"; 
							placeURL = "http://hikersbay.com/europe/austria/vienna/attraction.html?lang=ko"; break; }
			case "뮌헨" : { placeURL = "http://hikersbay.com/europe/germany/munich/attraction.html?lang=ko"; break; }
			case "부다페스트" : { placeURL = "http://hikersbay.com/europe/italy/venice/attraction.html?lang=ko"; break; }
			case "코펜하겐" : { placeURL = "http://hikersbay.com/europe/denmark/copenhagen/attraction.html?lang=ko"; break; }
			case "바르셀로나" : { placeURL = "http://hikersbay.com/europe/spain/barcelona/attraction.html?lang=ko"; break;}
			case "이스탄불" : { placeURL = "http://hikersbay.com/europe/turkey/istanbul/attraction.html?lang=ko"; break; }
			case "암스테르담" : { placeURL = "http://hikersbay.com/europe/netherlands/amsterdam/attraction.html?lang=ko"; break; }
			default : { System.out.println("알수 없는 정보입니다. "); 	break; }
		}
		
		HashMap<String, Object> weatherStr  = new HashMap<String, Object>();
		if(weatherURL!= "") {
			Document doc = null;
			try {
				doc = Jsoup.connect(weatherURL).get();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			Elements titles = doc.select(".table_midterm");
			String wContents = "";
			
			for(Element e: titles){
				wContents += e.html();
			}	
			weatherStr.put("w", wContents);
			tourList.add(weatherStr);
		}else {
			weatherStr.put("w", "<div style = 'color : gray; margin : 2%;'> 날씨정보가 없습니다. </div>");
			tourList.add(weatherStr);
		}

		HashMap<String, Object> placeStr  = new HashMap<String, Object>();
		if(placeURL!= "") {
			Document doc = null;
			try {
				doc = Jsoup.connect(placeURL).get();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			Elements titles = doc.select(".top10ol");
			String pContents = "";

			for(Element e: titles){
				pContents += e.html();
			}	
			placeStr.put("p", pContents);
			tourList.add(placeStr);
		} else {
			placeStr.put("p", "<div style = 'color : gray'> 관광정보가 없습니다. </div>");
			tourList.add(placeStr);
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		new Gson().toJson(tourList, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
