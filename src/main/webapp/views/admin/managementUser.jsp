<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/views/common/common_top.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/userManagement.css" rel="stylesheet">
</head>
<body>
<%@include file="/views/module/top.jsp"%>

<!-- main_content -->
<div class="container wrapper vh-100">
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
	
	<p class="h2 mb-4 text-center"><a href="./adminMain.jsp">Admin Main</a></p>
    <p class="h4 mb-4 text-center">유저 조회</p>
	
	<div class="text-right">
		<button id="checkAll" class="btn btn-primary border-fil">전체 선택</button>
		<button class="btn btn-danger" data-toggle="modal" data-target="#myModal">선택 삭제</button>
	</div>
	
	<form name="managementUser" action="./deleteUser.jsp" method="post">
	<table class="table border border-dark text-center">
		<thead>
			<tr>
				<th class="w-auto"><i class="fas fa-check ml-1"  aria-hidden="true"></i></th>
				<th class="w-50 h4 font-weight-bold">이름</th>
				<th class="w-25 h4 font-weight-bold">아이디</th>
				<th class="w-25 h4 font-weight-bold">가입일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>
					<div class="custom-control custom-checkbox p-0 text-left">
		                <input type="checkbox" id="1"  name="userCheck" value="유저아이디1" class="custom-control-input p-0" >
		                <label class="custom-control-label" for="1" style="cursor: pointer"></label>
		            </div>
				</td>
				<td class="h5">홍길동</td>
				<td class="h5">HongRoad</td>
				<td class="h5">2020-05-15</td>
			</tr>
			<tr>
				<td>
					<div class="custom-control custom-checkbox p-0 text-left">
		                <input type="checkbox" id="2"  name="userCheck" value="유저아이디2" class="custom-control-input p-0" >
		                <label class="custom-control-label" for="2" style="cursor: pointer"></label>
		            </div>
				</td>
				<td class="h5">홍길동</td>
				<td class="h5">HongRoad</td>
				<td class="h5">2020-05-15</td>
			</tr>
		</tbody>
	</table>
	</form>
</div>
<%@include file="/views/module/bottom.jsp"%>
<%@include file="/views/common/common_bottom.jsp"%>
<script src="${pageContext.request.contextPath }/resources/js/managementUser.js" ></script>
</body>
</html>