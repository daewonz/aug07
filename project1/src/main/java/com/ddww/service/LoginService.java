package com.ddww.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ddww.dao.LoginDAO;
import com.ddww.dto.LoginDTO;

@Service
public class LoginService {
	@Autowired
	LoginDAO loginDAO;
	
	public LoginDTO login(LoginDTO dto) {
	
		return loginDAO.login(dto);
	}

}
