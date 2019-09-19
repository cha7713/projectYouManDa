package com.amiko.ymd.mail;

import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MailAuth extends Authenticator {
PasswordAuthentication pa;
    
    public MailAuth() {
        String mail_id = "youmanda123@gmail.com";
        String mail_pw = "you1234!";
        
        pa = new PasswordAuthentication(mail_id, mail_pw);
    }
    
    public PasswordAuthentication getPasswordAuthentication() {
        return pa;
    }
    
   
}
