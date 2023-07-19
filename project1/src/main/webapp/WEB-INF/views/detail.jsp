<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/detail.css">
<script type="text/javascript">
	function del(){
		let chk = confirm("삭제하시겠습니까?") //참 거짓으로 나옵니다.
		//alert(chk);
		if(chk){
			location.href="./delete?bno=${dto.bno}";
			
		}
	}

</script>
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
		<td colspan="3" class="edde1"><img src="./img/edit.png" alt="edit"> </td>
		<td colspan="3" class="edde2"><img src="./img/delete.png" alt="delete" onclick="del()"></td>
</tr>


</table>
</div>
		
		
		
</body>
</html>