<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Write</title>
<%@include file="/views/common/common_top.jsp" %>
<%@include file="/views/module/top.jsp" %>
<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet"> 
</head>
<body>
<div class="container wrapper">
<!-- Default form contact -->
<form class="text-center border border-light p-5" action="#!">

    <p class="h4 mb-4">Notice Write</p>

    <!-- Name -->
    <input type="text" id="defaultContactFormName" class="form-control mb-4" value="관리자" readonly>
	
	<!-- Category -->
    <input type="text" id="defaultContactFormName" class="form-control mb-4" value="공지" readonly>
    
	<hr>
	
	<!-- Title -->
    <input type="email" id="defaultContactFormEmail" class="form-control mb-4" placeholder="Title">
    
    <!-- Content -->
    <div class="form-group">
        <textarea class="form-control rounded-0 mb-4" id="exampleFormControlTextarea2" rows="10" placeholder="Content"></textarea>
    </div>

	<hr>

	<!-- submit button -->
    <button class="btn btn-info btn-block" type="submit">submit</button>
</form>
<!-- Default form contact -->
</div>
<%@include file="/views/module/bottom.jsp" %>
<%@include file="/views/common/common_bottom.jsp" %>
</body>
</html>