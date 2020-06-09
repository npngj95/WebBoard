package com.koreait.webboard.common.mail;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailHandler {
	private JavaMailSender mailSender;
	private MimeMessage message;
	private MimeMessageHelper messageHelper;
	
	public MailHandler(JavaMailSender mailSender) throws MessagingException {
		this.mailSender = mailSender;
		message = this.mailSender.createMimeMessage();
		messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	}

	// 이메일 제목
	public void setSuject(String subject) throws MessagingException {
		messageHelper.setSubject(subject);
	}
	
	// 이메일 내용
	public void setText(String text) throws MessagingException {
		messageHelper.setText(text);
	}
	
	// 이메일 보내는 이
	public void setFrom(String email, String name) throws MessagingException, UnsupportedEncodingException {
		messageHelper.setFrom(email, name);
	}
	
	// 이메일 받는 이
	public void setTo(String email) throws MessagingException {
		messageHelper.setTo(email);
	}

	// 이메일 전송
	public void send() {
		try {
			mailSender.send(message);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
