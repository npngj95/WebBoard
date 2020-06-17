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
<input id="path" type="hidden">
<input id="u_id" type="hidden" value="${user.u_id }">
<div class="container wrapper">
 	<!-- modal-check-pwd  -->
	<div class="modal" id="myModal1">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">비밀번호 체크</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p class="text-left">
					비밀번호를 입력해주세요.
					</p>
					<!-- Password -->
    				<input type="password" id="u_pwd" name="u_pwd" class="form-control" placeholder="비밀번호 확인">
					<p id="alertPwd" class="text-danger text-left"></p>
				</div>	
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" onclick="pwdCheck('updatePwd')">확인</button>
					<button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- modal-delete-user  -->
	<div class="modal" id="myModal2">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">회원 탈퇴</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>정말 탈퇴 하시겠습니까?</p>
				</div>	
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" onclick="location='deleteUser?u_id=${user.u_id }'">탈퇴</button>
					<button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>

	<div class="text-center border border-light p-5">
			<p class="h2 mb-4"><a href="${pageContext.request.contextPath }/index">Board Main</a></p>
    		<p class="h4 mb-4">회원 정보 조회</p>
    		
		    <div class="text-left mb-4">
		      <div>ID</div>
		      <span class="form-control">${user.u_id }</span>
		    </div>
		    <div class="text-left mb-4">
		      <div>Name</div>
		      <span class="form-control">${user.u_name }</span>
		    </div>
		    <div class="text-left mb-4">
		      <div>E-Mail</div>
		      <span class="form-control">${user.u_email }</span>
		    </div>
		    <div class="text-left mb-4">
		      <div>Gender</div>
		      <span class="form-control">${user.u_gender }</span>
		    </div>
		    <div class="text-left mb-5">
		      <div>Input Date</div>
		      <span class="form-control"><fmt:formatDate pattern="yyyy-MM-dd (E) a hh:mm:ss" value="${user.u_inputdate }"/></span>
		    </div>
		    
		    <!-- button -->
		    <button class="form-control btn-success btn-block mb-3" type="button" onclick="openModal('updatePwd')">비밀 번호 변경</button>
    		<button class="form-control btn-info btn-block mb-3" type="button" onclick="openModal('updateUser')">회원 정보 수정</button>
    		<button class="form-control btn-dark btn-block" type="button" data-toggle="modal" data-target="#myModal2">회원 탈퇴</button>
	</div>
</div>

<%@include file="../common/common_bottom.jsp"%>
<script src="${pageContext.request.contextPath }/resources/js/selectUser.js"></script>
</body>
</html>