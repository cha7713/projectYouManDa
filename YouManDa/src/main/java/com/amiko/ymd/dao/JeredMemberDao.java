package com.amiko.ymd.dao;

import java.util.HashMap;
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
	
	public List<Map<String, Object>> checkMyPostInFreeboard(Map<String, Object> map){
		System.out.println("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
		
		System.out.println(map.get("id"));
		return ss.selectList("JeredMember.selectMyPost", map);
	}
	public List<Map<String, Object>> checkMyReplyInFreeboard(Map<String, Object> map){
		return ss.selectList("JeredMember.selectMyReply", map);
	}
	
	///////////////////////freeboard//////////////////////////////
	
	public List<Map<String, Object>> selectFreeBoardList(){
		return ss.selectList("JeredMember.selectFreeBoardList");
	}

	public void insertFreeBoard(Map<String, Object> map) {
		ss.insert("JeredMember.insertFreeBoard", map);
	}
	
	public Map<String, Object> selectFreeBoardOne(int bnum){
		//ss.selectOne("JeredMember.countfreelike", bnum);
		return ss.selectOne("JeredMember.selectFreeBoardOne", bnum);
	}
	
	public int freeBoardEdit(Map<String, Object> map) {
		return ss.update("JeredMember.updateFreeBoard", map);
	}
	
	public int updateHit(int bnum) {
		return ss.update("JeredMember.updateHit", bnum);
	}
	
	public int recommendation(int bnum) {
		return ss.update("JeredMember.recommend", bnum);
	}
	
	public void insertreply(Map<String,Object> map) {
		
		ss.insert("JeredMember.insertreply", map);
	}
	
	public List<Map<String, Object>> selectreply(int bnum){
		return ss.selectList("JeredMember.selectreply", bnum);
	} 
	
	public int deletefreeboard(Map<String, Object> map) {
		return ss.delete("JeredMember.deletefreeboard", map);
	}
//	public List<Map<String, Object>> selectreply(Map<String, Object> map){
//		return ss.selectList("JeredMember.selectreply", map);
//	} 
	
	public List<Map<String, Object>> searchFreeBoardList(String search_option, String keyword){
		Map<String, Object> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		return ss.selectList("JeredMember.searchingPost", map);
	}
	
	
	// 좋아요 추가
	public void insertfreelike(Map<String,Object> map) {
		ss.insert("JeredMember.insertfreelike", map);
	}
	// 좋아요 삭제
	public void deletefreelike(Map<String, Object> map) {
		ss.delete("JeredMember.deletefreelike", map);
	}
	// 좋아요 갯수 확인
	public int countfreelike(int bnum) {
		return ss.update("JeredMember.countfreelike", bnum);
	}
	// 좋아요 눌렸는지 확인
	public Map<String,Object> readfreelike(Map<String,Object> map) {
		return ss.selectOne("JeredMember.readfreelike", map);
	}
	
}
