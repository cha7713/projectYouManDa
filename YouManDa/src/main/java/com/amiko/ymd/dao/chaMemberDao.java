package com.amiko.ymd.dao;

import java.text.DateFormat;
import java.util.Date;
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
	
	public String dup(String id) {
		return ss.selectOne("member.dup", id);
	}
	
	public String dupNick(String nick) {
		return ss.selectOne("member.dupNick", nick);
	}
	
	public String dupEmail(String email) {
		return ss.selectOne("member.dupEmail", email);
	}
	
	
	
	
}
