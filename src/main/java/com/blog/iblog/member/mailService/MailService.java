package com.blog.iblog.member.mailService;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

@Service("mailService")
public class MailService {
	@Autowired
	private JavaMailSender mailSender;
	
	/* @Autowired private SimpleMailMessage preConfiguredMessage; */
	 
	
	@Async
	public void certificationMail(String to, String subject, String body) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper messageHelper = 
					new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("ktgfaa@gmail.com", "IBLOG");
			messageHelper.setSubject(subject);
			messageHelper.setTo(to);
			messageHelper.setText(body, true);
			mailSender.send(message);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Async
	public void pwdsendMail(String to, String subject, String body) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper messageHelper = 
					new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("ktgfaa@gmail.com", "IBLOG");
			messageHelper.setSubject(subject);
			messageHelper.setTo(to);
			messageHelper.setText(body, true);
			mailSender.send(message);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Async
	public void sendMail(String to, String subject, String body) {
		MimeMessage message = mailSender.createMimeMessage();
		try {
			MimeMessageHelper messageHelper = 
					new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom("ktgfaa@gmail.com", "IBLOG");
			messageHelper.setSubject(subject);
			messageHelper.setTo(to);
			messageHelper.setText(body, true);
			mailSender.send(message);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}
