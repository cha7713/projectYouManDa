package com.amiko.ymd.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.amiko.ymd.service.JeredMemberService;

@Controller
public class JeredMemberController {
	
	@Autowired
	JeredMemberService jeredMemberService;
	
	@RequestMapping(value="personal/{id}") // PathVariable
	public String show(Model model, @PathVariable("id") String id) { //위에 중괄호에 있는 id를 map으로 받음
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		model.addAttribute("personalinfo", jeredMemberService.selectUser(map)); // 서비스에서 가져온걸 jsp까지 떠넘겨줌
		return "mypage";
	}
	
}
