<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
<%@include file="../common/common_top.jsp"%>

<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
</head>
<body>
<div class="container wrapper text-center border border-light p-5">
<!-- Default form register -->
<form action="updatePwd" method="post" onsubmit="return updatePwd()">
	<p class="h2 mb-4"><a href="${pageContext.request.contextPath }/index">Board Main</a></p>
    <p class="h4 mb-4">비밀번호 변경</p>
   
	<!-- Password -->
	<div class="mb-4">
	    <input type="password" id="u_pwd" name="u_pwd" class="form-control" placeholder="New Password" onkeypress="capslock(event)" onblur="pwdCheck(); isSame()">
		<p id="alertPwd1" class="text-left text-danger"></p>
	</div>
	
	 <!-- Password check -->
	<div class="mb-4">
	    <input type="password" id="u_pwd2" name="u_pwd2" class="form-control" placeholder="Password Check" onblur="isSame()">
	    <p id="alertPwd2" class="text-left text-danger"></p>
    </div>
    
    <!-- Password in button -->
    <button class="btn btn-info btn-block my-4" type="submit">비밀번호 변경</button>
	
</form>
</div>
<%@include file="../common/common_bottom.jsp"%>
<script src="${pageContext.request.contextPath }/resources/js/updatePwd.js"></script>
</body>
</html>