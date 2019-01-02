package com.kh.et.manager.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.manager.model.service.ManagerService;


@WebServlet("/stop.mng")
public class Manager_Stop_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Manager_Stop_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		
		String[] arr=request.getParameterValues("arr1[]");
		int[] arr2 = new int[arr.length];
		for(int i=0;i<arr.length;i++) {
			System.out.println("값 : "+arr[i]);
			//int형으로 변환 후 배열에 담기
			arr2[i] = Integer.parseInt(arr[i]);
		}
		
		//회원정지
		/*int result = new ManagerService().stopMember(arr2);*/
		
		
		
		response.getWriter().print("받아따아");
	}


	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
