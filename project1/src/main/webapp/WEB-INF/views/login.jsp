<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지 입니다.</title>
<script type="text/javascript">

alert(a);




var a = 100;
	let text = "<p>올바른 아이디를 입력하세요</p>";//전역변수
	//호이스팅이 뭐에요?
	//let vs var ?
	
//스크립트 영역
function checkID(){
	//alert("!");
	msg.innerHTML = "<p>" + document.getElementById("id").value+"아이디를 변경했습니다.</p>"	
}


function check(){
	//alert("!")
	let msg = document.getElementById("msg");
	let id = document.getElementById("id");
	let pw = document.getElementById("pw");
	
	//alert(id.value);
	//alert(id.value.length);
	if(id.value.length < 4){
		alert("아이디는 4글자 이상이여야 합니다.");
		msg.innerHTML = text;
		
		id.focus();
		return false;
	}
	if(pw.value.length < 3){
		alert("암호는 3글자 이상이여야 합니다.");
		pw.focus();
		return false;
	}

}
</script>
</head>
<body>
<%@include file="menu.jsp" %>
	<h1>로그인</h1>
	<form action="./login" method="post" onsubmit="return check()">
	<input type="text" name="id" id="id" placeholder="아이디를 입력하세요" onchange="checkID()"><br>
	<input type="password" name="pw" id="pw" placeholder="패스워드를 입력하세요" ><br>
	<button type="submit" class="login">로그인하기</button>
	<span id="msg"></span>
	</form>
</body>
</html>