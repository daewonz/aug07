<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보드</title>
<link rel="stylesheet" href="./css/board.css">
<script type="text/javascript">
	
</script>
<script type="text/javascript">
	function linkPage(pageNo){
		location.href = "./board?pageNo="+pageNo;
	}	
</script>
</head>
<body>
	<%@include file="menu.jsp"%>
	<h1>보드</h1>
	<img alt="zz" src="./img/maza.png"> 길이 검사 : ${fn:length(list) }
	<c:choose>
		<c:when test="${fn:length(list) gt 0}">
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="${list }" var="row">
					<!--onclick 자바스크립트 페이지 이동, URL?파라미터=값  -->
					<tr onclick="location.href='./detail?bno=${row.bno }'">
						<td class="td1">${row.bno }</td>
						<td class="title">${row.btitle }</td>
						<td class="td1">${row.m_name }</td>
						<td class="td1">${row.bdate }</td>
						<td class="td1">${row.blike }</td>
					</tr>

				</c:forEach>

			</table>
			<div class="page">
			<ui:pagination paginationInfo = "${paginationInfo}"	type="image" jsFunction="linkPage"/>
			</div>

		</c:when>
		<c:otherwise>
			<div class="nodata">
				<h1>출력할 데이터가 없습니다.</h1>
			</div>
		</c:otherwise>
	</c:choose>

	로그인한 이름 : ${sessionScope.mname }/ ${sessionScope.mid }
	<c:if test="${sessionScope.mname ne null}">
		<button onclick="location.href='./write'">글쓰기</button>
	</c:if>
</body>
</html>