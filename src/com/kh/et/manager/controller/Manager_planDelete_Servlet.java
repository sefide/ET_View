package com.kh.et.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.manager.model.service.ManagerService;


@WebServlet("/planDelete.mng")
public class Manager_planDelete_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Manager_planDelete_Servlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String[] arr=request.getParameterValues("arr1[]");
		int[] arr2 = new int[arr.length]; //정수배열 초기화
		
		
		for(int i=0;i<arr.length;i++) {
			//int형으로 변환 후 배열에 담기
			arr2[i] = Integer.parseInt(arr[i]);
		}
		
		//플랜삭제
		int planDelete = new ManagerService().planDelete(arr2);
		
		if(planDelete!=0) {
			response.getWriter().print("성공");
		}else {
			response.getWriter().print("실패");
		}
		
	}

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
