<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용 수정</title>
<%@include file="../common/common_top.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/summerNote/summernote-bs4.min.css" rel="stylesheet">
 
</head>
<body>
<%@include file="../module/top.jsp"%>
<div class="container wrapper text-center border border-light p-5">
<form action="updateBoard" method="post" onsubmit="return empCheck()">
	<input type="hidden" name="b_num" value="${board.b_num }">
	
    <p class="h4 mb-4">Update Board</p>
    
    <!-- Category -->
    <select name="b_category" class="browser-default custom-select mb-4">
        <option value="1" <c:if test="${board.b_category == 1}">selected</c:if> >질문</option>
        <option value="2" <c:if test="${board.b_category == 2}">selected</c:if> >후기</option>
    </select>
	
	<!-- Title -->
    <input type="text" name="b_title" class="form-control mb-4" placeholder="Title" value="${board.b_title }">
    
    <!-- Content -->
    <div class="form-group text-left">
        <textarea class="form-control rounded-0" id="b_content" name="b_content" rows="10" placeholder="Content" style="resize: none;">${board.b_content }</textarea>
    </div>
	
	<div class="container text-right">
		<button type="submit" style="width: 100px; height:40px; padding:5px;" class="btn btn-dark mb-3">글 수정</button>
		<button type="button" style="width: 100px; height:40px; padding:5px;" class="btn btn-dark mb-3" onclick="history.back()">취소</button>
	</div>
</form>
</div>
<%@include file="../module/bottom.jsp"%>
<%@include file="../common/common_bottom.jsp"%>

<script src="${pageContext.request.contextPath }/resources/summerNote/summernote-bs4.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/updateBoard.js"></script>
</body>
</html>