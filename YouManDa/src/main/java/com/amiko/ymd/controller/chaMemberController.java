package com.amiko.ymd.controller;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amiko.ymd.hash.ShaPassword;
import com.amiko.ymd.mail.MailAuth;
import com.amiko.ymd.service.JeredMemberService;
import com.amiko.ymd.service.chaMemberService;

@Controller
public class chaMemberController {

	@Autowired
	chaMemberService ser;
	
	@Autowired
	JeredMemberService jeredMemberService;
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "redirect:home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model) {

		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Locale locale, Model model, HttpServletRequest req, @RequestParam Map<String, Object> map) {

		Map<String, Object> user = ser.login(map);
		HttpSession session = req.getSession();

		if (user != null) {
			session.setAttribute("id", user.get("id"));
			return "home";
		} else {
			model.addAttribute("msg","로그인 실패");
			return "login";
			
		}
		
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {

		return "join";
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Locale locale, Model model, @RequestParam Map<String, Object> map) {
		String addr = (String) map.get("address");
		addr += " ";
		addr += (String) map.get("add2");
		map.put("address", addr);

		String p1 = (String) map.get("p1");
		String p2 = (String) map.get("p2");
		String p3 = (String) map.get("p3");
		map.put("phonenum", p1 + p2 + p3);

		int result = ser.join(map);

		model.addAttribute("result", result);

		return "home";
	}

	@RequestMapping(value = "/idDup", method = RequestMethod.GET)
	@ResponseBody
	public int dup(HttpServletRequest req) {
		String result = ser.idDup(req.getParameter("id"));
		// 중복 검사 해서 아이디가 존재 할경우 1을 넘기고 없으면 0을넘김
		int a = 0;
		if (result != null) {
			a = 1;
		}

		return a;
	}

	@RequestMapping(value = "/nickDup", method = RequestMethod.GET)
	@ResponseBody
	public int dupNick(HttpServletRequest req) {
		String result = ser.nickDup(req.getParameter("nick"));
		// 중복 검사 해서 닉네임이 존재 할경우 1을 넘기고 없으면 0을넘김
		int a = 0;
		if (result != null) {
			a = 1;
		}

		return a;
	}

	@RequestMapping(value = "/emailDup", method = RequestMethod.GET)
	@ResponseBody
	public int dupEmail(HttpServletRequest req) {
		String result = ser.emailDup(req.getParameter("email"));
		// 중복 검사 해서 email 존재 할경우 1을 넘기고 없으면 0을넘김
		int a = 0;
		if (result != null) {
			a = 1;
		}

		return a;
	}
	@RequestMapping(value = "/insertId", method = RequestMethod.GET)
	public String insertId(Model model, HttpServletRequest req) {
		
		return "insertId";
	
	}
	
	@RequestMapping(value = "/pwFind", method = RequestMethod.GET)
	public String pwFind(Model model, HttpServletRequest req) {
		String id = (String) req.getParameter("id");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id",id);
		
		map=jeredMemberService.selectUser(map);
		
		if (map == null) {
			model.addAttribute("msg","존재하지 않는 아이디 입니다");
			return "insertId";
		}
		
		String uesrEmail=(String) map.get("email");
		
		
		 Properties prop = System.getProperties();
	        prop.put("mail.smtp.starttls.enable", "true");
	        prop.put("mail.smtp.host", "smtp.gmail.com");
	        prop.put("mail.smtp.auth", "true");
	        prop.put("mail.smtp.port", "587");
	        
	        Authenticator auth = new MailAuth();
	        
	        Session session = Session.getDefaultInstance(prop, auth);
	        
	        MimeMessage msg = new MimeMessage(session);
	        
	        
	    
	        try {
	            msg.setSentDate(new Date());
	            
	            msg.setFrom(new InternetAddress("youmanda123@gmail.com", "YouManDa"));
	            InternetAddress to = new InternetAddress(uesrEmail);         
	            msg.setRecipient(Message.RecipientType.TO, to);            
	            msg.setSubject("YouManDa 비밀번호 찾기", "UTF-8");   
	            
	            Random r = new Random();
	            int ran=r.nextInt(10000);
	            
	            ShaPassword sha256 = new ShaPassword();
	            String code =sha256.sha256(ran);
	            
	            msg.setContent("<h3>아래의 코드를 사이트에 입력해 주세요</h3>"+"<br><br>"+code, "text/html;charset=UTF-8"); // 내용과 인코딩
	            

//	            msg.setText("아래의 코드를 사이트에 입력해 주세요"+"<br>"+code, "UTF-8");            
	            
	            Transport.send(msg);
	            
	            HttpSession session2 = req.getSession();
	            session2.setAttribute("code", code);
	            
	            
	        } catch(AddressException ae) {            
	            System.out.println("AddressException : " + ae.getMessage());           
	        } catch(MessagingException me) {            
	            System.out.println("MessagingException : " + me.getMessage());
	        } catch(UnsupportedEncodingException e) {
	            System.out.println("UnsupportedEncodingException : " + e.getMessage());			
	        }

	
		return "codeIn";
	}
	
	

}
