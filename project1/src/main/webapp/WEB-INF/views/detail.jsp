<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/detail.css?ver=0.2">
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

      
      //댓글 삭제 버튼 만들기 = 반드시 로그인 하고, 자신의 글인지 확인하는 검사 구문 필요
      function cdel(cno){
         if(confirm("댓글을 삭제하시겠습니까?")){
            location.href = "./cdel?bno=${dto.bno}&cno="+cno;
         }
      }
   $(function(){
      $(".commentBox").hide();
      $("#openComment").click(function(){
         $(".commentBox").show('slow');
         $("#openComment").remove();
      });
      //댓글 삭제 다른 방법
   $(".cdel").click(function(){
      if(confirm("댓글을 삭제하시겠습니까?")){
      let cno = $(this).parent().siblings(".cid").text();
      
      let cno_comments = $(this).parents(".comments"); //변수처리
      //location.href="./cdel?bno=${dto.bno}&cno="+cno;
      
      
      $.ajax({
    	url : "./cdelR",
      	type : "post",
    	data : {bno : ${dto.bno}, cno : cno},
    	dataType : "json",
    	  success : function(data){
    		  //alert(data);    		
    		  if(data.result==1){
    			  //alert("통신이 되었습니다 결과값 : "+ data.result);
    			  //$(this).parent().parent().parent().remove();
    			  cno_comments.remove(); //변수에 담긴 html 삭제
    		  }else{
    			  alert("통신에 문제가 발생했습니다. 다시 시도해주세요.");
    		  }
    	  },
    	  error : function(error){
    		  alert("에러가 발생했습니다" + error);
    	  }
      });
      
      }
   });
   
      //댓글 수정 버튼 만들기 = 반드시 로그인 하고, 자신의 글인지 확인하는 검사 구문 필요.
      //.ceidt
      //변수만들기 bno, cno, content
      $(".cedit").click(function(){
    	  //alert("!");
    	  //const bno = "${dto.bno}";
    	  const cno = $(this).parent().siblings(".cid").text();
    	  //alert(cno);
    	  let content = $(this).parents(".cidd").siblings(".ccomment").text();
    	  alert(content)
    	  let recommentBox = '<div class="recommentBox">';
    	  recommentBox += '<form action = "./cedit" method = "post">';
    	  recommentBox += '<textarea id = "rcta" name = "recomment" placeholder="댓글을 입력하세요">'+content+'</textarea>';
    	  recommentBox += '<input type = "hidden" id="bno" name = "bno" value = "${dto.bno}">';
    	  recommentBox += '<input type = "hidden" id="cno" name = "cno" value = "'+cno+'">';
    	  recommentBox += '<button type="submit" id="recomment">댓글수정하기</button>';
    	 recommentBox += '</form>';
    	  recommentBox += '</div>';
    	  //내 위치 찾기
    	  let commentDIV = $(this).parents(".com");
    	  commentDIV.after(recommentBox);
    	  commentDIV.remove();
    	  //수정 삭제 댓글창 열기 모두 삭제하기
    	  $(".cedit").remove();
    	  $(".cdel").remove();
    	  $("#openComment").remove();
    	  
      });
      
      
      //댓글 쓰기 몇 글자 썼는지 확인하는 코드 2023-08-08 프레임워크 프로그래밍
   		//key up	텍스트입력창 : #commenttextarea" 버튼 : "#comment" 스팬 : id="commspan"
   		$("#commenttextarea").keyup(function(){
   			let text = $(this).val();
   			if(text.length > 100){
   			alert("100자 넘었어요"); 
   			$(this).val( text.substr(0,99) );
   			
   			
   			}
   			$("#commspan").text(text.length +"/100");
   			
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
<tr>
</table>


<div class="commentsList">
<c:choose>
   <c:when test="${fn:length(commentList) gt 0}"><tr><td colspan="6">댓글이 있어요@@@@@@@@@@</td></tr>
   <div class="comments">
      <c:forEach items="${commentList }" var="c">
      <div class="com">
       <div class="cidd">아디 : ${c.m_id }
          <c:if test="${sessionScope.mid ne null && sessionScope.mid eq c.m_id }">
          <img src="./img/delete.png" alt="cdelete" class="cdel" onclick="cdel1(${c.c_no })">
          <img src="./img/edit.png" alt="cedit" class="cedit" onclick="cedit()">
          </c:if>
       </div>
       <div class="cid">${c.c_no }</div>
       <div class="ccomment">${c.c_comment }</div>
       <div class="cname">닉 : ${c.m_name }</div>
       <div class="cdate">${c.c_date }</div>
       </div>
      </c:forEach>
   </div>

   </c:when>
   <c:otherwise><h2>댓글이 없어요</h2></c:otherwise>
</c:choose>

</div>   
<c:if test="${sessionScope.mid ne null }">
<td>
<button type="button" id="openComment">댓글창 열기</button>

      
      <div class="commentBox">
         <form action="./comment" method="post">
         <textarea id="commenttextarea" name="comment"></textarea>
         <button type="submit" id="comment">글쓰기</button>
         <span id="commspan"></span>
         <input type="hidden" name="bno" value="${dto.bno }">
         </form>
      </div>

</c:if>


</div>
      
</body>
</html>