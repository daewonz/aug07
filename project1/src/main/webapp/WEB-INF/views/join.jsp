<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<div align="center">
<h1 >★★회원가입★★</h1>
</div>


<script src="./js/jquery-3.7.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#idCheck").click(function(){
		let id = $("#id").val();
		//console.log(id);
		//console.log(id.length);
		if(id=="" || id.length < 5){
			$("#resultMSG").text("아이디는 다섯글자 이상이어야 합니다.");
			$("#resultMSG").css("color","red").css("font-weight","bold").css("font-size","15pt");
		}else{
			$.ajax({//ajax 시작
				url: "./checkID",
				type: "post",
				data: {"id" : id},
				dataType: "json",	//{result:0}	//서버가 보내주는게 json형태로 옵니다.
				success: function(data){
					alert(data.result);
					if(data.result==1){//1은 등록되어있는 아이디. 즉 COUNT(*) 에서 값이 나온 아이디.
						$("#id").css("background-color","yellow").focus();
						$("#resultMSG").css("color","red").text("이미 등록된 아이디입니다.");
						
					}else {
						$("#id").css("background-color","green");
						$("#resultMSG").css("color","green");
						$("#resultMSG").text("가입할 수 있습니다.");
						
					}
					
					//	$("#resultMSG").text("성공시 결과값 : "+ data);
					
				},
				error : function(request, status, error){
					$("#resultMSG").text("오류가 발생했습니다. 가입할 수 없습니다.")
				}
			});//ajax 끝
			
		}
		
		
		
		return false;
	});
});


</script>
</head>
<br>
<br>
<div class="join" align="center">
<form action="./join" method="post">
	<div>아이디</div>
	<div>
		<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요">
		<button id="idCheck">중복검사</button>
		<br>
		<span id="resultMSG"></span>
		<br>
	</div>

	<div>비밀번호</div>
	<div>
		<input type="password" name="pw1" id="pw1" placeholder="비밀번호를 입력해주세요">
	</div>
	<div>비밀번호 확인</div>
	<div>
		<input type="password" name="pw2" id="pw2" placeholder="비밀번호를 다시 입력해주세요">
	</div>
	<div>이름</div>
	<div>
		<input type="text" name="name" id="name" placeholder="이름을 입력해주세요">
	</div>
	<div>주소</div>
	<div>
		<input type="text" name="addr" id="addr" placeholder="주소를 입력해주세요">
	</div>
	<div>MBTI 를 입력해주세요.</div>
	<div id="mbti">
		<select name="mbti">
			<option>선택하세요</option>
			<optgroup label="대문자 I">
			<option value="ISTJ">ISTJ</option>
			<option value="ISFJ">ISFJ</option>
			<option value="INFJ">INFJ</option>
			<option value="INTJ">INTJ</option>
			<option value="ISTP">ISTP</option>
			<option value="ISFP">ISFP</option>
			<option value="INFP">INFP</option>
			<option value="INTP">INTP</option>
			</optgroup>
			<optgroup label="대문자 E">
			<option value="ESTP">ESTP</option>
			<option value="ESFP">ESFP</option>
			<option value="ENFP">ENFP</option>
			<option value="ENTP">ENTP</option>
			<option value="ESTJ">ESTJ</option>
			<option value="ESFJ">ESFJ</option>
			<option value="ENFJ">ENFJ</option>
			<option value="ENTJ">ENTJ</option>
			</optgroup>
		</select>
	</div>
	<div>생년월일</div>
	<div>
		<input type="date" name="birth" id="birth">
	</div>
	<div>
	<input type="radio" name="gender"	id="gender" value="1">
	<label for="m">남자</label>
	<input type="radio" name="gender"	id="gender" value="0">
	<label for="f">여자</label>
	
	</div>
	
	<button type="submit">가입ㄱ</button>
	<button type="reset">취소</button>
</form>
</div>


</body>
</html>