<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<%@include file="/views/common/common_top.jsp" %>

<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
</head>
<body>
<div class="container wrapper">
<!-- Default form register -->
<form class="text-center border border-light p-5" action="#!">
	<p class="h2 mb-4"><a href="../index.jsp">Board Main</a></p>
    <p class="h4 mb-4">회원 정보 수정</p>
	
	<!-- ID -->
    <input type="text" id="defaultRegisterFormEmail" class="form-control mb-4" placeholder="ID" readonly>
    
    <!-- Name -->
    <input type="text" id="defaultRegisterFormEmail" class="form-control mb-4" placeholder="Name">
 	
    <!-- E-mail -->
    <input type="email" id="defaultRegisterFormEmail" class="form-control mb-4" placeholder="E-mail">

    <!-- Phone number -->
    <input type="text" id="defaultRegisterPhonePassword" class="form-control mb-5" placeholder="Phone number" aria-describedby="defaultRegisterFormPhoneHelpBlock">

    <!-- Sign up button -->
    <button class="btn btn-info btn-block" type="submit">Sign Up</button>

</form>
<!-- Default form register -->
</div>

<%@include file="/views/common/common_bottom.jsp" %>
</body>
</html>