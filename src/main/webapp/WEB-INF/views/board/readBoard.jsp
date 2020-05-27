<%@page import="com.koreait.webboard.vo.BoardVO"%>
<%@page import="com.koreait.webboard.vo.UsersVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용 조회</title>
<%@include file="../common/common_top.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet"> 
</head>
<body>
<%@include file="../module/top.jsp"%>

<div class="container wrapper">
	<!-- modal-check-pwd  -->
	<div class="modal" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">게시글 삭제</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					해당 게시글을 삭제 하시겠습니까?
				</div>	
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" onclick="location='deleteBoard?b_num=${board.b_num}'">확인</button>
					<button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

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
		    <div class="text-right mb-3">
				<button type="button" style="float: left;" class="btn btn-dark mb-3" onclick="location='../index'">게시글 목록</button>
				 <c:if test="${board.b_writer == users.u_id}">
					<button type="button" class="btn btn-dark mb-3" onclick="location='updateBoard?b_num=${board.b_num }'">글수정</button>
					<button type="button" class="btn btn-dark mb-3" data-toggle="modal" data-target="#myModal">글삭제</button>
				</c:if>
			</div>
		
	</div>

	<!--  좋아요 / 싫어요 버튼 -->
	<div id="like_log" class="text-center mb-5" style="clear:both;">
		<!-- Thumbs up -->
	     <button type="button" class="btn btn-primary px-4" onclick="updateLike(${board.b_num}, ${board.b_like })">
	     	<i class="far fa-thumbs-up mr-2" aria-hidden="true"></i> <span id="like">${board.b_like }</span>
	     </button>
	     <button type="button" class="btn btn-danger px-4" onclick="updateHate(${board.b_num}, ${board.b_hate })">
	     	<i class="far fa-thumbs-down mr-2" aria-hidden="true"></i> <span id="hate">${board.b_hate }</span>
	     </button>
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
<script>
function updateLike(b_num, now_like) {
	$.ajax({
		type : 'POST',
		url : "updateLike",
		data : {
			"b_num": b_num
		},
		
		success : function(result) {
			// ajax처리 이후, html Body의 일부분 (div영역)만 리로딩 하기 위해 .load()함수를 사용
			$("#like_log").load(window.location.href + " #like_log");
			// == $("#like_log").load(document.URL + " #like_log")
			if(now_like == result){
				alert("게시글 평가는 1회만 가능합니다.");
			}
			$("#like").text(result);
		}
	});
	
}

function updateHate(b_num, now_hate) {
	$.ajax({
		type : 'POST',
		url : "updateHate",
		data : {
			"b_num": b_num
		},
		
		success : function(result) {
			if(now_hate == result){
				alert("게시글 평가는 1회만 가능합니다.");
			}
			$("#thumbs_up").text(result);
		}
	});
	
}

</script>
</body>
</html>