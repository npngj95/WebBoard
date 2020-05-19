<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<%@include file="/views/common/common_top.jsp" %>
<link href="${pageContext.request.contextPath }/resources/css/main.css"	rel="stylesheet">
</head>
<body>
	<%@include file="/views/module/top.jsp"%>

	<div class="container wrapper">
		<h2 style="margin-top: 60px; display: inline-block;">게시판 메인</h2>

		<nav class="navbar navbar-expand-lg  md-color">
			<!-- Navbar brand -->
			<div class="mb-2">
				<a class="navbar-brand" href="#">정렬1</a>
				<a class="navbar-brand"	href="#">정렬2</a> 
				<a class="navbar-brand" href="#">정렬3</a>
			</div>
			
			<form class="form-inline ml-auto" action="searchBoard.do" method="post">
				<select class="browser-default custom-select mr-2 mb-2">
				  <option value="1" selected>제목</option>
				  <option value="2">글쓴이</option>
				  <option value="3">내용</option>
				</select>
				<div class="row mx-0">
					<input class="col form-control mt-1" type="text"	placeholder="Search" aria-label="Search">
					<button class="col btn btn-default my-0 mb-2 ml-3" type="submit">Search</button>
				</div>
			</form>
			<!-- Collapsible content -->
		</nav>

		<hr>
		<!-- table -->
		<table class="table">
			<thead class="black white-text">
				<tr>
					<th scope="col" width="10%">카테고리</th>
					<th scope="col">제목</th>
					<th scope="col" width="15%">작성자</th>
					<th scope="col" width="20%">작성일</th>
					<th scope="col" width="7%">조회수</th>
					<th scope="col" width="7%">추천수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td><a href="./board/readBoard.jsp">Mark</a></td>
					<td>Otto</td>
					<td>2020-02-02</td>
					<td>@mdo</td>
					<td>@mdo</td>
				</tr>
			</tbody>
		</table>
		
		<div class="container text-right">
			<button style="width: 100px; padding:5px;" class="btn btn-dark mb-3" onclick="location='./board/writeBoard.jsp'">글쓰기</button>
		</div>
		
		<!-- Paging -->
		<nav aria-label="Page navigation example" style="text-align: center;">
			<ul class="pagination pg-blue" style="width: 100%;">
				<li class="page-item disabled"><a class="page-link" tabindex="-1">First</a></li>
				<li class="page-item disabled"><a class="page-link" tabindex="-1">Prev</a></li>
				<li class="page-item active"><a class="page-link">1</a></li>
				<li class="page-item"><a class="page-link">2</a></li>
				<li class="page-item"><a class="page-link">3</a></li>
				<li class="page-item"><a class="page-link">4</a></li>
				<li class="page-item"><a class="page-link">5</a></li>
				<li class="page-item"><a class="page-link">6</a></li>
				<li class="page-item"><a class="page-link">7</a></li>
				<li class="page-item"><a class="page-link">8</a></li>
				<li class="page-item"><a class="page-link">9</a></li>
				<li class="page-item"><a class="page-link">10</a></li>
				<li class="page-item"><a class="page-link">Next</a></li>
				<li class="page-item"><a class="page-link">Last</a></li>
			</ul>
		</nav>
	</div>
	
	
	<%@include file="/views/module/bottom.jsp"%>
	
	<%@include file="/views/common/common_bottom.jsp" %>
</body>
</html>