package com.amiko.ymd.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

}
