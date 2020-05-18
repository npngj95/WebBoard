<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath }/views/index.jsp">## 게시판</a>
	
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarColor01">
			<!-- Links -->
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath }/views/user/login.jsp">
					로그인 </a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="${pageContext.request.contextPath }/views/user/signUp.jsp">
					회원가입 </a>
				</li>
			</ul>
			<!-- Links -->
		</div>
	</nav>
</body>
</html>