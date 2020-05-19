<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Read</title>
<%@include file="/views/common/common_top.jsp" %>
<%@include file="/views/module/top.jsp" %>
<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet">
</head>
<body>
<div class="container wrapper">
<!-- Default form contact -->
	<p class="h2 mb-4 text-center"><a href="managementNotice.jsp">공지글 관리</a></p>
	
<form class="text-center border border-light p-5" action="updateBoard.do" method="post">
	<p class="h4 mb-5 text-center">공지 사항 수정</p>

    <!-- Name -->
    <div class="text-left mb-4"><i class="fas fa-user prefix"></i> 관리자</div>
	
	<hr>
    <!-- Category -->
    <div class="text-left mb-4"><i class="fas fa-clone"></i> 공지</div>
	
	<!-- Title -->
    <div style="text-align: left;">
	    <input type="text" name="b_title" class="form-control mb-4" placeholder="Title" style="margin-right: 5%; display: inline-block;">
    </div>
    
    <!-- Content -->
    <div class="form-group mb-5">
        <textarea name="b_content" class="form-control rounded-0" rows="10" placeholder="Content"></textarea>
    </div>
	
	<hr>
	
	<!-- Back button -->
	<div style="row">
		<button type="submit" class="btn btn-primary col-lg-8">수정</button>
		<button type="button" class="btn btn-danger col-lg-3">삭제</button>
	</div>
    
    
</form>
<!-- Default form contact -->
</div>
<%@include file="/views/module/bottom.jsp" %>
<%@include file="/views/common/common_bottom.jsp" %>
</body>
</html>