<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<link rel="stylesheet" href="./css/menu.css">
		<nav>
			<ul>
				<li onclick="link('')"><img class="mmain" src="./img/homee.png" alt="메인"></li>
				<li onclick="link('board')"><img class="bboard" src="./img/board2.png" alt="게시판"></li>
				<li onclick="link('board2')"><img class="goon" src="./img/goon.png" alt="게시판2"></li>
				<li onclick="link('mooni')"><img class="happy" src="./img/happy.png" alt="문의사항"></li>
				<li onclick="link('notice')">공지</li>
				<li onclick="link('login')"><img class="happy" src="./img/login.png" alt="로그인"></li>
			</ul>
		</nav>
		<div style="height: 50px; width: 100%;"></div>
		<script>
		function link(url){
			location.href="./"+url;
		}
		
		</script>
