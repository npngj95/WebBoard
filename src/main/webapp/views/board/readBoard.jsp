<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용 조회</title>
<script>
	function deleteBoard(b_num) {
		var deleteCheck = confirm("글을 삭제하면 다시 복구할 수 없습니다.\r\n정말 게시글을 삭제할까요?");
		
		if(deleteCheck) {
			location = "deleteBoard.do?b_num="+b_num;
		}
	}
</script>
<%@include file="/views/common/common_top.jsp" %>
<%@include file="/views/module/top.jsp" %>
<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet"> 
</head>
<body>
<div class="container wrapper">

<div class="text-center">
    <p class="h4 mb-4">Read Board</p>
    <!-- Name -->
    <div class="text-left mb-4" ><i class="fas fa-user prefix"></i>${board.b_writer } 작성자 이름</div>

    <!-- Email -->
    <div class="text-left mb-4"><i class="fas fa-envelope prefix"></i>${board.b_email} 작성자 이메일</div>

	<!-- ReadCount -->
    <div class="text-left mb-4"><i class="far fa-eye"></i>${board.b_readcount } 15 (조회수)</div>


	<hr>
    <!-- Category -->
    <div class="text-left mb-4"><i class="fas fa-clone"></i>${board.b_category } 카테고리</div>
	
    <div class="form-control mb-4 text-left" style="margin-right: 5%; display: inline-block;">${board.b_title } 제목</div>
    
    <!-- Content -->
	<pre class="form-control rounded-0 mb-3 text-left" style="overflow: auto; white-space: pre-wrap; min-height:300px; height:100%;">
	${board.b_content }
	
Lorem Ipsum is simply dummy text of the printing and typesetting industry.
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
when an unknown printer took a galley of type and scrambled it to make a type specimen book.
It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
Lorem Ipsum is simply dummy text of the printing and typesetting industry.
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
when an unknown printer took a galley of type and scrambled it to make a type specimen book.
It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
Lorem Ipsum is simply dummy text of the printing and typesetting industry.
Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, 
when an unknown printer took a galley of type and scrambled it to make a type specimen book.
It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.
	</pre>
    
    <!-- 수정 / 삭제 버튼 -->
    <div class="container text-right mb-3">
		<button type="button" style="width: 100px; height:40px; padding:5px; float: left;" class="btn btn-dark mb-3" onclick="history.back()">게시글 목록</button>
		<button type="button" style="width: 100px; height:40px; padding:5px;" class="btn btn-dark mb-3" onclick="location='updateBoard.do?b_num=${board.b_bum }'">글수정</button>
		<button type="button" style="width: 100px; height:40px; padding:5px;" class="btn btn-dark mb-3" onclick="deleteBoard(${board.b_num })">글삭제</button>
	</div>
</div>

<!--  좋아요 / 신고 버튼 -->
<div class="text-center mb-5" style="clear:both;">
	<!-- Thumbs up -->
     <button type="button" class="btn btn-primary px-4" onclick="recommend()">${board.b_like }5<i class="far fa-thumbs-up ml-2" aria-hidden="true"></i></button>
     <button type="button" class="btn btn-danger px-4" onclick="report()"><i class="fas fa-exclamation-triangle mr-2" aria-hidden="true"></i>${board.b_report }2</button>
</div>
    
<!-- 댓글  -->
<form class="text-center border border-light p-5" action="replyWrite.do" method="post">
	<input type="hidden" value="${Board.b_num}"/>
    <div class="text-left mb-3"><i class="fas fa-comment mr-2"></i>전체 댓글</div>
	<table class="table">
	  <tbody>
	    <tr>
	      <th width="15%" scope="row"><b>더미작성자 1</b></th>
	      <td width="*" class="text-left">더미 댓글 내용 1</td>
	      <td width="10%">20-05-10</td>
	      <td width="5%"><i class="far fa-trash-alt"></i></td>
	    </tr>
	    <tr>
	      <th scope="row"><b>더미작성자 2</b></th>
	      <td class="text-left">더미 댓글 내용 2</td>
	      <td>20-05-12</td>
	      <td><i class="far fa-trash-alt"></i></td>
	    </tr>
	    <tr>
	      <th scope="row"><b>${reply.r_writer }</b></th>
	      <td class="text-left">${reply.r_content }</td>
	      <td>${reply.r_regdate }</td>
	      <td><i class="far fa-trash-alt" onclick="deleteReply()" style="cursor: pointer;"></i></td>
		<!-- Ajax 처리로 댓글삭제 (onclick에 deleteReply함수를 만들어서, Ajax post방식으로 넘기기)-->
	    </tr>
	    <tr>
<%-- 	   	  <th><b>${user.u_id }</b></th> --%>
	   	  <th class="pt-4"><b>더미 아이디</b></th>
	   	  <td colspan="2"><input type="text" name="r_content" class="form-control" placeholder="ReplyContent" required></td>
	   	  <td><button style="width: 100px; padding:5px;" class="btn btn-dark mb-3" type="submit">댓글 입력</button></td>
    
	    </tr>
	  </tbody>
	</table>
	
</form>
</div>
<%@include file="/views/module/bottom.jsp" %>
<%@include file="/views/common/common_bottom.jsp" %>
</body>
</html>