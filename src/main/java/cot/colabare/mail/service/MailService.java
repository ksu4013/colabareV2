package cot.colabare.mail.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public interface MailService {
	void sendMailService(String from, String to, String name, String subject, String content,MultipartFile[] fileList) throws AddressException, MessagingException, UnsupportedEncodingException, IOException;
}
