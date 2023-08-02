package com.ddww.rest;

import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ddww.service.BoardService;
import com.ddww.service.LoginService;

@RestController
public class ResttController {
	@Autowired
	private LoginService loginService;
	@Autowired
	private BoardService boardService;
	//아이디 중복검사 2023-08-02
	@PostMapping("/checkID")
	public String checkID(@RequestParam("id") String id) {
		
		int result = loginService.checkID(id);
		//System.out.println(result);
		
		JSONObject json = new JSONObject();
		json.put("result", result);
		
		System.out.println(json.toString());
		return json.toString(); // {"result" : 1}
		
		
	}
	//boardList2
	@GetMapping("/boardList2")
	public String boardList2() {
		List<Map<String, Object>> list = loginService.boardList2();

		System.out.println(list);
		return "";	
	}
	
	
}
