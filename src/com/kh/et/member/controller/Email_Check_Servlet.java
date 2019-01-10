package com.kh.et.member.controller;

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

/**
 * Servlet implementation class SendEmailServlet
 */
@WebServlet("/sendEmail.me")
public class Email_Check_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Email_Check_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String userEmail = request.getParameter("userEmail");
		String randomCode = request.getParameter("randomCode");
		String randomCode2 = request.getParameter("randomCode2");
		
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
            InternetAddress to = new InternetAddress(userEmail);
            msg.setRecipient(Message.RecipientType.TO, to);
             
            // 이메일 제목
            msg.setSubject("[ET Planner] 인증번호", "UTF-8");
             
            // 이메일 내용
            request.setAttribute("randomCode", randomCode2);
            msg.setText("ET Planner에 방문해주셔서 감사합니다!<br>인증번호를 입력해주세요^O^<br><br>인증번호 : "+randomCode2, "UTF-8");
       
             
            // 이메일 헤더
            msg.setHeader("content-Type", "text/html");
             
            //메일보내기   
            Transport.send(msg);
       
            System.out.println("보냇씁니다");
            
            response.getWriter().print("SUCCESS");
            
		} catch(Exception e){
		response.getWriter().print("FAIL");
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
