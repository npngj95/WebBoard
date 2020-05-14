<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 조회</title>
</head>
<%@include file="/views/common/common_top.jsp" %>
<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
</head>
<body>
<div class="container wrapper">
	<div class="text-center border border-light p-5">
			<p class="h2 mb-4"><a href="../index.jsp">Board Main</a></p>
    		<p class="h4 mb-4">회원 정보 조회</p>
    		
		    <div class="text-left mb-4">
		      <div>ID</div>
		      <span class="form-control">나의 아이디</span>
		    </div>
		    <div class="text-left mb-4">
		      <div>Name</div>
		      <span class="form-control">나의 이름</span>
		    </div>
		    <div class="text-left mb-4">
		      <div>E-Mail</div>
		      <span class="form-control">나의 이메일</span>
		    </div>
		    <div class="text-left mb-4">
		      <div>Phone</div>
		      <span class="form-control">나의 전화번호</span>
		    </div>
		    <div class="text-left mb-4">
		      <div>Gender</div>
		      <span class="form-control">나의 성별</span>
		    </div>
		    <div class="text-left mb-5">
		      <div>Input Date</div>
		      <span class="form-control">나의 가입일</span>
		    </div>
		    
		    <!-- Sign up button -->
		    <button class="form-control btn-success btn-block mb-3" type="submit">비밀 번호 변경</button>
    		<button class="form-control btn-info btn-block mb-3" type="submit">회원 정보 수정</button>
    		<button class="form-control btn-dark btn-block" type="submit">회원 탈퇴</button>
	</div>
</div>

<%@include file="/views/common/common_bottom.jsp" %>
</body>
</html>