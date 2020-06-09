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
<div class="container wrapper text-center border border-light p-5">
<!-- Default form register -->

	<p class="h2 mb-4"><a href="${pageContext.request.contextPath }/index">Board Main</a></p>
    <p class="h4 mb-4">회원 정보 수정</p>
	<form action="updateUser" method="post" onsubmit="return updateUser()">
		<!-- ID -->
	    <input type="text" id="u_id" name="u_id" class="form-control mb-4" placeholder="ID" value="${user.u_id }" readonly>
	    
	    <!-- Name -->
	    <div class="mb-4">
		    <input type="text" id="u_name" name="u_name" class="form-control" placeholder="Name" value="${user.u_name }" onblur="nameCheck()">
		    <p id="alertName" class="text-danger text-left"></p>
	    </div>
	 	
	    <!-- E-mail -->
	    <div class="mb-4">
		    <input type="email" id="u_email" name="u_email" class="form-control" placeholder="E-mail" value="${user.u_email }" onblur="emailCheck()">
		    <p id="alertEmail" class="text-danger text-left"></p>
	    </div>
		
	    <!-- Sign up button -->
	    <button class="btn btn-info btn-block" type="submit">수정하기</button>
	
	</form>
<!-- Default form register -->
</div>

<%@include file="../common/common_bottom.jsp"%>
<script src="${pageContext.request.contextPath }/resources/js/updateUser.js"></script>
</body>
</html>