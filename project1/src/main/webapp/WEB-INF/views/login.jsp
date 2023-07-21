<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지 입니다.</title>
</head>
<body>
<%@include file="menu.jsp" %>
	<h1>로그인</h1>
	<form action="./login" method="post">
	
	<input type="text" name="id" id="id" placeholder="아이디를 입력하세요"><br>
	<input type="password" name="pw" id="pw" placeholder="패스워드를 입력하세요"><br>
	<button type="submit">로그인하기</button>
	
	</form>
</body>
</html>