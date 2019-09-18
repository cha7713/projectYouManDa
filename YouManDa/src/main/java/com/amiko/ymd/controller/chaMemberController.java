package com.amiko.ymd.controller;

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
import org.springframework.web.bind.annotation.RequestParam;

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
	
}
