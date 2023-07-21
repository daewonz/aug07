<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="shortcut icon" href="./img/favicon2.ico" type="image/x-icon">
<link rel="icon" href="./img/favicon2.ico" type="image/x-icon">
<body>
<%@include file="menu.jsp" %>
	<h1>인덱스</h1>
	<%=request.getHeader("User-Agent") %>
	<form action="./index" method="post">
	<input type="text" name="mass" id="id" placeholder="소통해요">
	<button type="submit">보내기</button>
	</form>
</body>
</html>