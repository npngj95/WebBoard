<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Read</title>
<%@include file="../common/common_top.jsp"%>

<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/summerNote/summernote-bs4.min.css" rel="stylesheet">
</head>
<body>
<%@include file="../module/top.jsp"%>
<div class="container wrapper">
<!-- Default form contact -->
	<p class="h2 mb-4 text-center"><a href="managementNotice">공지글 관리</a></p>
	
<form class="text-center border border-light p-5" action="updateNotice" method="post" onsubmit="return empCheck()">
	<input type="hidden" name="b_num" value="${notice.b_num }">
	<input type="hidden" name="b_category" value="${notice.b_category }">
	
	<p class="h4 mb-5 text-center">공지 사항 수정</p>

    <!-- Name -->
    <div class="text-left mb-4"><i class="fas fa-user prefix"></i> 관리자</div>
	
	<hr>
    <!-- Category -->
    <div class="text-left mb-4"><i class="fas fa-clone"></i> 공지</div>
    
	<!-- Title -->
    <div style="text-align: left;">
	    <input type="text" name="b_title" class="form-control mb-4" placeholder="Title" style="margin-right: 5%; display: inline-block;" value="${notice.b_title }">
    </div>
    
    <!-- Content -->
    <div class="form-group mb-5 text-left">
        <textarea id="b_content" name="b_content" class="form-control rounded-0" rows="10" placeholder="Content">${notice.b_content }</textarea>
    </div>
	
	<hr>
	
	<!-- Back button -->
	<div style="row"><button type="submit" class="btn btn-primary w-100">수정</button></div>
    
    
</form>
<!-- Default form contact -->
</div>
<%@include file="../module/bottom.jsp"%>
<%@include file="../common/common_bottom.jsp"%>
<script src="${pageContext.request.contextPath }/resources/summerNote/summernote-bs4.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/updateNotice.js"></script>
</body>
</html>