package com.amiko.ymd.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.amiko.ymd.service.JeredMemberService;

@Controller
public class JeredMemberController {
	
	@Autowired
	JeredMemberService jeredMemberService;
	
	@RequestMapping(value="mypage/{id}", method=RequestMethod.GET) // PathVariable
	public String mypage(Model model, @PathVariable("id") String id) { //���� �߰�ȣ�� �ִ� id�� map���� ����
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		model.addAttribute("personalinfo", jeredMemberService.selectUser(map)); // ���񽺿��� �����°� jsp���� ���Ѱ���
		return "mypage";
	}
	
	@RequestMapping(value="mypageedit/{id}", method=RequestMethod.GET)
	public String mypageeditget(Model model,@PathVariable("id") String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		model.addAttribute("personalinfo", jeredMemberService.selectUser(map));
		return "mypageedit";	
	}
	
	@RequestMapping(value="mypageedit/{id}", method=RequestMethod.POST)
	public String mypageeditpost(Model model,@PathVariable("id") String id,
			@RequestParam Map<String, Object> map,
			// Ŭ���̾�Ʈ�� ��û�� ���� �� �Ķ���ͷ� �Ѿ� �� �͵��� �� �޾� �ִ°� -db
			@ModelAttribute MemberVO vo) {
		// getter setter
		System.out.println(vo);
		map.put("id", id);
		model.addAttribute("personalinfo",jeredMemberService.updateUser(map));
		return "redirect:/mypage/" + id;	
	}
	
	@RequestMapping(value="deleteMyAccount", method = RequestMethod.GET)
	public String deleteMyAccount (@RequestParam Map<String,Object> map, HttpSession session) {
		String id = (String) session.getAttribute("id");
		map.put("id", id);
		jeredMemberService.deleteMyAccount(map);
		session.invalidate();
		return "redirect:/";
	}
	
	///////////////////////////////////BoardPart////////////////////////////////////////////
	
	@RequestMapping(value = "englishhome/freeboard", method = RequestMethod.GET)
	public String freeboardListGET() {
		return "freeboard";
	}
	
	@RequestMapping(value = "englishhome/freeboard/freeboardwrite", method = RequestMethod.GET)
	public String freeboardGET() {
		return "freeboardwrite";
	}
	

	
	
}
