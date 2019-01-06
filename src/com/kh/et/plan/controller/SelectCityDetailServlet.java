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
		switch(cityName) {
			case "파리" : { weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_07150.html"; break;}
			case "런던" : { weatherURL= "http://www.weather.go.kr/repositary/sfc/climate/world/w_03776.html"; break;}
			case "앙카라" : { weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_17130.html"; break;}
			case "리스본" : { weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_08536.html"; break;}
			case "아테네" : { weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_16714.html"; break;}
			case "프라하" : { weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_11518.html"; break;	}
			case "베를린" : {	weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_10384.html"; break; }
			case "마드리드" : { weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_08222.html";break; }
			case "로마" : { weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_16242.html"; break; }
			case "빈" : { weatherURL = "http://www.weather.go.kr/repositary/sfc/climate/world/w_11035.html"; break; }
			default : { System.out.println("알수 없는 정보입니다. "); 	break; }
		}
		
		if(weatherURL!= "") {
			Document doc = null;
			try {
				doc = Jsoup.connect(weatherURL).get();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			Elements titles = doc.select(".table_midterm");
			String wContents = "";
			//print all titles in main page
			for(Element e: titles){
	//			System.out.println("text: " +e.text());
	//			System.out.println("html: "+ e.html());
				wContents += e.html();
			}	
			//System.out.println(wContents);
			//print all available links on page
	//		Elements links = doc.select("a[href]");
	//		for(Element l: links){
	//			System.out.println("link: " +l.attr("abs:href"));
	//		}
			HashMap<String, Object> weatherStr  = new HashMap<String, Object>();
			weatherStr.put("w", wContents);
			tourList.add(weatherStr);
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
