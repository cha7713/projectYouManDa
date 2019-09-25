package com.amiko.ymd.service;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.amiko.ymd.dao.chaMemberDao;

/**
 * Handles requests for the application home page.
 */
@Service
public class chaMemberService {
	
	@Autowired 
	chaMemberDao dao;
	
	 public int join(Map<String, Object> map) {
		 map.put("frid","친구목록/");
		
		 int a=dao.join(map);
		 dao.ok(map);
		 return a;
		 
		
	}
	 
	 public Integer idDup(String id) {
		 return dao.dup(id);
		
	}
	 
	 public String nickDup(String nick) {
		 return dao.dupNick(nick);
		
	}
	 
	 public String kakaoDup(String kakao) {
		 return dao.dupKakao(kakao);
		
	}
	 
	 public String emailDup(String email) {
		 return dao.dupEmail(email);
		
	}
	 
	 public Map<String, Object> login(Map<String, Object> map) {
		 return dao.login(map);
		
	}
	 
	 public Map<String, Object> loginKakao(String kakao) {
		 return dao.loginKakao(kakao);	
	}
	 
	 public void editPw(Map<String, Object> map) {
		 dao.editPw(map);
		
	}
	 
	 public int req(Map<String, Object> map) {
		return dao.req(map);
	}
	 
	 public List<Map<String, Object>> searchMember(String name) {
		return dao.searchMember(name);
	}
	 
	 public List<Map<String, Object>> alarm(String id) {
		return dao.alarm(id);
	}
	 
	 public void ok(Map<String, Object>map) {
		 
		 
		String id=(String) map.get("id");
		 String list=dao.frList(id);
		 dao.reject(id);		 
		 String frid = (String) map.get("frid");
		 Map<String, Object> m2 = new HashMap<String, Object>();
		 m2.put("id",id);
		 m2.put("id2",frid);
		 dao.delReq(m2);
		 list += "/"+frid; 
		 map.put("frid",list);   
		 dao.ok(map);
		 
		 
		 
		 id = (String) frid;
		 frid=(String) map.get("id");
		 map.put("id",id);
		 list=dao.frList(id);
		 dao.reject(id);
		 
		 list += "/"+frid; 
		 map.put("frid",list);
		 int lang=dao.dup(id);
		 map.put("lang",lang);
		 dao.ok(map);
		 
		
	}
	 
	 public void delreq(Map<String, Object>map) {
		dao.delReq(map);
	}
	 
	 public List<Map<String, Object>> selectReq(String id) {
			return dao.selectReq(id);
		}
	 
	 public String[] frLIst(String id) {
		
		 String frid = dao.frList(id);
		 String[] arr=frid.split("/");
		return arr; 
			
		}
	 
	
}
