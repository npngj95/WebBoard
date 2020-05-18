<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<%@include file="/views/common/common_top.jsp" %>
<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
</head>
<body>
<div class="container wrapper">
<!-- Default form register -->
<form class="text-center border border-light p-5" action="signUp.do">
	<p class="h2 mb-4"><a href="../index.jsp">Board Main</a></p>
    <p class="h4 mb-4">회원가입</p>
	
	<!-- ID -->
	<div class="form-row mb-4">
        <div style="width: 70%; padding-left: 5px; margin-right: 5%">
    		<input type="text" name="u_id" class="form-control" placeholder="ID">
        </div>
        <div style="width: 25%; padding-right: 5px;">
            <input type="button" class="form-control btn-info btn-block" style="font-size: 0.8em; margin-top: 2px;" value="중복확인" onclick="userIdCheck()">
        </div>
    </div>
    
    <!-- Name -->
    <input type="text" name="u_name" class="form-control mb-4" placeholder="Name">
 	
    <!-- E-mail -->
    <input type="email" name="u_email" class="form-control mb-4" placeholder="E-mail">

    <!-- Password -->
    <input type="password" name="u_pwd" class="form-control mb-4" placeholder="Password" aria-describedby="defaultRegisterFormPasswordHelpBlock">
   
	 <!-- Password check -->
    <input type="password" name="u_pwd2" class="form-control mb-4" placeholder="Password Check" aria-describedby="defaultRegisterFormPasswordHelpBlock">

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
<!-- Default form register -->
</div>

<%@include file="/views/common/common_bottom.jsp" %>
</body>
</html>