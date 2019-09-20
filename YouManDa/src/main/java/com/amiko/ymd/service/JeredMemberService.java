package com.amiko.ymd.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amiko.ymd.dao.JeredMemberDao;

@Service
public class JeredMemberService {
	
	@Autowired
	JeredMemberDao jeredMemberDao;
	
/////////////////////mylist//////////////////////////////
	
	public Map<String, Object> selectUser(Map<String, Object> map) {
		return jeredMemberDao.selectUser(map);
	}
	
	public int updateUser(Map<String, Object> map) {
		return jeredMemberDao.updateUser(map);
	}
	
	public int deleteMyAccount(Map<String, Object> map) {
		return jeredMemberDao.deleteMyAccount(map);
	}
	
///////////////////////freeboard//////////////////////////////
	
	public List<Map<String, Object>> selectFreeBoardList(){
		return jeredMemberDao.selectFreeBoardList();
	}
	
	public void insertFreeBoard(Map<String, Object> map) {
		jeredMemberDao.insertFreeBoard(map);
	}

	public Map<String, Object> selectFreeBoardOne(int bnum){
		jeredMemberDao.updateHit(bnum);
		return jeredMemberDao.selectFreeBoardOne(bnum);
	}
	
	public int freeBoardEdit(Map<String, Object> map) {
		return jeredMemberDao.freeBoardEdit(map);
	}

}
