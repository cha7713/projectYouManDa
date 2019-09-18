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
	
	public Map<String, Object> selectUser(Map<String, Object> map) {
		return ss.selectOne("JeredMemebr.selectMyinfo", map);	
	}

}
