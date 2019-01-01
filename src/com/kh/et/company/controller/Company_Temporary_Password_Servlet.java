package com.kh.et.company.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.et.company.model.service.CompanyService;
import com.kh.et.member.controller.SMTPAuthenticator;
import com.kh.et.member.model.service.MemberService;

/**
 * Servlet implementation class Company_Temporary_Password_Servlet
 */
@WebServlet("/temporaryPassword.co")
public class Company_Temporary_Password_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Company_Temporary_Password_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String companyId = request.getParameter("companyId");
		String companyEmailPass = request.getParameter("companyEmailPass");
		String randomCode = request.getParameter("randomCode");
		
		Properties p = new Properties();// 정보를 담을 객체
		p.put("mail.smtp.user", "etplanner0111@gmail.com");//본인 아이디
		p.put("mail.smtp.host", "smtp.gmail.com"); 
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.starttls.enable","true"); 
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try{
		    Authenticator auth = new SMTPAuthenticator();
		    Session ses = Session.getDefaultInstance(p, auth);
		    
		    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
		    
		    msg.setSentDate(new Date());
		    InternetAddress from = new InternetAddress("etplanner0111@gmail.com");//본인아이디
             
            // 이메일 발신자
            msg.setFrom(from);
            
            // 이메일 수신자
            InternetAddress to = new InternetAddress(companyEmailPass);
            msg.setRecipient(Message.RecipientType.TO, to);
             
            // 이메일 제목
            msg.setSubject("[ET Planner] 임시비밀번호 발급", "UTF-8");
             
            // 이메일 내용
            request.setAttribute("randomCode", randomCode);
            msg.setText("ET Planner에 방문해주셔서 감사합니다!<br>회원님의 임시비밀번호입니다. 로그인 후 비밀번호를 변경해주세요.<br><br>임시비밀번호 : " + randomCode, "UTF-8");
       
             
            // 이메일 헤더
            msg.setHeader("content-Type", "text/html");
            
            int result = CompanyService.newpass(companyEmailPass, companyId, randomCode);
            
            if(result > 0) {
            	//메일보내기   
                Transport.send(msg);
               
                System.out.println("보냇씁니다");
                    
                response.getWriter().print("SUCCESS");
            }else {
            	response.getWriter().print("FAIL");
            }
  
          
		} catch(Exception e){
			e.printStackTrace();
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
