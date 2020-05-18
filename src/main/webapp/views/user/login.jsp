<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@include file="/views/common/common_top.jsp" %>
<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
</head>
<body>
<div class="container wrapper">
<!-- Default form login -->
<form class="text-center border border-light p-5" action="#!">

    <p class="h2 mb-4"><a href="../index.jsp">Board Main</a></p>
	<p class="h4 mb-4">로그인</p>
	
    <!-- Email -->
    <input type="text" name="u_id" class="form-control mb-4" placeholder="ID">

    <!-- Password -->
    <input type="password" name="u_pwd" class="form-control mb-4" placeholder="Password">

    <div class="d-flex justify-content-around">
        <div>
            <!-- Remember me -->
            <div class="custom-control custom-checkbox text-left">
                <input type="checkbox" class="custom-control-input" id="RememberMe">
                <label class="custom-control-label" for="RememberMe">Remember me</label>
            </div>
        </div>
    </div>

    <!-- Sign in button -->
    <button class="btn btn-info btn-block my-4" type="submit">Sign in</button>

    <!-- Register -->
    <p>Not a member?
        <a href="./signUp.jsp">Register</a>
    </p>
</form>
<!-- Default form login -->
</div>

<%@include file="/views/common/common_bottom.jsp" %>
</body>
</html>