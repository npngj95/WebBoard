<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용 조회</title>

<script>
	function deleteBoard(b_num) {
		var deleteCheck = confirm("글을 삭제하면 다시 복구할 수 없습니다.\r\n정말 게시글을 삭제할까요?");
		
		if(deleteCheck) {
			location = "deleteBoard.do?b_num="+board.b_num;
		}
	}
</script>
<%@include file="../common/common_top.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet"> 
</head>
<body>
<%@include file="../module/top.jsp"%>

<div class="container wrapper">
	<div class="text-center">
	    <p class="h4 mb-4">Read Board</p>
	    <!-- Name -->
	    <div class="text-left mb-4" ><i class="fas fa-user prefix mr-2"></i>${board.b_writer }</div>
	
	    <!-- Email -->
	    <div class="text-left mb-4"><i class="fas fa-envelope prefix mr-2"></i>${board.b_email}</div>
	
		<!-- ReadCount -->
	    <div class="text-left mb-4"><i class="far fa-eye mr-2"></i>${board.b_readcount }</div>
	
	
		<hr>
	    <!-- Category -->
	    <div class="text-left mb-4"><i class="fas fa-clone mr-2"></i>
	    	<c:if test="${board.b_category == 1}">질문</c:if>
			<c:if test="${board.b_category == 2}">후기</c:if>
			<c:if test="${board.b_category == 3}">공지</c:if>
	    </div>
		
	    <div class="form-control mb-4 text-left" style="margin-right: 5%; display: inline-block;">${board.b_title }</div>
	    
	    <!-- Content -->
		<pre class="form-control rounded-0 mb-3 text-left" style="overflow: auto; white-space: pre-wrap; min-height:300px; height:100%;">${board.b_content }</pre>
	    
	    <!-- 수정 / 삭제 버튼 -->
	    <div class="text-right mb-3 ">
			<button type="button" style="float: left;" class="btn btn-dark mb-3" onclick="history.back()">게시글 목록</button>
			<button type="button" class="btn btn-dark mb-3" onclick="location='updateBoard?b_num=${board.b_num }'">글수정</button>
			<button type="button" class="btn btn-dark mb-3" onclick="deleteBoard(${board.b_num })">글삭제</button>
		</div>
	</div>

	<!--  좋아요 / 신고 버튼 -->
	<div class="text-center mb-5" style="clear:both;">
		<!-- Thumbs up -->
	     <button type="button" class="btn btn-primary px-4" onclick="recommend()">${board.b_recommend }<i class="far fa-thumbs-up ml-2" aria-hidden="true"></i></button>
	     <button type="button" class="btn btn-danger px-4" onclick="report()"><i class="fas fa-exclamation-triangle mr-2" aria-hidden="true"></i>${board.b_report }</button>
	</div>
    
	<!-- 댓글  -->
	<form class="text-center border border-light p-5" action="replyWrite" method="post">
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
		   	  <th class="pt-4"><b>${users.u_id }</b></th> 	  
		   	  <td colspan="2"><input type="text" name="r_content" class="form-control" placeholder="ReplyContent" required></td>
		   	  <td><button style="width: 100px; padding:5px;" class="btn btn-dark mb-3" type="submit">댓글 입력</button></td>
	    
		    </tr>
		  </tbody>
		</table>
	</form>
</div>
<%@include file="../module/bottom.jsp"%>
<%@include file="../common/common_bottom.jsp"%>
</body>
</html>