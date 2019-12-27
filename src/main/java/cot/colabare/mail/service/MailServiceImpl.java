package cot.colabare.mail.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Properties;
import java.util.UUID;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import cot.colabare.mail.domain.MailAuthDto;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MailServiceImpl implements MailService {

	@Override
	public void sendMailService(String from, String to, String name, String subject, String content, MultipartFile[] fileList) throws AddressException, MessagingException, IOException {
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
        MimeBodyPart mp1=new MimeBodyPart();
        mp1.setText(content,"utf-8");
        Multipart mp=new MimeMultipart();
        mp.addBodyPart(mp1);
       
        String filepath="c:\\upload\\mail";
        for(MultipartFile file:fileList){
        	MimeBodyPart mp2=new MimeBodyPart();
        	UUID uuid = UUID.randomUUID();
            
            String uploadFileName = uuid.toString() + "_" + file.getOriginalFilename();
            
        	File attach_file=new File(filepath,uploadFileName);
        	file.transferTo(attach_file);
        	
        	String attach_FileName=attach_file.getName();
        	
        	mp2.setFileName(MimeUtility.encodeText(attach_FileName,"utf-8","B"));
        	
        	FileDataSource fds=new FileDataSource(attach_file);
        	DataHandler dataHandler=new DataHandler(fds);
        	mp2.setDataHandler(dataHandler);
        	
        	Path path=Paths.get(attach_file.getCanonicalPath());
        	String mimeType=Files.probeContentType(path);
        	mp2.setHeader("Content-Type", mimeType);
        	
        	mp2.setDescription(attach_FileName, "utf-8");
        	
        	System.out.println(attach_file.toString());
        	
        	mp.addBodyPart(mp2);
        }
        msg.setContent(mp);
        Transport.send(msg);
		
	}

}
