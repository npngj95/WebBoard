<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath }/index">Web Board</a>
	
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarColor01">
			<!-- Links -->
			<ul class="navbar-nav ml-auto">
				<c:choose>
					<c:when test="${admin != null}">
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath }/admin/adminMain">
							관리자메인 </a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="${pageContext.request.contextPath }/admin/logout">
							로그아웃</a>
						</li>
					</c:when>
					
					<c:otherwise>
						<c:if test="${user == null}">
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.request.contextPath }/login">
								로그인 </a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.request.contextPath }/signUp">
								회원가입 </a>
							</li>				
						</c:if>
						
						<c:if test="${user != null}">
							<li class="nav-item">
								<div class="text-white p-2">${user.u_name }님</div>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.request.contextPath }/user/selectUser">
								회원정보관리 </a>
							</li>
							<li class="nav-item">
								<a class="nav-link" href="${pageContext.request.contextPath }/logout">
								로그아웃 </a>
							</li>				
						</c:if>	
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
</body>
</html>