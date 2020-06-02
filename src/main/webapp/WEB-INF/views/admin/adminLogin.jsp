<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@include file="../common/common_top.jsp"%>

<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
</head>
<body>
<div class="container wrapper">
	<form class="text-center border border-light p-5" action="login" method="post">
	    <p class="h2 mb-4">관리자 로그인</p>
		
	    <!-- Email -->
	    <input type="text" name="a_id" class="form-control mb-4" placeholder="ID">
	
	    <!-- Password -->
	    <input type="password" name="a_pwd" class="form-control mb-4" placeholder="Password">
		
		<p class="text-danger" style="font-size: 13px">${alert }</p>
	
	    <!-- Sign in button -->
	    <button class="btn btn-info btn-block my-4" type="submit">Sign in</button>
	
	</form>
</div>

<%@include file="../common/common_bottom.jsp"%>
</body>
</html>