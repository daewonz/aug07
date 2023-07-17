package com.ddww.pro1;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {
//첫화면 로딩 : index.jsp 호출
	@GetMapping(value = {"/","index"})
	public String index() {
		
		return "index";	//데이터 붙임 없이 index.jsp 페이지만 보여줍니다.
	}
	
	
}
