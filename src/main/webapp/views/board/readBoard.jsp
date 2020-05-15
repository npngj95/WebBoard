<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 내용 조회</title>
<%@include file="/views/common/common_top.jsp" %>
<%@include file="/views/module/top.jsp" %>
<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet"> 
</head>
<body>
<div class="container wrapper">
<!-- Default form contact -->
<form class="text-center border border-light p-5" action="#!">

    <p class="h4 mb-4">Read Board</p>

    <!-- Name -->
    <div id="defaultContactFormName" class="text-left mb-4" ><i class="fas fa-user prefix"></i> 작성자 이름</div>

    <!-- Email -->
    <div id="defaultContactFormEmail" class="text-left mb-4"><i class="fas fa-envelope prefix"></i> 작성자 이메일</div>

	<!-- ReadCount -->
    <div id="defaultContactFormEmail" class="text-left mb-4"><i class="far fa-eye"></i> 15 (조회수)</div>

	<hr>
    <!-- Category -->
    <div id="defaultContactFormEmail" class="text-left mb-4"><i class="fas fa-clone"></i> 카테고리</div>
	
	<!-- Title -->
    <input type="email" id="defaultContactFormEmail" class="form-control mb-4" placeholder="Title">
    
    <!-- Content -->
    <div class="form-group mb-5">
        <textarea class="form-control rounded-0" id="exampleFormControlTextarea2" rows="10" placeholder="Content"></textarea>
    </div>
    
    <!-- 수정 / 삭제 버튼 -->
    <div class="container text-right">
		<button style="width: 100px; padding:5px;" class="btn btn-dark mb-3" onclick="location='#">글수정</button>
		<button style="width: 100px; padding:5px;" class="btn btn-dark mb-3" onclick="location='../index.jsp'">글삭제</button>
	</div>
    
    
    <div class="text-left mb-3"><i class="fas fa-comment"></i> 전체 댓글</div>
	<table class="table">
	  <tbody>
	    <tr>
	      <th width="15%" scope="row"><b>더미작성자 1</b></th>
	      <td width="*" class="text-left">더미 댓글 내용 1</td>
	      <td width="10%">20-05-10</td>
	      <td width="5%"><i class="far fa-trash-alt"></i></td>
	    </tr>
	    <tr>
	      <th scope="row"><b>더미작성자 2</b></th>
	      <td class="text-left">더미 댓글 내용 2</td>
	      <td>20-05-12</td>
	      <td><i class="far fa-trash-alt"></i></td>
	    </tr>
	    <tr>
	      <th scope="row"><b>더미작성자 3</b></th>
	      <td class="text-left">더미 댓글 내용 3</td>
	      <td>20-05-14</td>
	      <td><i class="far fa-trash-alt"></i></td>
	    </tr>
	    <tr>
	   	  <th><b>댓글 작성자명</b></th>
	   	  <td colspan="2"><input type="text" id="ReplyContent" class="form-control mb-4" placeholder="ReplyContent"></td>
	   	  <td><button style="width: 100px; padding:5px;" class="btn btn-dark mb-3" onclick="location='#">댓글 입력</button></td>
	    </tr>
	  </tbody>
	</table>
	
	
	
</form>
<!-- Default form contact -->
</div>
<%@include file="/views/module/bottom.jsp" %>
<%@include file="/views/common/common_bottom.jsp" %>
</body>s
</html>