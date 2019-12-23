package cot.colabare.mail.service;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;

import org.springframework.stereotype.Service;

import cot.colabare.mail.domain.MailAuthDto;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class MailServiceImpl implements MailService {

	@Override
	public void sendMailService(String from, String to, String name, String subject, String content) throws AddressException, MessagingException, UnsupportedEncodingException {
		Authenticator auth = new MailAuthDto();
		String port = "587";
		 // Create a Properties object to contain connection configuration information.
    	Properties props = System.getProperties();
    	props.put("mail.smtp.host","smtp.gmail.com");
    	props.put("mail.smtp.port", port); 
    	props.put("mail.smtp.starttls.enable", "true");
    	props.put("mail.smtp.auth", "true");

        // Create a Session object to represent a mail session with the specified properties. 
    	Session session = Session.getInstance(props,auth);
        // Create a message with the specified information. 
        MimeMessage msg = new MimeMessage(session);
        msg.setFrom(new InternetAddress(from,name));
        msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
        msg.setSubject(subject,"utf-8");        
        msg.setContent(content,"text/html; charset=utf-8");
         
        Transport.send(msg);
		
	}

}
