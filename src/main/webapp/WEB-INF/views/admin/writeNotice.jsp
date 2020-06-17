<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Write</title>
<%@include file="../common/common_top.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/summerNote/summernote-bs4.min.css" rel="stylesheet">
</head>
<body>
<%@include file="../module/top.jsp"%>
<div class="container wrapper">
<!-- Default form contact -->
<p class="h2 mb-4 text-center"><a href="adminMain">Admin Main</a></p>
<form class="text-center border border-light p-5" action="writeNotice" method="post" onsubmit="return empCheck()">

    <p class="h4 mb-4">Notice Write</p>

    <!-- Name -->
    <input type="text" name="b_writer" class="form-control mb-4" value="관리자" readonly>
	
	<!-- Category -->
	<input class="form-control mb-4" type="text" value="공지" readonly>
    <input type="hidden" name="b_category" value="3">    

	<hr>
	
    <!-- Email -->
    <input type="text" id="b_email" name="b_email" class="form-control mb-4" placeholder="E-mail" value="${admin.a_id }@webboard.com" required>
	
	<!-- Title -->
    <input type="text" name="b_title" class="form-control mb-4" placeholder="Title" required>
    
    <!-- Content -->
    <div class="form-group text-left">
        <textarea id="b_content" name="b_content" class="form-control rounded-0 mb-4" rows="10" placeholder="Content"></textarea>
    </div>

	<hr>

	<!-- submit button -->
    <button class="btn btn-info btn-block" type="submit">submit</button>
</form>
<!-- Default form contact -->
</div>
<%@include file="../module/bottom.jsp"%>
<%@include file="../common/common_bottom.jsp"%>
<script src="${pageContext.request.contextPath }/resources/summerNote/summernote-bs4.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/writeNotice.js"></script>
</body>
</html>