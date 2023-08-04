<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/detail.css">
<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
function edit(){
	if(confirm("수정하시겠습니까?")){
		location.href="./edit?bno=${dto.bno }";
	}
		
}

	function del(){
		let chk = confirm("삭제하시겠습니까?") //참 거짓으로 나옵니다.
		//alert(chk);
		if(chk){
			location.href="./delete?bno=${dto.bno}";
			
		}
	}
	$(function(){
		$(".commentBox").hide();
		$("#openComment").click(function(){
			$(".commentBox").show('slow');
			$("#openComment").remove();
		});
		
	});
</script>
</head>
<body>
<%@include file="menu.jsp" %>
<h1>상세보기</h1>
<div class="center">
<table class="tab" border="2">
<tr class="writer">
	<th >작성자</th>
	<th class="writer1">${dto.m_name } 님</th>
	<th class="date">날짜</th>
	<th>${dto.bdate }</th>
	<th class="ip">아이피</th>
	<th>${dto.bip }</th>
</tr>
<tr class="title">
	<th>제목</th>
	<th colspan="5">${dto.btitle }</th>
</tr>

<tr class="content" >
		
		<td colspan="6">${dto.bcontent }<img class="dw" alt="zzzz" src="./img/noterror.png"></td>
</tr>
<tr class="edde">
	<c:if test="${sessionScope.mid ne null && sessionScope.mid eq dto.m_id }">
		<td colspan="3" class="edde1"><img src="./img/edit.png" alt="edit" onclick="edit()"> </td>
	</c:if>
	<c:if test="${sessionScope.mid ne null && sessionScope.mid eq dto.m_id }">
		<td colspan="3" class="edde2"><img src="./img/delete.png" alt="delete" onclick="del()"></td>
	</c:if>
</tr>
<div class="commentsList">
<tr>
<c:choose>
	<c:when test="${fn:length(commentList) gt 0}"><tr><td colspan="6">댓글이 있어요@@@@@@@@@@</td></tr>
	<div class="comments">
		<c:forEach items="${commentList }" var="c">
		<tr>
		 <div class="cid"><td>아디 : ${c.m_id }</td></div>
		 <div class="cname"><td>닉 : ${c.m_name }</td></div>
		 <div class="ccomment"><td>${c.c_comment }</td></div>
		 <div class="cdate"><td>${c.c_date }</td></div>
		</tr>
		</c:forEach>
	</div>
	</c:when>
	<c:otherwise><h2>댓글이 없어요</h2></c:otherwise>
</c:choose>

</tr>
</div>	
<c:if test="${sessionScope.mid ne null }">
<tr>
<td>
<button type="button" id="openComment">댓글창 열기</button>
</td>
</tr>
		<tr>
		<td colspan="6">
		<div class="commentBox">
			<form action="./comment" method="post">
			<textarea id="commenttextarea" name="comment"></textarea>
			<button type="submit" id="comment">글쓰기</button>
			<input type="hidden" name="bno" value="${dto.bno }">
			</form>
		</div>
		</td>
		</tr>
</c:if>
</table>

</div>
		
</body>
</html>