<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글 작성</title>
<%@include file="../common/common_top.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/summerNote/summernote-bs4.min.css" rel="stylesheet">
</head>
<body>
<%@include file="../module/top.jsp"%>
<div class="container wrapper">
	<form class="text-center border border-light p-5" action="writeBoard" method="post" onsubmit="return empCheck()">
	
	    <p class="h4 mb-4">Write Board</p>
	
	    <!-- Name -->
	    <input type="text" name="b_writer" class="form-control mb-4" placeholder="Writer" value="${user.u_id }" readonly>
	
	    <!-- Email -->
	    <input type="email" name="b_email" class="form-control mb-4" placeholder="E-mail" value="${user.u_email }" readonly>
		
		<hr>
	    <!-- Category -->
	    <select name="b_category" class="browser-default custom-select mb-4" required>
	        <option selected hidden="true" value="">Category</option>
	        <option value="1">질문</option>
	        <option value="2">후기</option>
	    </select>
		
		<!-- Title -->
	    <input type="text" name="b_title" class="form-control mb-4" placeholder="Title" required>
	    
	    <!-- Content -->
	    <div class="form-group text-left">
	        <textarea id="b_content" name="b_content" class="w-100 form-control rounded-0" placeholder="Content"></textarea>
	    </div>
		
		<div class="container text-right">
			<button type="submit" style="width: 100px; height:40px; padding:5px;" class="btn btn-dark mb-3">글쓰기</button>
			<button type="button" style="width: 100px; height:40px; padding:5px;" class="btn btn-dark mb-3" onclick="location='../index'">취소</button>
		</div>
	</form>
</div>
<%@include file="../module/bottom.jsp"%>
<%@include file="../common/common_bottom.jsp"%>


<script src="${pageContext.request.contextPath }/resources/summerNote/summernote-bs4.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/writeBoard.js"></script>
</body>
</html>