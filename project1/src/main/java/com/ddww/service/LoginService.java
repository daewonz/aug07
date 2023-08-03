package com.ddww.service;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddww.dao.LoginDAO;
import com.ddww.dto.JoinDTO;
import com.ddww.dto.LoginDTO;

@Service
public class LoginService {
	@Autowired
	LoginDAO loginDAO;
	
	public LoginDTO login(LoginDTO dto) {
	
		return loginDAO.login(dto);
	}

	public int join(JoinDTO joinDTO) {
		
		return loginDAO.join(joinDTO);
	}

	public List<JoinDTO> members() {
		return loginDAO.members();
	}

	public int checkID(String id) {
		
		return loginDAO.checkID(id);
	}

	public List<Map<String, Object>> boardList2(int i) {
		return loginDAO.boardlist2(i);
	}

	public int totalCount() {
		return loginDAO.totalCount();
	}

}
