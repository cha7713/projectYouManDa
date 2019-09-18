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
	
	public Map<String, Object> selectUser(Map<String, Object> map) {
		return jeredMemberDao.selectUser(map);
	}

}
