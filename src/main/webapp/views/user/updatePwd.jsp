<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    <input type="password" id="defaultRegisterFormPassword" class="form-control mb-4" placeholder="Before Password" aria-describedby="defaultRegisterFormPasswordHelpBlock">
   
	<!-- Password -->
    <input type="password" id="defaultRegisterFormPassword" class="form-control mb-4" placeholder="New Password" aria-describedby="defaultRegisterFormPasswordHelpBlock">
   
	 <!-- Password check -->
    <input type="password" id="defaultRegisterFormPassword" class="form-control mb-4" placeholder="Password Check" aria-describedby="defaultRegisterFormPasswordHelpBlock">
    
    <!-- Password in button -->
    <button class="btn btn-info btn-block my-4" type="submit">비밀번호 변경</button>
</form>

<%@include file="/views/common/common_bottom.jsp" %>
</div>
</body>
</html>