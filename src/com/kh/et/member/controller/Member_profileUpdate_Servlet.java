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
			int maxSize =  1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			System.out.println(root);
			
			String filePath = root + "profileUpload/";
			
			MultipartRequest multiRequest
			 = new MultipartRequest(request, filePath, maxSize,
					 "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			
			// 원본파일의 이름을 저장할 ArrayList 생성
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();

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
