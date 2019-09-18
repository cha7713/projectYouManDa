package com.amiko.ymd.service;

import java.text.DateFormat;
import java.util.Date;
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
		 return dao.join(map);
		
	}
	 
	 public String idDup(String id) {
		 return dao.dup(id);
		
	}
	
}
