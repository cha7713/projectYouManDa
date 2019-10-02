package com.amiko.ymd.controller;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amiko.ymd.hash.ShaPassword;
import com.amiko.ymd.mail.MailAuth;
import com.amiko.ymd.service.JeredMemberService;
import com.amiko.ymd.service.chaMemberService;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

@Controller
public class chaMemberController {
	
	
	List<String> loginId = new ArrayList<String>();

	@Autowired
	chaMemberService ser;

	@Autowired
	JeredMemberService jeredMemberService;

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("id");
		session.invalidate();
//		http://developers.kakao.com/logout
		
		for (int i = 0; i < loginId.size(); i++) {
			if (loginId.get(i).equals(id)) {
				loginId.remove(i);	
				
			} 
				
		}
		HttpSession session2 = req.getSession();
		session2.setAttribute("loginList", loginId);
		
		return "redirect:home";
	}
	
	@RequestMapping(value = "/loginKakao", method = RequestMethod.GET)
	public String loginKakao(Model model, @RequestParam Map<String, Object> map, HttpServletRequest req ) {
		
		Map<String, Object> user =ser.loginKakao((String) map.get("kakao"));
		HttpSession session = req.getSession();
		System.out.println("map");
		System.out.println(user);
		
		session.setAttribute("id", user.get("id"));
		session.setAttribute("lang", user.get("lang"));
		loginId.add((String) user.get("id"));
		
		session.removeAttribute("loginList");
		session.setAttribute("loginList", loginId);
		
		System.out.println("session");
		System.out.println(session.getAttribute("id"));
		
		return "home";
		 
		
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
			session.setAttribute("lang", user.get("lang"));
			
			loginId.add((String) user.get("id"));
			session.removeAttribute("loginList");
			session.setAttribute("loginList", loginId);
			
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			System.out.println(loginId);
			System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
			return "home";
		} else {
			model.addAttribute("msg", "로그인 실패");
			return "login";

		}

	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join1(Locale locale, Model model, @RequestParam Map<String, Object> map) {
		model.addAttribute("info", map);
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
	
	@RequestMapping(value = "/kakaoDup", method = RequestMethod.GET)
	@ResponseBody
	public int dupKakao(HttpServletRequest req) {
		String result = ser.kakaoDup(req.getParameter("kakao"));
		// 중복 검사 해서 아이디가 존재 할경우 1을 넘기고 없으면 0을넘김
		int a = 0;
		if (result != null) {
			a = 1;
		}

		return a;
	}

	@RequestMapping(value = "/idDup", method = RequestMethod.GET)
	@ResponseBody
	public int dup(HttpServletRequest req) {
		Integer result = ser.idDup(req.getParameter("id"));
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
	@ResponseBody
	public String pwFind(Model model, HttpServletRequest req) {
		String id = (String) req.getParameter("id");
		String code = "";
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("id",id);
		
		map=jeredMemberService.selectUser(map);
		
		if (map == null) {
//			model.addAttribute("msg","존재하지 않는 아이디 입니다");
			return "-1";
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
	            code =sha256.sha256(ran);
	            
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

	
		return code;
	}


	@RequestMapping(value = "/editPw/{id}", method = RequestMethod.GET)
	public String editPw(Model model, HttpServletRequest req, @PathVariable("id") String id) {
		
		model.addAttribute("id", id);
		return "editPw";
		
	}
	
	@RequestMapping(value = "/editPw", method = RequestMethod.POST)
	public String editPw(Model model, @RequestParam Map<String, Object>map) {
		
		ser.editPw(map);
		return "login";
	
	}
	
	@RequestMapping(value = "/friendReq", method = RequestMethod.GET)
	@ResponseBody
	public String friend(Model model, @RequestParam Map<String, Object>map) {
		
		System.out.println("----------------------------------");
		System.out.println(map.get("id2"));
		
		int lang = (ser.idDup((String) map.get("id")));
		map.put("lang", lang);
		int result =0;
		try {
			result = ser.req(map);
		}catch (Exception e) {
			result =0;
		}
		return result + "";
	
	}
	
	@RequestMapping(value = "/searchfriend", method = RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> scFriend(Model model,HttpServletRequest req) {
		String name =req.getParameter("name");
		
		HttpSession session = req.getSession();
		String id=(String) session.getAttribute("id");
		
		
		List<Map<String, Object>> result = ser.searchMember(name);
		List<Map<String, Object>> result2 = new ArrayList<Map<String, Object>>();		
		
		for (int i = 0; i < result.size(); i++) {
			String user=(String) result.get(i).get("id");
			String[] a=ser.frLIst(id);
			
			int temp = 0;
			for (int j = 0; j < a.length; j++) {
				
				if (user.equals(id) || a[j].equals(user)) {
					temp = 1;
					
					
				}				
				
			}
			if (temp == 0) {
				result2.add(result.get(i));
				
			}
		}
		
		
		
		return result2;
	
	}
	
	@RequestMapping(value = "/searchfriend", method = RequestMethod.GET)
		public String scFri(Model model,HttpServletRequest req) {
		
		
		
		return "searchFr";
	
	}
	
	@RequestMapping(value = "/ar", method = RequestMethod.GET)
	public String ar(Model model,HttpServletRequest req) {
	
	
	
	return "ar";

}
	
	@RequestMapping(value = "/alarm", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> alarm(Model model,HttpServletRequest req) {
		HttpSession session2 = req.getSession();
        String id = (String) session2.getAttribute("id");
		List<Map<String, Object>> result=ser.alarm(id);
				
	return result;

}
	
	@RequestMapping(value = "/ok", method = RequestMethod.GET)
	@ResponseBody
	public String ok(Model model,HttpServletRequest req) {
		HttpSession session2 = req.getSession();
        String id = (String) session2.getAttribute("id");
        int lang = (int) session2.getAttribute("lang");
        String frid = req.getParameter("frid");//친구신청을 한 사람의 아이디
                
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id",id);
		map.put("frid",frid);
		map.put("lang",lang);
		
		ser.ok(map);
				
	return "1";

}
	
	@RequestMapping(value = "/delReq", method = RequestMethod.GET)
	@ResponseBody
	public String del(Model model, @RequestParam Map<String, Object>map, HttpSession session) {
		
		map.put("id",session.getAttribute("id"));
		
		ser.delreq(map);
		return "거절";
	
	}
	
	@RequestMapping(value = "/idsc", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> idsc(Model model, @RequestParam Map<String, Object>map) {
		
		Map<String, Object> a =jeredMemberService.selectUser(map);
		return a;
	
	}
	
	@RequestMapping(value = "/selectReq", method = RequestMethod.GET)
	@ResponseBody
	public int selectReq(Model model,HttpServletRequest req ) {
		HttpSession session2 = req.getSession();
		String id = (String) session2.getAttribute("id");
		List<Map<String, Object>> list=ser.selectReq(id);
		int result = list.size();
		return result;
	
	}
	
	@RequestMapping(value = "/frList", method = RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> frList(Model model,HttpServletRequest req ) {
		HttpSession session2 = req.getSession();
		String id = (String) session2.getAttribute("id");
		Map<String, Object> map = null;
		
		String[] frList =ser.frLIst(id);
		int a =frList.length;
		String[] nickList = new String[a];
		List<Map<String, Object>>idNick = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < frList.length; i++) {
			map = new HashMap<String, Object>();
			String frid =frList[i];
			System.out.println(frid);
			
			if(frid.trim().equals("")) continue;
			if(frid.trim().equals("abc")) continue;
				
			map.put("id", frid);
			String nick=(String)jeredMemberService.selectUser(map).get("nick");
			map.put("frid",frid);
			map.put("nick",nick);
			nickList[i] = nick;
			idNick.add(map);
		}
		
		
		return idNick;
	
	}
	@RequestMapping(value = "/userNick", method = RequestMethod.GET)
	@ResponseBody
	public String userNick(Model model,HttpServletRequest req ) {
		HttpSession session2 = req.getSession();
		String id = (String) session2.getAttribute("id");
		Map<String, Object>map = new HashMap<String, Object>();
		map.put("id", id);
		String nick=(String) jeredMemberService.selectUser(map).get("nick");
		
		
		return nick;
	
	}
	
	@RequestMapping(value = "/chat", method = RequestMethod.GET)
	public String chat(Model model,HttpServletRequest req ) {
		
		String frid =req.getParameter("frid");
		model.addAttribute("frid",frid);
		return "chat";
	
	}
	
	@RequestMapping(value = "/msgInput", method = RequestMethod.GET)
	public String msg(Model model,HttpServletRequest req, HttpSession session ) {
		
		String fromId=(String) session.getAttribute("id");
		ser.idDup(fromId);	
		
		String frid = req.getParameter("frid");
		
		model.addAttribute("fromUser",fromId);
		
		model.addAttribute("fromUserLang",ser.idDup(fromId));
				
		model.addAttribute("toUser", req.getParameter("frid"));
		
		model.addAttribute("toUserLang",ser.idDup(frid));
		return "msgInput";
	
	}
	@RequestMapping(value = "/msgInput", method = RequestMethod.POST)
	public String msgSend(Model model,HttpServletRequest req, @RequestParam Map<String, Object>map ) {
		ser.msg(map);
		
		return "home";
	
	}
	
	@RequestMapping(value = "/msgList", method = RequestMethod.GET)
	public String msgSend(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		List<Map<String, Object>> msgList = ser.selectMsg(id);
		model.addAttribute("msgList", msgList);
		ser.checkMsg(id);
		
		return "msgView";
	
	}
	
	@RequestMapping(value = "/msgCount", method = RequestMethod.GET)
	@ResponseBody
	public String msgCount(Model model,HttpServletRequest req,HttpSession session) {
		String id = (String) session.getAttribute("id");
		int count =ser.checkCount(id);
		
		return count+"";
	
	}
	
	
}
	
	


