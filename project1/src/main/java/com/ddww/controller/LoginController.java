package com.ddww.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ddww.dto.JoinDTO;
import com.ddww.dto.LoginDTO;
import com.ddww.service.LoginService;
import com.ddww.util.Util;

@Controller


public class LoginController {


	
	@Autowired
	private LoginService loginService;
	@Autowired
	private Util util;
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}

	@PostMapping("/login")
	public String login(HttpServletRequest request) {
		System.out.println("아이디 : "+request.getParameter("id"));
		System.out.println("패스워드 : "+ request.getParameter("pw"));
		LoginDTO dto = new LoginDTO();
		dto.setM_id(request.getParameter("id"));
		dto.setM_pw(request.getParameter("pw"));
		//생각해주세요. id/pw를 보냈을 때 무엇이 왔으면 좋을까요?
		//이름 + COUNT(*)
		dto = loginService.login(dto);
//		System.out.println("아이피 : "+util.getIp()+" : "+dto.getM_name());
		System.out.println(dto.getCount());
		if(dto.getCount()==1) {
			//세션을 만들어서 로그인을 지정 시간동안 유지시킵니다.
			HttpSession session = request.getSession();
			session.setAttribute("mname", dto.getM_name());
			session.setAttribute("mid", request.getParameter("id"));
			System.out.println(dto.getM_name());
			System.out.println(dto.getM_id());
			//세션 : 서버에 저장, 쿠키 : 클라이언트에 저장
			return "redirect:index";	
		}else {
			return "login";
		}
		
	}
	
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		if(session.getAttribute("mname") != null) {
		session.removeAttribute("mname");//세선 삭제하기
		
			
		}
		if(session.getAttribute("mid") != null) {
			session.removeAttribute("mid");
		}
		
		session.setMaxInactiveInterval(0); //세션 유지시간을 0으로 = 종료시키기
		session.invalidate();//세션 초기화 = 종료 = 세션의 모든 속성 값을 제거
		
		return "redirect:index";
	}
	
	@GetMapping("/join")
	public String join() {
		
		return "join";
	}
	@PostMapping("/join")
	public String join(JoinDTO joinDTO) {
		System.out.println("jsp에서 받아오는 값 : " + joinDTO.getGender());
		System.out.println("jsp에서 받아오는 값 : " + joinDTO.getBirth());
		System.out.println("jsp에서 받아오는 값 : " + joinDTO.getPw1());
		
		int result = loginService.join(joinDTO);
		
		if(result == 1) {
			return"redirect:/login";
		}else {
			return "redirect:/join";
		}
	}
	
	@GetMapping("/members")
	public ModelAndView members() {
		ModelAndView mv = new ModelAndView("members"); //members.jsp로 보냅니다.
		List<JoinDTO> list = loginService.members();
		mv.addObject("list", list);
		return mv;
	}
	

	
	
	
	
	
	
	
	
}
