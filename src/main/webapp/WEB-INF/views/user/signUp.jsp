<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@include file="../common/common_top.jsp"%>

<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
</head>
<body>
<div class="container wrapper">
	<form class="text-center border border-light p-5" action="signUp" method="post" onsubmit="return signUp()">
		<p class="h2 mb-4"><a href="index">Board Main</a></p>
	    <p class="h4 mb-4">회원가입</p>
		
		<!-- ID -->
		<div class="mb-4">
	    	<input type="text" id="u_id" name="u_id" class="form-control" placeholder="ID" onblur="idCheck()" size="20" required>
	    	<p id="alertId" class="m-0 ml-2 text-left" style="font-size: 13px;"></p>
	    </div>
	    
	    <!-- Name -->
	    <div class="mb-4">
	    	<input type="text" name="u_name" id="u_name" class="form-control" placeholder="Name" onblur="nameCheck()" required>
	    	<p id="alertName" class="m-0 ml-2 text-left text-danger" style="font-size: 13px;"></p>
	 	</div>
	 	
	    <!-- E-mail -->
	    <div class="mb-4">
	    	<input type="email" name="u_email" id="u_email" class="form-control" placeholder="E-mail" onblur="emailCheck()" required>
	    	<p id="alertEmail" class="m-0 ml-2 text-left text-danger" style="font-size: 13px;"></p>
	 	</div>
		
		<!-- Password -->
		<div class="mb-4">
	    	<input type="password" id="u_pwd" name="u_pwd" class="form-control" placeholder="Password" onkeypress="capslock(event)" onblur="pwdCheck(); isSame()" size="20" required>
	    	<p id="alertPwd1" class="m-0 ml-2 text-left text-danger" style="font-size: 13px;"></p>
	    </div>
	   	
		 <!-- Password check -->
	    <div class="mb-4">
	    	<input type="password" id="u_pwd2" name="u_pwd2" class="form-control" placeholder="Password Check" onkeypress="capslock(event)" onblur="isSame()" size="20" required>
	    	<p id="alertPwd2" class="m-0 ml-2 text-left text-danger" style="font-size: 13px;"></p>
	    </div>
		
		<!-- Gender -->
		<!-- 남성 -->
		<div class="custom-control custom-radio custom-control-inline">
			<input type="radio" class="custom-control-input" id="male" name="u_gender" value="male" checked>
			<label class="custom-control-label" for="male">남성</label>
		</div>
		
		<!-- 여성 -->
		<div class="custom-control custom-radio custom-control-inline mb-5">
			<input type="radio" class="custom-control-input" id="female" name="u_gender" value="female">
			<label class="custom-control-label" for="female">여성</label>
		</div>
		
	    <!-- Sign up button -->
	    <button class="btn btn-info btn-block" type="submit">Sign Up</button>
	
	</form>
</div>

<%@include file="../common/common_bottom.jsp"%>
<script src="${pageContext.request.contextPath }/resources/js/signUp.js"></script>
</body>
</html>