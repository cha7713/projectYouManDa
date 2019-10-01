package com.amiko.ymd.controller;

import java.io.Console;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.mysql.jdbc.StringUtils;

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
	
	@RequestMapping(value="checkMyPost", method=RequestMethod.GET)
	public String checkMyPost(Model model, HttpSession session, @RequestParam Map<String,Object> map) {
		String id = (String)session.getAttribute("id");

		map.put("id", id);
		model.addAttribute("checkfreeboardPost", jeredMemberService.checkMyPostInFreeboard(map));
		return "checkMyPost";	
	}
	
	@RequestMapping(value="checkMyReply", method=RequestMethod.GET)
	public String checkMyReply(Model model, HttpSession session, @RequestParam Map<String,Object> map) {
		String id = (String)session.getAttribute("id");
		map.put("id", id);
		model.addAttribute("checkfreeboardReply", jeredMemberService.checkMyReplyInFreeboard(map));
		return "checkMyReply";	
	}
	
	
	@RequestMapping(value="deleteMyAccount", method = RequestMethod.GET)
	public String deleteMyAccount (@RequestParam Map<String,Object> map, HttpSession session) {
		String id = (String) session.getAttribute("id");
		map.put("id", id);
		jeredMemberService.deleteMyAccount(map);
		session.invalidate(); // 세션 지우기
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
	
	//게시글 쓰기get
	@RequestMapping(value = "englishhome/freeboard/freeboardwrite", method = RequestMethod.GET)
	public String freeboardWriteGET() {
		return "freeboardwrite";
	}
	
	// 게시글 쓰기post
	@RequestMapping(value = "englishhome/freeboard/freeboardwrite", method = RequestMethod.POST)
	public String freeboardWritePost(@RequestParam Map<String, Object> map) {
		jeredMemberService.insertFreeBoard(map);
		return "redirect:/englishhome/freeboard";
	}
	
	
	// 지정 게시물 조인시 동작
	@RequestMapping(value="englishhome/freeboard/freeboardin/{bnum}", method=RequestMethod.GET)
	public String selectFreeBoardOne(Model model,@PathVariable("bnum") int bnum,HttpServletRequest req, HttpServletResponse res) {
		model.addAttribute("viewcontent",jeredMemberService.selectFreeBoardOne(bnum));
		
//		Map<String, Object> map = new HashMap<>();
//		map.put("bnum", bnum);
//		model.addAttribute("viewreply",jeredMemberService.selectreply(map));
//		
//		model.addAttribute("viewreply",jeredMemberService.selectreply(bnum));
		
		// 저장된 쿠키 불러오기
		Cookie cookies[]=req.getCookies();
		Map map=new HashMap();
		if(req.getCookies()!=null) {
			for(int i =0;i<cookies.length;i++) {
				Cookie obj=cookies[i];
				map.put(obj.getName(),obj.getValue());
			}
		}
		
		// 저장된 쿠키중에 read+count만 불러오기
		String readCount=(String)map.get("read_count");
		// 저장 될 새로운 쿠키 값 생성
		String newReadCount="|" + bnum;
		
		//저장된 쿠키에 새로운 쿠키값이 존재하는지 검사
		if(StringUtils.indexOfIgnoreCase(readCount, newReadCount)==-1) {
			// 없을 경우 쿠키 생성
			Cookie cookie = new Cookie("read_count",readCount+newReadCount);
			
			res.addCookie(cookie);
			jeredMemberService.updateHit(bnum); //업데이트 실행
		}
		
		
		return "freeboardview";
	}
	
	@RequestMapping(value="englishhome/freeboard/reply", method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> selectReply(@RequestParam("bnum") int bnum) {
		List<Map<String, Object>> list = jeredMemberService.selectreply(bnum);
		for (int i = 0; i < list.size(); i++) {
			String id=(String) list.get(i).get("id");
			Map<String, Object> m = new HashMap<String, Object>();
			m.put("id",id);
			
			
			String nick =(String) jeredMemberService.selectUser(m).get("nick");
			list.get(i).put("nick", nick);
			
		}
//		jeredMemberService.insertreply(map);
		return list;
	}
	
	@RequestMapping(value="addfreereply")
	@ResponseBody
	public String addfreereply(Model model,
			@RequestParam Map<String, Object> map,
			HttpServletRequest req, HttpSession session) {
		String id = (String) session.getAttribute("id"); // TODO
		int lang = (int) session.getAttribute("lang"); // TODO
		System.out.println(id);
		System.out.println(lang);
		map.put("id", id);
		map.put("lang", lang);
		jeredMemberService.insertreply(map);
		
		return id;
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
	
	@RequestMapping(value="englishhome/freeboard/freeboardin/deletefreeboard", method=RequestMethod.GET)
	@ResponseBody
	public String deletefreeboard(@RequestParam Map<String, Object> map) {
		jeredMemberService.deletefreeboard(map);
		return "";
	}


	
	

	
	
}
