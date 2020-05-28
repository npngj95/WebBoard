<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
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
	
	<!-- modal-like-log  -->
	<div class="modal" id="myModal2">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">게시글 평가</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p id="modal-body-text">게시글 평가는 1회만 가능합니다.</p>
					<button type="button" id="modal-btn" style="float: right" class="btn btn-primary" onclick="closeModal()">확인</button>
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
	<div id="like-log" class="text-center mb-5" style="clear:both;">
		<div id="like-hate-btn">
			<!-- Thumbs up -->
		     <button type="button" class="btn btn-primary px-4" onclick="updateLike(${board.b_num}, '${users.u_id}')">
		     	<i class="far fa-thumbs-up mr-2" aria-hidden="true"></i> <span id="like">${board.b_like }</span>
		     </button>
		     <button type="button" class="btn btn-danger px-4" onclick="updateHate(${board.b_num}, '${users.u_id}')">
		     	<i class="far fa-thumbs-down mr-2" aria-hidden="true"></i> <span id="hate">${board.b_hate }</span>
		     </button>
	     </div>
	</div>
    
	<!-- 댓글  -->
	<div class="text-center border border-light p-5" >
		<input type="hidden" value="${Board.b_num}"/>
	    <div class="text-left mb-3"><i class="fas fa-comment mr-2"></i>전체 댓글 <span id="replyCnt">0</span>개</div>
		
		<table class="table">
			<tbody id="replyList">
			
			</tbody>
		  	<tfoot>
			    <tr>
			   	  <th class="pt-4 font-weight-bold">${users.u_id }</th> 	  
			   	  <td colspan="2"><input type="text" id="r_content" class="form-control" placeholder="ReplyContent" required></td>
			   	  <td><button style="width: 100px; padding:5px;" class="btn btn-dark mb-3" type="button" onclick="writeReply(${board.b_num}, '${users.u_id }')">댓글 입력</button></td>
			    </tr>
			</tfoot>
		</table>
	</div>
</div>
<%@include file="../module/bottom.jsp"%>
<%@include file="../common/common_bottom.jsp"%>

<script>
	$(document).ready(
		function(){
	    	selectReply();
		}
	);
	
	function frame(r_writer, r_content, r_regdate, r_num) {
		var html = "";
		html += "<tr>";
		html += "<th width='15%' scope='row'><b>" + r_writer + "</b></th>";
		html += "<td width='*' class='text-left'>" + r_content + "</td>";
		html += "<td width='10%'>" + r_regdate + "</td>";
		html += "<td width='5%'><i class='far fa-trash-alt' onclick='deleteReply(" + r_num + ")' style='cursor: pointer;'></i></td>";
		html += "</tr>";
		
		return html;
	}

	function selectReply() {
		b_num = "${board.b_num}";
		
		$.ajax({
			type : 'POST',
			url : "selectReply",
			data : {
				"b_num": b_num
			},
			
			success : function(data) {
				console.log(data);
				var html = "";
				
	            if(data.length > 0){
	                
	                for(i=0; i<data.length; i++){
	                	reply = data[i];
	                	var regdate = new Date();
	                	
	                	html += frame(reply.r_writer, reply.r_content, regdate.toLocaleDateString(), reply.r_num);
	                }
	            }
	            
	            $("#replyCnt").text(data.length);
	            $("#replyList").html(html);
	            
	        }
			
		});
		
	}

	function insertReply(b_num, u_id) {
		r_content = $("#r_content").val()
		
		$.ajax({
			type : 'POST',
			url : "insertReply",
			data : {
				"r_writer": u_id,
				"r_content" : r_content,
				"b_num": b_num
			},
			
			success : function(result) {
				// getComsdp // 메소드 호출해서 다시 리로딩 하는것 처럼
				console.log(result);
			}
		});
	}

	function deleteReply(b_num) {
		r_content = $("#r_content").val()
		
		$.ajax({
			type : 'POST',
			url : "deleteReply",
			data : {
				"r_writer": u_id,
				"r_content" : r_content,
				"b_num": b_num
			},
			
			success : function(result) {
				// getComsdp // 메소드 호출해서 다시 리로딩 하는것 처럼
				console.log(result);
			}
		});
	}

	function updateLike(b_num, u_id) {
		now_like = $("#like").text();
		
		if(!u_id) {
			$("#modal-body-text").text("먼저 로그인 해야 합니다.");
			$("#modal-btn").attr("onclick", "location='../login'")
			openModal();
			return;
		}
	
		$.ajax({
			type : 'POST',
			url : "updateLike",
			data : {
				"b_num": b_num
			},
			
			success : function(result) {
				// ajax처리 이후, html Body의 일부분 (div영역)만 리로딩 하기 위해 .load()함수를 사용
				//$("#like-log").load(window.location.href + " #like-hate-btn");
				// == $("#like-log").load(document.URL + " #like-hate-btn")
				if(now_like == result){
					openModal();
				}
				$("#like").text(result);
			}
		});
		
	}

	function updateHate(b_num, u_id) {
		now_hate = $("#hate").text();
		
		if(!u_id) {
			$("#modal-body-text").text("먼저 로그인 해야 합니다.");
			$("#modal-btn").attr("onclick", "location='../login'")
			openModal();
			return;
		}
	
		$.ajax({
			type : 'POST',
			url : "updateHate",
			data : {
				"b_num": b_num
			},
			
			success : function(result) {
				if(now_hate == result){
					openModal();
				} 
				$("#hate").text(result);
			}
		});
		
	}
	
	function openModal() {
		$("#myModal2").modal("show");
	}
	function closeModal() {
		$("#myModal2").modal("hide");
	}
</script>
</body>
</html>