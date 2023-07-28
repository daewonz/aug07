<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<div align="center">
<h1 >★★회원가입★★</h1>
</div>



</head>
<br>
<br>
<div class="join" align="center">
<form action="./join" method="post">
	<div>아이디</div>
	<div>
		<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요">
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