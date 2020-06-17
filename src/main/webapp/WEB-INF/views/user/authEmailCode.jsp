<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../common/common_top.jsp" %>
<link href="${pageContext.request.contextPath }/resources/css/login.css" rel="stylesheet">
</head>
<body>
<div class="container wrapper">
	<c:if test="${result != 1  }">
		<form class="text-center border border-light p-5" action="authEmailCode" method="post">
		
		    <p class="h2 mb-4"><a href="index">Board Main</a></p>
			<p class="h4 mb-4">이메일 인증</p>
	
		    <!-- ID -->
		    <input type="text" name="u_id" class="form-control mb-4" placeholder="ID" value="${authUser.u_id }" readonly>
			
			<!-- E-Mail AuthCode -->
		    <input id="inputCode" type="text" name="u_email_code" class="form-control mb-4" placeholder="E-Mail Code">
	
			<c:if test="${result == 0 }"><p id="alert" class="text-danger" style="font-size: 13px">인증에 실패하였습니다.</p></c:if>
		
		    <!-- Sign in button -->
		    <button class="btn btn-info btn-block my-4" type="submit">confirm</button>
		</form>
	</c:if>
	
	<c:if test="${result == 1 }">
		<script>
			alert("인증이 완료되었습니다.");
			location = "index";
		</script>
	</c:if>
	
</div>
<%@include file="../common/common_bottom.jsp" %>
</body>
</html>