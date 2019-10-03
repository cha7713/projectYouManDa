package com.amiko.ymd.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller
public class U0MemberController {

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(Locale locale, Model model) {

		return "index";
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		System.out.println(session.getAttribute("id"));
		return "home";
	}
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String homee(Locale locale, Model model, HttpSession session) {
		System.out.println(session.getAttribute("id"));

		return "home";
	}


	
	@RequestMapping(value = "/englishhome", method = RequestMethod.GET)
	public String englishhome(Locale locale, Model model) {

		return "englishhome";
	}
	@RequestMapping(value = "/chinesehome", method = RequestMethod.GET)
	public String chinesehome(Locale locale, Model model) {

		return "chinesehome";
	}
	@RequestMapping(value = "/japanesehome", method = RequestMethod.GET)
	public String japanesehome(Locale locale, Model model) {

		return "japanesehome";
	}
	
	


}
