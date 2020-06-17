<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../common/common_top.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/userManagement.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/paging.css" rel="stylesheet">
</head>
<body>
<%@include file="../module/top.jsp"%>

<!-- main_content -->
<div class="container wrapper">
	<!-- modal  -->
	<div class="modal" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">유저 강제 회원 탈퇴</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>선택된 회원을 정말 탈퇴 시키시겠습니까?</p>
				</div>	
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="deleteUser">강제 탈퇴</button>
					<button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<p class="h2 mb-4 text-center"><a href="adminMain">Admin Main</a></p>
    <p class="h4 mb-4 font-weight-bold text-center">유저 조회</p>
	
	<div class="text-right">
		<button id="checkAll" class="btn btn-primary border-fil">전체 선택</button>
		<button class="btn btn-danger" data-toggle="modal" data-target="#myModal">선택 삭제</button>
	</div>
	
	<form name="managementUser" action="deleteUserList" method="post">
	<table class="table border border-dark text-center">
		<thead>
			<tr>
				<th class="w-auto"><i class="fas fa-check ml-1"  aria-hidden="true"></i></th>
				<th class="w-50 h4 font-weight-bold">아이디</th>
				<th class="w-25 h4 font-weight-bold">이름</th>
				<th class="w-25 h4 font-weight-bold">가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${userList }" var="user">
				<tr>
					<td>
						<div class="custom-control custom-checkbox p-0 text-left">
			                <input type="checkbox" id="${user.u_id }"  name="u_idList" value="${user.u_id }" class="custom-control-input p-0" >
			                <label class="custom-control-label" for="${user.u_id }" style="cursor: pointer"></label>
			            </div>
					</td>
					<td class="h5">${user.u_id }</td>
					<td class="h5">${user.u_name }</td>
					<td class="h5"><fmt:formatDate pattern="yyyy-MM-dd" value="${user.u_inputdate }"/></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</form>
	
	<!-- Paging -->
	<nav aria-label="Page navigation example" style="text-align: center;">
		<ul class="pagination" style="width: 100%;">
			<li class="page-item <c:if test="${!pageMaker.prev }">disabled</c:if>"><a class="page-link" href="managementUser${pageMaker.makeQuery(1) }">First</a></li>
			<li class="page-item <c:if test="${!pageMaker.prev }">disabled</c:if>"><a class="page-link" href="managementUser${pageMaker.makeQuery(pageMaker.startBlock-1) }">Prev</a></li>
			
			<c:forEach begin="${pageMaker.startBlock }"  end="${pageMaker.endBlock }" var="i">
				<c:if test="${pageMaker.pc.page == i}">
					<li class="page-item active disabled"><a class="page-link white-text">${i}</a></li>
				</c:if>
				<c:if test="${pageMaker.pc.page != i}">
					<li class="page-item"><a class="page-link" href="managementUser${pageMaker.makeQuery(i) }">${i}</a></li>
				</c:if>
			</c:forEach>
			
			<li class="page-item <c:if test="${!pageMaker.next }">disabled</c:if>"><a class="page-link" href="managementUser${pageMaker.makeQuery(pageMaker.endBlock+1) }">Next</a></li>
			<li class="page-item <c:if test="${!pageMaker.next }">disabled</c:if>"><a class="page-link" href="managementUser${pageMaker.makeQuery(pageMaker.totalBlock) }">Last</a></li>
		</ul>
	</nav>
</div>
<%@include file="../module/bottom.jsp"%>
<%@include file="../common/common_bottom.jsp"%>
<script src="${pageContext.request.contextPath }/resources/js/managementUser.js" ></script>
</body>
</html>