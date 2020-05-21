<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 조회</title>
</head>
<%@include file="../common/common_top.jsp"%>

<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
</head>
<body>
<div class="container wrapper">
	<div class="text-center border border-light p-5">
			<p class="h2 mb-4"><a href="${pageContext.request.contextPath }/index">Board Main</a></p>
    		<p class="h4 mb-4">회원 정보 조회</p>
    		
		    <div class="text-left mb-4">
		      <div>ID</div>
		      <span class="form-control">${users.u_id }</span>
		    </div>
		    <div class="text-left mb-4">
		      <div>Name</div>
		      <span class="form-control">${users.u_name }</span>
		    </div>
		    <div class="text-left mb-4">
		      <div>E-Mail</div>
		      <span class="form-control">${users.u_email }</span>
		    </div>
		    <div class="text-left mb-4">
		      <div>Gender</div>
		      <span class="form-control">${users.u_gender }</span>
		    </div>
		    <div class="text-left mb-5">
		      <div>Input Date</div>
		      <span class="form-control"><fmt:formatDate pattern="yyyy-MM-dd (E) a hh:mm:ss" value="${users.u_inputdate }"/></span>
		    </div>
		    
		    <!-- button -->
		    <button class="form-control btn-success btn-block mb-3" type="button" onclick="updatePwd.do?u_id=${users.u_id }">비밀 번호 변경</button>
    		<button class="form-control btn-info btn-block mb-3" type="button" onclick="updateUser.do?u_id=${users.u_id }">회원 정보 수정</button>
    		<button class="form-control btn-dark btn-block" type="button" onclick="deleteUser.do?u_id=${users.u_id }">회원 탈퇴</button>
	</div>
</div>

<%@include file="../common/common_bottom.jsp"%>
</body>
</html>