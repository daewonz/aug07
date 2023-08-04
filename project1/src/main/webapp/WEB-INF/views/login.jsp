<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지 입니다.</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script type="text/javascript">



//alert(a);




let a = 100;
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
	if(id.value.length < 0){
		alert("아이디는0글자 이상이여야 합니다.");
		msg.innerHTML = text;
		
		id.focus();
		return false;
	}
	if(pw.value.length < 0){
		alert("암호는 0글자 이상이여야 합니다.");
		pw.focus();
		return false;
	}

}

$(function(){
	   $(".login").click(function(){
	   let id = $("#id").val();
	   let pw = $("#pw").val();
	   if(id.length < 0){
	   alert("아이디를 입력하세요.");
	   $("#id").focus();
	   }else{
	      if (pw.length < 0) {
	   alert("암호를 입력하세요.")
	    $("#pw").focus();
	}else{
	   //아이디하고 암호가 정확하게 입력되었습니다.
	   let form = $("<form/>");
	   form.attr("method", "post");
	   form.attr("action", "./login");
	   form.append($("<input/>",{type:"hidden", name:"id",value: id}));
	   form.append($("<input/>",{type:"hidden", name:"pw",value: pw}));
	   form.appendTo("body");
	   form.submit();
	   }
	}
	});
	});
</script>
</head>
<body>
<%@include file="menu.jsp" %>
	<h1>로그인</h1>
	<form action="./login" method="post" onsubmit="return check()"></form>
	<input type="text" name="id" id="id" placeholder="아이디를 입력하세요" onchange="checkID()"><br>
	<input type="password" name="pw" id="pw" placeholder="패스워드를 입력하세요" ><br>
	<button type="submit" class="login">로그인하기</button>
	<span id="msg"></span>

	<a>아이디 찾기 | </a>
	<a>비밀번호 찾기 | </a>
	<a href="./join">회원가입</a>
</body>
</html>