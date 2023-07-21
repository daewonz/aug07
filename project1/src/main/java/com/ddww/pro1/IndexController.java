package com.ddww.pro1;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class IndexController {
//첫화면 로딩 : index.jsp 호출
	@Autowired
	Util util;
	@GetMapping(value = {"/","index"})
	public String index() {
		
		return "index";	//데이터 붙임 없이 index.jsp 페이지만 보여줍니다.
	}
	
	@GetMapping("/board2")
	public String menu() {
		
		return "/board2";
	}
	@GetMapping("/mooni")
	public String mooni() {
		
		return "/mooni";
	}
	@GetMapping("/notice")
	public String notice() {
		
		return "notice";
	}
	
	@PostMapping("/index")
	public String index(HttpServletRequest request) {
		System.out.println(util.getIp()+" : " + request.getParameter("mass"));
		
		return "index";
	}
}
