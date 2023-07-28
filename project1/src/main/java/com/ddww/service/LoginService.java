package com.ddww.service;

import java.util.List;

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

}
