<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<h1>회원가입 화면입니다.</h1>



</head>

<form action="./join" method="post">
	<div>아이디</div>
	<div>
		<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요">
	</div>
	<div>비밀번호</div>
	<div>
		<input type="text" name="pw" id="pw" placeholder="비밀번호를 입력해주세요">
	</div>
	<div>비밀번호 확인</div>
	<div>
		<input type="text" name="pw2" id="pw2" placeholder="비밀번호를 다시 입력해주세요">
	</div>
	<div>이름</div>
	<div>
		<input type="text" name="name" id="name" placeholder="이름을 입력해주세요">
	</div>
	<div>주소</div>
	<div>
		<input type="text" name="addr" id="addr" placeholder="주소를 입력해주세요">
	</div>
	<div>mbti</div>
	<div id="mbti">
		<select>
			<option>ISTJ</option>
			<option>ISFJ</option>
			<option>INFJ</option>
			<option>INTJ</option>
			<option>ISTP</option>
			<option>ISFP</option>
			<option>INFP</option>
			<option>INTP</option>
			<option>ESTP</option>
			<option>ESFP</option>
			<option>ENFP</option>
			<option>ENTP</option>
			<option>ESTJ</option>
			<option>ESFJ</option>
			<option>ENFJ</option>
			<option>ENTJ</option>
		</select>
	</div>
	<div>생년월일</div>
	<div>
		<input type="dropdown" name="birth" id="birth"
			placeholder="생일을 입력해주세요">
	</div>
	<button>회원 가입 하기</button>
	<button>취소</button>
</form>


</body>
</html>