package com.ddww.pro1;

import java.util.Arrays;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

//Controllet Service Repository Component
//Component = 객체

@Component
public class Util {
	//문자열이 들어오면 숫자로 변경하기
	public int strToInt(String str) {
		int a = 0;
		//숫자로 바꿀 수 있는 경우 숫자로, 만약 숫자로 못 바꾼다면?
		//"156" -> 156		"156번"->?
		//int arr[] = new int[str.length()];
	//	for (int i = 0; i < str.length(); i++) {
		//	if(str.charAt(i) <= 57 && str.charAt(i)>=48) {
	//			arr[i] = Integer.parseInt(str);
	//		}
	//		else {
	//			arr[i] = Integer.parseInt(str.replace(str.charAt(i), '!'));
	//		}
			//{1,5,6,33}
		
		
		
		try {
			a = Integer.parseInt(str);
		} catch (Exception e) {
			String re = "";	//숫자인 것만 모을 스트링입니다.
			StringBuilder sb = new StringBuilder();
			for (int i = 0; i < str.length(); i++) {// 한글자 한글자를 열어볼거에요
				if(Character.isDigit(str.charAt(i))) {	//뽑은 글자가 숫자일 경우 참, 아닐 경우 거짓
					//re+= str.charAt(i);	//숫자만 모아서 더해요
					sb.append(str.charAt(i));
				}
			}
			a = Integer.parseInt(sb.toString());//숫자로 만들어서
		}
		
		
		return a;//되돌려줍니다.
		}
	
	
	
	public String exchange(String a) {

		if(a.contains("<")) {
			a = a.replaceAll("<", "&lt;");

		}
		if(a.contains(">")) {
			a = a.replaceAll(">", "&gt;");
		}
		return a;
	}
	
	
	public String getIp() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();
		// 상대방 아이피 가져오기 2023-07-19
		String ip = null;// 192.168.0.0처럼 점도 가져와야 하기 때문에 String 입니다.
							// -> HttpServletRequest가 있어야 합니다.

		ip = request.getHeader("X-Forwarded-For");

		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-RealIP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("REMOTE_ADDR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}

		return ip;
	}
}
