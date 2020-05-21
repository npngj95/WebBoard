<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<%@include file="../common/common_top.jsp"%>

<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
</head>
<body>
<div class="container wrapper">
<!-- Default form register -->
<form class="text-center border border-light p-5" action="#!">
	<p class="h2 mb-4"><a href="index">Board Main</a></p>
    <p class="h4 mb-4">회원 정보 수정</p>
	
	<!-- ID -->
    <input type="text" name="u_id" class="form-control mb-4" placeholder="ID" value="${user.u_id }userID" readonly>
    
    <!-- Name -->
    <input type="text" name="u_name" class="form-control mb-4" placeholder="Name" value="${user.u_name }userName">
 	
    <!-- E-mail -->
    <input type="email" name="u_email" class="form-control mb-4" placeholder="E-mail" value="${user.u_email }userEmail">

    <!-- Sign up button -->
    <button class="btn btn-info btn-block" type="submit">Sign Up</button>

</form>
<!-- Default form register -->
</div>

<%@include file="../common/common_bottom.jsp"%>
</body>
</html>