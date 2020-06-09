<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용 조회</title>
<%@include file="../common/common_top.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet"> 
<link href="${pageContext.request.contextPath }/resources/summerNote/summernote-bs4.min.css" rel="stylesheet">
</head>
<body>
<%@include file="../module/top.jsp"%>
<div class="container wrapper">

	<!-- modal-delete-board  -->
	<div class="modal" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 id="modal-title" class="modal-title">게시글 삭제</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div id="modal-body-text" class="modal-body">
					해당 게시글을 삭제 하시겠습니까?
				</div>	
				<div class="modal-footer">
					<button type="button" id="modal-btn" class="btn btn-danger" onclick="location='deleteBoard?b_num=${board.b_num}'">확인</button>
					<button type="button" class="btn btn-dark" data-dismiss="modal" onclick="closeModal(1)">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- modal-delete-reply  -->
	<div class="modal" id="myModal1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 id="modal1-title" class="modal-title">댓글 삭제</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div id="modal1-body-text" class="modal-body">
					해당 댓글을 삭제하시겠습니까?
				</div>	
				<div class="modal-footer">
					<button type="button" id="modal1-btn" class="btn btn-danger" onclick="">확인</button>
					<button type="button" class="btn btn-dark" data-dismiss="modal" onclick="closeModal(1)">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- modal-like-log  -->
	<div class="modal" id="myModal2">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 id="modal2_title" class="modal-title">게시글 평가</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p id="modal2-body-text">게시글 평가는 1회만 가능합니다.</p>
					<button type="button" id="modal2-btn" style="float: right" class="btn btn-primary" onclick="closeModal(2)">확인</button>
				</div>	
			</div>
		</div>
	</div>


	<!-- board영역 -->
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
	    <div class="text-left mb-3">
			<textarea id="b_content" class="form-control rounded-0" readonly>${board.b_content }</textarea>
	    </div>
	    <!-- 수정 / 삭제 버튼 -->
		    <div class="text-right mb-3">
				<button type="button" style="float: left;" class="btn btn-dark mb-3" onclick="location='../index${url }'">게시글 목록</button>
				 <c:if test="${board.b_writer == user.u_id}">
					<button type="button" class="btn btn-dark mb-3" onclick="location='updateBoard?b_num=${board.b_num }'">글수정</button>
					<button type="button" class="btn btn-dark mb-3" data-toggle="modal" data-target="#myModal">글삭제</button>
				</c:if>
			</div>
		
	</div>

	<!--  좋아요 / 싫어요 버튼 -->
	<div id="like-log" class="text-center mb-5" style="clear:both;">
		<div id="like-hate-btn">
			<!-- Thumbs up -->
		     <button type="button" class="btn btn-primary px-4" onclick="updateLike(${board.b_num}, '${user.u_id}')">
		     	<i class="far fa-thumbs-up mr-2" aria-hidden="true"></i> <span id="like">${board.b_like }</span>
		     </button>
		     <button type="button" class="btn btn-danger px-4" onclick="updateHate(${board.b_num}, '${user.u_id}')">
		     	<i class="far fa-thumbs-down mr-2" aria-hidden="true"></i> <span id="hate">${board.b_hate }</span>
		     </button>
	     </div>
	</div>
    
	<!-- Reply 영역  -->
	<div class="text-center border border-light p-5" >
		<input type="hidden" value="${Board.b_num}"/>
	    <div class="text-left mb-3"><i class="fas fa-comment mr-2"></i>전체 댓글 <span id="replyCnt">0</span>개</div>
		
		<table class="table">
			<tbody id="replyList">
			
			</tbody>
		  	<tfoot>
			    <tr>
			   	  <th width="15%" class="pt-4 font-weight-bold">${user.u_id }</th> 	  
			   	  <td  colspan="2">
			   	  	<input type="text" id="r_content" class="form-control" placeholder="ReplyContent" onfocus="writeReplyLogin('${user.u_id }')" >
			   	  </td>
			   	  <td width="5%">
			   	  	<button style="width: 100px; padding:5px;" class="btn btn-dark mb-3" type="button" onclick="writeReply(${board.b_num}, '${user.u_id }')">댓글 입력</button>
			   	  </td>
			    </tr>
			</tfoot>
		</table>
	</div>
</div>
<%@include file="../module/bottom.jsp"%>
<%@include file="../common/common_bottom.jsp"%>
<script src="${pageContext.request.contextPath }/resources/summerNote/summernote-bs4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/readBoard.js"></script>
<script>var u_id = '${user.u_id}', b_num = '${board.b_num}';</script>
</body>
</html>