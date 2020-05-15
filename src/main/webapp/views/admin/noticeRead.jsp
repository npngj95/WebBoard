<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Read</title>
<%@include file="/views/common/common_top.jsp" %>
<%@include file="/views/module/top.jsp" %>
<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet">
</head>
<body>
<div class="container wrapper">
<!-- Default form contact -->
<form class="text-center border border-light p-5" action="noticeList.jsp">

    <p class="h4 mb-4">공지 사항</p>

    <!-- Name -->
    <div id="defaultContactFormName" class="text-left mb-4" ><i class="fas fa-user prefix"></i> 관리자</div>
	
	<hr>
    <!-- Category -->
    <div id="defaultContactFormEmail" class="text-left mb-4"><i class="fas fa-clone"></i> 공지</div>
	
	<!-- Title -->
    <div style="text-align: left;">
	    <input type="text" id="defaultContactFormEmail" class="form-control mb-4" placeholder="Title" style="width: 78%; margin-right: 5%; display: inline-block;">
	    <button type="button" class="btn btn-rounded btn-brown"><i class="fas fa-redo pr-2" aria-hidden="true" onclick="#!"></i>목록으로</button>
    </div>
    
    <!-- Content -->
    <div class="form-group mb-5">
        <textarea class="form-control rounded-0" id="exampleFormControlTextarea2" rows="10" placeholder="Content"></textarea>
    </div>
	
	<hr>
	
	<!-- Back button -->
	<div style="width: 100%; text-align: center; padding: 0 1%;">
		<button type="button" class="btn btn-brown" style="width: 75%; margin-right: 5%;">수정하기</button>
		<button type="button" class="btn btn-outline-danger btn-rounded waves-effect" style="width: 15%;">삭제하기</button>
	</div>
    
    
</form>
<!-- Default form contact -->
</div>
<%@include file="/views/module/bottom.jsp" %>
<%@include file="/views/common/common_bottom.jsp" %>
</body>
</html>