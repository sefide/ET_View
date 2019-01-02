package com.kh.et.tourBoard.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.et.common.MyFileRenamePolicy;
import com.kh.et.tourBoard.model.service.TourBoardService;
import com.kh.et.tourBoard.model.vo.Attachment;
import com.kh.et.tourBoard.model.vo.TourBoard;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/insert.tbo")
public class InsertTourBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertTourBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//폼전송을  multipart/form-data로 전송하는 경우에는
		//기존처럼 request.getParameter로 값을 받을 수 없다.
		
		//cos.jar 가 파일도 받고 다른 값들도 받아주는 역할을 한다.
		//com.orelilly.servlet의 약자이다.
		if(ServletFileUpload.isMultipartContent(request)) {
			//전송 파일 용량 제한: 10MB로 제한
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			System.out.println(root);
			
			String filePath = root + "tourUpload/";
			
			//사용자가 올린 파일명을 그대로 저장하지 않는 것이 일반적이다.
			//1.같은 파일명이 있는 경우 이전 파일을 덮어 쓸 수 있다.
			//2.한글로된 파일명, 특수기호, 띄어쓰기는 서버에 따라 문제가 생길 수 도 있다.
			
			//DefaultFileRenamePolicy는 cos.jar 제공하는 클래스
			//같은 파일명이 존재하는지를 검사하고 있을 경우에는 뒤에 숫자를 붙여존다.
			//ex : aaa.zip, aaa1.zip, aaa2.zip
			
			MultipartRequest multiRequest 
				= new MultipartRequest(request, filePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			//다중 파일을 묶어서 업로드 하기 위해 컬렉션 사용
			//저장한 파일의 이름을 저장할 arrayList 생성
			ArrayList<String> saveFiles  = new ArrayList<String>();
			
			//원본 파일의 이름을 저장할 ArrayList 생성
			ArrayList<String> originFiles = new ArrayList<String>();
			
			//각 파일의 정보를 구해온 뒤 DB에 저장할 목적의 데이터를 꺼내온다.
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				System.out.println("name: " + name);
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				
				System.out.println("fileSystem name: "+ multiRequest.getFilesystemName(name));
				System.out.println("originFile name: "+multiRequest.getOriginalFileName(name));
			}
			
			String multiTitle = multiRequest.getParameter("title");
			String multiPowerLink = multiRequest.getParameter("powerLink");
			String multiConcept = multiRequest.getParameter("concept");
			int multiPrice = Integer.parseInt(multiRequest.getParameter("price"));
			String multiTourContent = multiRequest.getParameter("tourContent");
			String multiContectLint = multiRequest.getParameter("link");
			String multiTcno = multiRequest.getParameter("tcno");
			int multiTctno =Integer.parseInt(multiRequest.getParameter("city"));
			
			
			System.out.println("multiTitle:" + multiTitle);
			
			//Board객체 생성
			TourBoard tb = new TourBoard();
			/*tb.setTcno(Integer.parseInt(multiTcno));*/
			/*tb.setTctno(Integer.parseInt(multiTctno));*/
			tb.setTctno(multiTctno);
			tb.settTitle(multiTitle);
			tb.settConcept(multiConcept);
			tb.settInfo(multiTourContent);
			tb.settPrice(multiPrice);
			tb.settLink(multiContectLint);
			tb.settGrade(multiPowerLink);
			
			
			
			
			
			//Attachment 객체 생성하여 arrayList 객체 생성
			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			
			for(int i = originFiles.size() -1; i >= 0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(filePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				at.setaType("투어");
				
				fileList.add(at);
			}
			int result = new TourBoardService().insertTourBoard(tb, fileList);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath()+"/selectList.tbo");
			}else {
				//실패시 저장된 사진 삭제
				for(int i=0;i<saveFiles.size();i++) {
					//파일시스템에 저장된 이름으로 파일 객체 생성
					File failedFile = new File(filePath + saveFiles.get(i));
					
					//true false를 리턴
					failedFile.delete();
				}
	
				request.setAttribute("msg", "게시물 등록 실패!");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
