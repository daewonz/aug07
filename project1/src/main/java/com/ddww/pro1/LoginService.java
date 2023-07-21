package com.ddww.pro1;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginService {
	@Autowired
	LoginDAO loginDAO;
	
	public LoginDTO login(LoginDTO dto) {
	
		return loginDAO.login(dto);
	}

}
