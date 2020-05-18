<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 메인</title>
<%@include file="/views/common/common_top.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/master.css" rel="stylesheet">

</head>
<body>
	<%@include file="/views/module/top.jsp"%>
	<div class="row container wrapper text-center">
    
		<div class="col border border-light w-25 m-3 p-0 display-inlineblock rounded mb-0">
			<p class="h4 m-0 py-3 bg-primary text-white"><i class="fas fa-bullhorn mr-3"></i>공지</p>
			<div class="row-sm">
				<button type="button" class="h4 btn border-bottom border-linght waves-effect mx-0 my-0 w-100"
					onclick="location='./noticeWrite.jsp'">
				공지글 작성</button>
			</div>
			<div class="row-sm">
				<button type="button" class="btn waves-effect mx-0 my-0 w-100" 
					onclick="location='./noticeManagement.jsp'">
  				공지글 관리</button>
			</div>
		</div>
		
		<div class="col border border-light w-25 m-3 p-0 display-inlineblock rounded mb-0">
			<p class="h4 m-0 py-3 bg-primary text-white"><i class="fas fa-user prefix mr-3"></i>회원</p>
			<div class="row-sm">
				<button type="button" class="h4 btn border-bottom border-linght waves-effect mx-0 my-0 w-100"
					onclick="location='./userManagement.jsp'">
				회원 관리</button>
			</div>
			<div class="row-sm">
				<button type="button" class="btn waves-effect mx-0 my-0 w-100"
					onclick="location='./boardManagement.jsp'">
  				게시글 관리</button>
			</div>
		</div>
	</div>
	<%@include file="/views/module/bottom.jsp"%>
	<%@include file="/views/common/common_bottom.jsp"%>
</body>
</html>