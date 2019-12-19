package cot.colabare.mail.domain;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
public class MailAuthDto extends Authenticator {
	PasswordAuthentication pa;
	public MailAuthDto() {
		String id="cottrangg@gmail.com";
		String pw="qazwsx13!";
		
		pa=new PasswordAuthentication(id, pw);
	}
	
	public PasswordAuthentication getPasswordAuthentication() {
		return pa;
	}

}
