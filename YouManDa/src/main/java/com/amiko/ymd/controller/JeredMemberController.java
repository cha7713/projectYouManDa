package com.amiko.ymd.controller;

import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.amiko.ymd.service.JeredMemberService;

@Controller
public class JeredMemberController {
	
	@Autowired
	JeredMemberService jeredMemberService;
	
///////////////////////////////////MyPagePart////////////////////////////////////////////
	
	@RequestMapping(value="mypage/{id}", method=RequestMethod.GET) // PathVariable
	public String mypage(Model model, @PathVariable("id") String id) { //위에 중괄호에 있는 id를 map으로 받음
		Map<String, Object> map = new HashMap<>();
		map.put("id", id);
		model.addAttribute("personalinfo", jeredMemberService.selectUser(map)); // 서비스에서 가져온걸 jsp까지 떠넘겨줌
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
			// 클라이언트가 요청을 보낼 때 파라미터로 넘어 온 것들을 다 받아 주는것 -db
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
	public String freeboardListGET(Model model) {
		//model.addAttribute("fblist",jeredMemberService.selectFreeBoardList());
		List<Map<String, Object>> a=jeredMemberService.selectFreeBoardList();
		model.addAttribute("fblist",a);
		
		return "freeboard";
	}
	
	@RequestMapping(value = "englishhome/freeboard/ajax", method = RequestMethod.GET) //AJAX연습
	@ResponseBody
	public List<Map<String, Object>> freeboardListGET22() {
		List<Map<String, Object>> a=jeredMemberService.selectFreeBoardList();
		
		return a;
	}
	
	@RequestMapping(value = "englishhome/freeboard/freeboardwrite", method = RequestMethod.GET)
	public String freeboardWriteGET() {
		return "freeboardwrite";
	}
	
	@RequestMapping(value = "englishhome/freeboard/freeboardwrite", method = RequestMethod.POST)
	public String freeboardWritePost(@RequestParam Map<String, Object> map) {
		jeredMemberService.insertFreeBoard(map);
		return "redirect:/englishhome/freeboard";
	}
	
	@RequestMapping(value="englishhome/freeboard/freeboardin/{bnum}", method=RequestMethod.GET)
	public String selectFreeBoardOne(Model model,@PathVariable("bnum") int bnum) {
		model.addAttribute("viewcontent",jeredMemberService.selectFreeBoardOne(bnum));
		
//		Map<String, Object> map = new HashMap<>();
//		map.put("bnum", bnum);
//		model.addAttribute("viewreply",jeredMemberService.selectreply(map));
//		
		model.addAttribute("viewreply",jeredMemberService.selectreply(bnum));

		return "freeboardview";
	}
	
	@RequestMapping(value="addfreereply")
	@ResponseBody
	public String addfreereply(Model model,@RequestParam("bnum") Map<String, Object> map) {
		jeredMemberService.insertreply(map);
		return "1";
	}
	
	@RequestMapping(value="recommendation")
	@ResponseBody
	public String recommemdation(Model model,@RequestParam("bnum") int bnum) {
		int result = jeredMemberService.recommendation(bnum);
		return "1";
	}
	
	
	
	@RequestMapping(value="englishhome/freeboard/freeboardin/freeboardedit/{bnum}", method=RequestMethod.GET)
	public String freeboardeditGET(Model model, @PathVariable("bnum") int bnum) {
		model.addAttribute("editpost",jeredMemberService.selectFreeBoardOne(bnum));
		return "freeboardedit";
	}
	
	@RequestMapping(value="englishhome/freeboard/freeboardin/freeboardedit/{bnum}",method=RequestMethod.POST)
	public String freeboardeditPOST(Model model, @PathVariable("bnum") int bnum, @RequestParam Map<String, Object> map) {
		map.put("bnum", bnum);
		model.addAttribute("editpost",jeredMemberService.freeBoardEdit(map));
		return "redirect:/englishhome/freeboard";
	}


	
	

	
	
}
