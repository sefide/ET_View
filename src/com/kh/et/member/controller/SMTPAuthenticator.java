package com.kh.et.member.controller;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator {
	PasswordAuthentication pa;

    public SMTPAuthenticator() {

        String id="etplanner0111@gmail.com";
        String pw = "etplanner";
        
        pa = new PasswordAuthentication(id, pw);
    }

	

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
	
}