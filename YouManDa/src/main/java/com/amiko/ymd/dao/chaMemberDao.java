package com.amiko.ymd.dao;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Repository
public class chaMemberDao {
	
	@Autowired
	SqlSessionTemplate ss;
	
	public int join(Map<String, Object> map) {
		return ss.insert("member.join", map);
	}
	
	public Integer dup(String id) {
		System.out.println("@@@@"+id);
		Integer result = 0;
		result = ss.selectOne("member.dup", id);
//		System.out.println(ss.selectOne("member.dup", id));
		return result;
	}
	
	public String dupNick(String nick) {
		return ss.selectOne("member.dupNick", nick);
	}
	
	public String dupKakao(String kakao) {
		return ss.selectOne("member.dupKakao", kakao);
	}
	
	public String dupEmail(String email) {
		return ss.selectOne("member.dupEmail", email);
	}
	
	public Map<String, Object> login(Map<String, Object> map) {
		return ss.selectOne("member.login", map);
	}
	
	public Map<String, Object> loginKakao(String kakao) {
		return ss.selectOne("member.loginKakao", kakao);
	}
	
	
	public void editPw(Map<String, Object> map) {
		ss.update("member.editPw", map);
	}
	
	public int req(Map<String, Object> map) {
		return ss.insert("member.req", map);
	}
	
	public List<Map<String, Object>> searchMember(String name) {
		return ss.selectList("member.searchMember", name);
	}
	
	public List<Map<String, Object>> alarm(String id) {
		return ss.selectList("member.alarm", id);
	}
	
	public void ok(Map<String, Object>map) {

		ss.insert("member.ok",map);
	}
	public String frList(String id) {
		return ss.selectOne("member.friendList",id);
	}
	
	public void reject(String id) {
		ss.delete("member.reject",id);
	}
	
	public void delReq(Map<String, Object>map ) {
		ss.delete("member.delReq",map);
	}
	
	public List<Map<String, Object>> selectReq(String id ) {
		return ss.selectList("member.selectReq",id);
	}
	
	public void msg(Map<String, Object>map ) {
		ss.insert("member.msg",map);
	}
	
	public List<Map<String, Object>> selectMsg(String id) {
		return ss.selectList("member.selectMsg",id);
	}
	public void checkMsg(String id) {
		ss.update("member.msgCheck",id);
	}
	public int checkCount(String id) {
		return ss.selectOne("member.msgCheck",id);
	}
	
	
	
}
