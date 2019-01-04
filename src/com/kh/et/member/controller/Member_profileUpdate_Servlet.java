package com.kh.et.member.controller;

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
import com.kh.et.member.model.service.MemberService;
import com.kh.et.member.model.vo.Member;
import com.kh.et.tourBoard.model.vo.Attachment;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class Member_profileUpdate_Servlet
 */
@WebServlet("/updateProfile.me")
public class Member_profileUpdate_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Member_profileUpdate_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mno = Integer.parseInt(request.getParameter("mno"));
		
		if(ServletFileUpload.isMultipartContent(request)) { // multipart로 전송되었는가를 체크
			//전송 파일 용량 제한 :  10MB로 제한
			int maxSize =  1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			System.out.println(root);
			
			String filePath = root + "profileUpload/";
			
			//사용자가 올린 파일명을 그대로 저장하지 않는 것이 일반적이다.
			//1.같은 파일명이 있는 경우 이전 파일을 덮어 쓸 수 있다.
			//2.한글로된 파일명, 특수기호, 띄어쓰기는 서버에 따라 문제가 생길 수 도 있다.
			
			//DefaultFileRenamePolicy는 cos.jar 제공하는 클래스
			//같은 파일명이 존재하는지를 검사하고 있을 경우에는 뒤에 숫자를 붙여준다.
			//ex : aaa.zip, aaa1.zip, aaa2.zip
			
			/*MultipartRequest multiRequest
			 = new MultipartRequest(request, filePath, maxSize, 
					 "UTF-8", new DefaultFileRenamePolicy());*/
			
			MultipartRequest multiRequest
			 = new MultipartRequest(request, filePath, maxSize,
					 "UTF-8", new MyFileRenamePolicy());
			
			
			// 다중 파일을 묶어서 업로드하기 위해 컬렉션 사용
			// 저장한 파일의 이름을 저장 할 arrayList 생성
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			// 원본파일의 이름을 저장할 ArrayList 생성
			ArrayList<String> originFiles = new ArrayList<String>();
			
			// 각 파일의 정보를 구해온 뒤 DB에 저장할 목적의 데이터를 꺼내온다.
			Enumeration<String> files = multiRequest.getFileNames();
			// Enumeration : ResultSet처럼 반복해서 값을 꺼낼 수 있다. 

			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				
				System.out.println("saveFiles.name :" +multiRequest.getFilesystemName(name));
				System.out.println("originFiles.name :" +multiRequest.getOriginalFileName(name));

			}
			
			String multiprContent = multiRequest.getParameter("profileTxt");
			System.out.println(multiprContent);
			
			//Board객체 생성
			Member m = new Member();
			m.setM_no(mno);
			m.setM_profile(multiprContent);
		
			// Attachment 객체 생성하여 arrayList 객체 생성
			ArrayList<Attachment> fileList= new ArrayList<Attachment>();
			
			// 전송이 역순으로 오기 때문에 꺼꾸로 넣어둘 것이다.
			for(int i = originFiles.size() -1; i>= 0; i--) {
				Attachment at = new Attachment();
				at.setFilePath(filePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				at.setaType("프로필");
				
				fileList.add(at);
			}
			
			Member resultUser = new MemberService().updateProfile(m, fileList);
			
			if(resultUser != null) {
				String oldFileName = ((Member)request.getSession().getAttribute("loginUser")).getA_change_Name();
				oldFileName = oldFileName.substring(4);
				 
				if(!oldFileName.equals("/et/image/common/logo_c.png")) {
					File oldFile = new File(root + oldFileName);
					
					if( oldFile.exists() ){ 
						if(oldFile.delete()){ 
							System.out.println("파일삭제 성공"); 
						}else{ 
							System.out.println("파일삭제 실패"); 
						} 
					}else{ System.out.println("파일이 존재하지 않습니다."); }

				}
				request.getSession().setAttribute("loginUser", resultUser);
				request.setAttribute("isclose", "Y");
				request.getRequestDispatcher("views/normal/myPage/myPage_profile_edit.jsp").forward(request, response);
				//response.sendRedirect(request.getContextPath() + "/selectPlanList.pl?mno="+resultUser.getM_no());
			} else {
				// 실패 시 저장된 사진 삭제시켜줘야 한다.
				for(int i = 0; i <saveFiles.size(); i++) {
					// 파일시스템에 저장된 이름으로 파일 객체 생성
					File failedFile = new File(filePath + saveFiles.get(i));
					
					// true false를 리턴함.
					failedFile.delete();
				}
				
				request.setAttribute("msg", "프로필 수정 실패!");
				request.getRequestDispatcher(request.getContextPath() + "/selectPlanList.pl?mno="+mno).forward(request, response);
				
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
