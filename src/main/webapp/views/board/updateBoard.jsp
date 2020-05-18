<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용 수정</title>
<%@include file="/views/common/common_top.jsp" %>
<%@include file="/views/module/top.jsp" %>
<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet"> 
</head>
<body>
<div class="container wrapper">
<form class="text-center border border-light p-5" action="updateBoard.do">

    <p class="h4 mb-4">Update Board</p>

    <!-- Category -->
    <select name="b_category" class="browser-default custom-select mb-4">
        <option selected hidden="true">Category</option>
        <option value="1">질문</option>
        <option value="2">후기</option>
    </select>
	
	<!-- Title -->
    <input type="text" name="b_title" class="form-control mb-4" placeholder="Title">
    
    <!-- Content -->
    <div class="form-group">
        <textarea class="form-control rounded-0" name="b_content" rows="10" placeholder="Content"></textarea>
    </div>
	
	<div class="container text-right">
		<button type="button" style="width: 100px; height:40px; padding:5px;" class="btn btn-dark mb-3" onclick="location='#">글 수정</button>
		<button type="button" style="width: 100px; height:40px; padding:5px;" class="btn btn-dark mb-3" onclick="history.back()">취소</button>
	</div>
</form>
</div>
<%@include file="/views/module/bottom.jsp" %>
<%@include file="/views/common/common_bottom.jsp" %>
</body>
</html>