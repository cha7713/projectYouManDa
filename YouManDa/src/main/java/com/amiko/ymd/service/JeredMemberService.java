package com.amiko.ymd.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amiko.ymd.dao.JeredMemberDao;
import com.amiko.ymd.dao.chaMemberDao;

@Service
public class JeredMemberService {
	
	@Autowired
	JeredMemberDao jeredMemberDao;
	@Autowired
	chaMemberService chaSer;
	@Autowired
	chaMemberDao chaDao;
	
/////////////////////mylist//////////////////////////////
	
	public Map<String, Object> selectUser(Map<String, Object> map) {
		return jeredMemberDao.selectUser(map);
	}
	
	public int updateUser(Map<String, Object> map) {
		return jeredMemberDao.updateUser(map);
	}
	
	public int deleteMyAccount(Map<String, Object> map) {
		String id = (String) map.get("id");
		String[] user = chaSer.frLIst(id);
		for (int i = 0; i < user.length; i++) {
			if(user[i]!=null && !user[i].equals("abc") && !user[i].equals("")) {
				Map<String, Object>um = new HashMap<String, Object>();
				um.put("id",user[i]);
				Map<String, Object> userInfo=jeredMemberDao.selectUser(um);
				String[] frUser = chaSer.frLIst(user[i]);
				String frList = "";
				Map<String, Object>m = new HashMap<String, Object>();
				for (int j = 0; j < frUser.length; j++) {
					String frName = frUser[j];
					
					if (frName.equals(id)) {
						continue;
					}
					frList += "/"+frName;
					m.put("frid", frList);
				}
				m.put("id",user[i]);
				m.put("lang",userInfo.get("lang"));
				chaDao.reject(user[i]);
				chaDao.ok(m);
				
			}
			
		}
		
		return jeredMemberDao.deleteMyAccount(map);
	}
	
	public List<Map<String, Object>> checkMyPostInFreeboard(Map<String, Object> map){
		return jeredMemberDao.checkMyPostInFreeboard(map);
	}
	
	public List<Map<String, Object>> checkMyReplyInFreeboard(Map<String, Object> map){
		return jeredMemberDao.checkMyReplyInFreeboard(map);
	}
	
///////////////////////freeboard//////////////////////////////
	
	public List<Map<String, Object>> selectFreeBoardList(){
		return jeredMemberDao.selectFreeBoardList();
	}
	
	public void insertFreeBoard(Map<String, Object> map) {
		jeredMemberDao.insertFreeBoard(map);
	}

	public Map<String, Object> selectFreeBoardOne(int bnum){
		//jeredMemberDao.updateHit(bnum);
		return jeredMemberDao.selectFreeBoardOne(bnum);
	}
	
	public int updateHit(int bnum) {
		return jeredMemberDao.updateHit(bnum);
	}
	
	public int freeBoardEdit(Map<String, Object> map) {
		return jeredMemberDao.freeBoardEdit(map);
	}
	
	public int recommendation(int bnum) {
		return jeredMemberDao.recommendation(bnum);
	}
	
	public void insertreply(Map<String, Object> map) {
		jeredMemberDao.insertreply(map);
	}
	
	public List<Map<String,Object>> selectreply(int bnum){
		return jeredMemberDao.selectreply(bnum);
	}
	
	public int deletefreeboard(Map<String, Object> map) {
		return jeredMemberDao.deletefreeboard(map);
	}
	
//	public List<Map<String,Object>> selectreply(Map<String, Object> map){
//		return jeredMemberDao.selectreply(map);
//	}
	
	public List<Map<String, Object>> searchFreeBoardList(String search_option, String keyword){
		return jeredMemberDao.searchFreeBoardList(search_option, keyword);
	}

	public void insertfreelike(Map<String, Object> map) {
		int bnum = (int)map.get("bnum");
		//jeredMemberDao.readfreelike(map);
		jeredMemberDao.insertfreelike(map);
		jeredMemberDao.countfreelike(bnum);

	}
	
	public void deletefreelike(Map<String, Object> map) {
		int bnum = (int)map.get("bnum");
		//jeredMemberDao.readfreelike(map);
		jeredMemberDao.deletefreelike(map);
		jeredMemberDao.countfreelike(bnum);
	}
	
	public Map<String,Object> readfreelike(Map<String, Object> map) {
		return jeredMemberDao.readfreelike(map);
		
	}
	
	
	
	
}
