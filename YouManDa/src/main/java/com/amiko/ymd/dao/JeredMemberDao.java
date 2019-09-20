package com.amiko.ymd.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JeredMemberDao {
	
	@Autowired
	SqlSessionTemplate ss;
	/////////////////////mylist//////////////////////////////
	
	public Map<String, Object> selectUser(Map<String, Object> map) {
		return ss.selectOne("JeredMember.selectMyinfo", map);	
	}
	
	public int updateUser(Map<String, Object> map) {
		//System.out.println(map);
		return ss.update("JeredMember.updateMyinfo", map);
		
	}
	
	public int deleteMyAccount(Map<String, Object> map) {
		return ss.delete("JeredMember.deleteMyAccount", map);
	}
	
	///////////////////////freeboard//////////////////////////////
	
	public List<Map<String, Object>> selectFreeBoardList(){
		return ss.selectList("JeredMember.selectFreeBoardList");
	}

	public void insertFreeBoard(Map<String, Object> map) {
		ss.insert("JeredMember.insertFreeBoard", map);
	}
	
}
