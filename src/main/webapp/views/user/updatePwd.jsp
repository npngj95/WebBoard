<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
<%@include file="/views/common/common_top.jsp" %>

<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
</head>
<body>
<div class="container wrapper">
<!-- Default form register -->
<form class="text-center border border-light p-5" action="#!">
	<p class="h2 mb-4"><a href="../index.jsp">Board Main</a></p>
    <p class="h4 mb-4">비밀번호 변경</p>
    <!-- Password -->
    <input type="password" name="old_pwd" class="form-control mb-4" placeholder="Old Password">
   
	<!-- Password -->
    <input type="password" name="new_pwd" class="form-control mb-4" placeholder="New Password">
   
	 <!-- Password check -->
    <input type="password" name="new_pwd2" class="form-control mb-4" placeholder="Password Check">
    
    <!-- Password in button -->
    <button class="btn btn-info btn-block my-4" type="button" onclick="updatePwd()">비밀번호 변경</button>
</form>

<%@include file="/views/common/common_bottom.jsp" %>
</div>
</body>
</html>