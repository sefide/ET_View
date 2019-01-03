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
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cityName = request.getParameter("cityName");
		int cityNum = Integer.parseInt(request.getParameter("cityNum"));
		
		// 도시 정보, 음 날씨 뽑아오고
		System.out.println("cityName : " + cityName);
		System.out.println("cityNum : " + cityNum);
		// 관련 투어 정보 뽑아오자 
		ArrayList<HashMap<String, Object>> tourList = new TourBoardService().selectCityTourList(cityNum);
		// t : tourBoar / a : attachment 
		// 3개의 map 
		// 6개의 object 
		JSONObject obj = null;
		JSONObject tourMap = new JSONObject();
		System.out.println("헹 " + tourList.size());
		// T_NO, T_TITLE, T_CT_NO, T_CONCEPT, CT_NAME, C_NO, T_PRICE, A_NO, A_ORIGIN_NAME, A_CHANGE_NAME, A_FILE_PATH, A_UPLOAD_DATE 
		// , , , , , C_NO, , A_NO, A_ORIGIN_NAME, A_CHANGE_NAME, A_FILE_PATH, A_UPLOAD_DATE 
		if(tourList != null) {
		for (int i = 0; i < tourList.size(); i++) {
			System.out.println("헹 servlet for문 진입 ");
			obj = new JSONObject();
			obj.put("tno", ((TourBoard)tourList.get(i).get("t")).getTno());
			obj.put("title", URLEncoder.encode(((TourBoard)tourList.get(i).get("t")).gettTitle(),"UTF-8"));
			obj.put("ctno", URLEncoder.encode(((TourBoard)tourList.get(i).get("t")).gettTitle(),"UTF-8"));
			obj.put("ctname", URLEncoder.encode(((TourBoard)tourList.get(i).get("t")).getTctName(),"UTF-8"));
			obj.put("concept", URLEncoder.encode(((TourBoard)tourList.get(i).get("t")).gettConcept(),"UTF-8"));
			obj.put("price", ((TourBoard)tourList.get(i).get("t")).gettPrice());
			
			obj.put("ano", ((Attachment)tourList.get(i).get("a")).getAno());
			obj.put("originName",  URLEncoder.encode(((Attachment)tourList.get(i).get("a")).getOriginName(),"UTF-8"));
			obj.put("changeName",  URLEncoder.encode(((Attachment)tourList.get(i).get("a")).getChangeName(),"UTF-8"));

			tourMap.put("t"+i, obj);
		}	
		}
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		out.print(tourMap.toJSONString());
		
		out.flush();
		out.close();
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
