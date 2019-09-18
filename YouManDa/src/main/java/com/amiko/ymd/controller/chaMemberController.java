package com.amiko.ymd.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amiko.ymd.service.chaMemberService;

@Controller
public class chaMemberController {
	
	@Autowired
	chaMemberService ser;
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(Locale locale, Model model) {
		
		
		return "join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Locale locale, Model model,@RequestParam Map<String,Object> map) {
		
	 int result = ser.join(map);
	 
	 model.addAttribute("result",result);
		
		return "main";
	}
	
	@RequestMapping(value = "/idDup", method = RequestMethod.GET)
	@ResponseBody
	public int dup(HttpServletRequest req) {
		String result =ser.idDup(req.getParameter("id"));
		//중복 검사 해서 아이디가 존재 할경우 1을 넘기고 없으면 0을넘김
		int a = 0;
		if(result != null) {
			a = 1;
		}
		
		return a;
	}
	
}
