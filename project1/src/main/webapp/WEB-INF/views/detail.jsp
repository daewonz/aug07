<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/detail.css">
</head>
<body>
<%@include file="menu.jsp" %>
<h1>상세보기</h1>
	<div>zzzzzzzzzzzzzzzz</div>
	<div>bbbbbbbbbbbbbbbbb</div>
	<div>ccccccccccccccccccccc</div>
	<div>dddddddddddddddddd</div>
	<div>eeeeeeeeeeeeeeeeeee</div>
	<div>fffffffffffffffffff</div>
<div class="center">
<table class="tab" border="2">
<tr class="writer">
	<th >작성자</th>
	<th class="writer1">${dto.bwrite } 님</th>
	<th class="date">날짜</th>
	<th>${dto.bdate }</th>
</tr>
<tr class="title">
	<th>제목</th>
	<th colspan="3">${dto.btitle }</th>
</tr>

<tr class="content" >
		
		<td colspan="4">${dto.bcontent }<img class="dw" alt="zzzz" src="./img/dwpng.pn"></td>


</tr>


</table>
</div>
		
		
		
</body>
</html>