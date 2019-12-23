package cot.colabare.mail.service;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.springframework.stereotype.Service;

@Service
public interface MailService {
	void sendMailService(String from, String to, String name, String subject, String content) throws AddressException, MessagingException, UnsupportedEncodingException;
}
