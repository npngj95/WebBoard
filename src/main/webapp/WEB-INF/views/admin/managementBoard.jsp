<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice List</title>
<%@include file="../common/common_top.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/paging.css" rel="stylesheet">
</head>
<body>
<%@include file="../module/top.jsp"%>

<!-- main_content -->
<div class="container wrapper">
	<!-- modal  -->
	<div class="modal" id="selectModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">선택 게시글 삭제</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>선택된 게시글들을 삭제하시겠습니까?</p>
				</div>	
				<div class="modal-footer">
					<!-- JQuery 처리 -->
					<button type="button" class="btn btn-danger" id="deleteBoard">삭제</button>
					<button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Admin Main 이동 -->
	<p class="h2 mb-4 text-center"><a href="/WebBoard/admin/adminMain">Admin Main</a></p>
	
	<nav class="navbar navbar-expand-lg  md-color">
		<!-- Navbar brand -->
		<div class="mb-2">
			<a class="navbar-brand" href="managementBoard${pageMaker.makeQuery(1) }&sort=b_regdate">작성일순</a>
			<a class="navbar-brand"	href="managementBoard${pageMaker.makeQuery(1) }&sort=b_like">추천순</a> 
			<a class="navbar-brand" href="managementBoard${pageMaker.makeQuery(1) }&sort=b_hate">비추천순</a>
		</div>
		
		<form class="form-inline ml-auto" action="managementBoard" method="get">
			<select name="condition" class="browser-default custom-select mr-2 mb-2">
			  <option value="b_title" <c:if test="${pageMaker.pc.condition=='b_title'}">selected</c:if> >제목</option>
			  <option value="b_writer" <c:if test="${pageMaker.pc.condition=='b_writer' }">selected</c:if> >글쓴이</option>
			  <option value="b_content" <c:if test="${pageMaker.pc.condition=='b_content' }">selected</c:if> >내용</option>
			</select>
			<div class="row mx-0">
				<input class="col form-control mt-1" type="text" name="keyword" placeholder="Search" value="${pageMaker.pc.keyword }">
				<button class="col btn btn-default my-0 mb-2 ml-3" type="submit">Search</button>
			</div>
		</form>
		<!-- Collapsible content -->
	</nav>
	
	<div class="bg-default py-2 mb-3 d-flex justify-content-between align-items-center">
		<!-- 전체 선택 -->
		<div>
			<button type="button" class="btn btn-outline-white btn-rounded btn-sm p-2 ml-3" id="checkAll"></button>
		</div>
	
	 	<span class="h5 m-0 white-text font-weight-bold">게시글 관리</span>
	
		<!-- 삭제버튼 -->
	  	<div>
		    <button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2 mr-4" id="deleteBtn"
		    	data-toggle="modal" data-target="#selectModal">
		      <i class="far fa-trash-alt mt-0"></i>
		    </button>
	  	</div>
	</div>
  
  	<!-- table -->
    <div class="table-wrapper">
		<form name="managementBoard" action="deleteBoardList" method="post">
		    <table class="table table-hover mb-3">
				<!--Table head-->
			    <thead>
		        	<tr>
						<th width="5%" class="h6 text-center">  </th>
				        <th width="5%" class="h6 text-center">Category</th>
				        <th class="text-left h6">Title</th>
				        <th width="10%" class="h6 text-center">Writer</th>
				    	<th width="10%" class="h6 text-center">Input Date</th>
				        <th width="5%" class="h6 text-center">Like</th>
				        <th width="5%" class="h6 text-center">Hate</th>
		          	</tr>
	        	</thead>
	        	<!--Table body-->
	        	<tbody>
	        		<c:forEach items="${boardList }" var="board" varStatus="i">
	          		<tr>
		            	<th class="position-relative">
							<input class="form-check-input m-0 w-50 h-50" type="checkbox" name="b_numList" value="${board.b_num }">
						</th>
	            		<td class="h6 text-center">
	            			<c:if test="${board.b_category == 1}">질문</c:if>
	            			<c:if test="${board.b_category == 2}">후기</c:if>
	            		</td>
	            		<td class="h6 toggleButton" style="cursor: pointer">${board.b_title }</td>
	            		<td class="h6 text-center">${board.b_writer }</td>
	            		<td class="h6 text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.b_regdate }"/></td>
	            		<td class="h6 text-center">${board.b_like }</td>
	            		<td class="h6 text-center">${board.b_hate }</td>
	          		</tr>
	          		<tr class="toggleContent${i.index }" style="display: none;">
	          			<td class="toggleContent${i.index }" colspan="5" style="display: none;"><div class="toggleContent${i.index }" style="display: none;">${board.b_content }</div></td>
	          		</tr>
	          		</c:forEach>
	        	</tbody>
	        	
	        	<!--Table body-->
	    	</table>
	    	<!--Table-->
	    </form>
    </div>
    
    <!-- Paging -->
	<nav aria-label="Page navigation example" style="text-align: center;">
		<ul class="pagination" style="width: 100%;">
			<li class="page-item <c:if test="${!pageMaker.prev }">disabled</c:if>"><a class="page-link" href="managementBoard${pageMaker.makeQuery(1) }&sort=${pageMaker.pc.sort}">First</a></li>
			<li class="page-item <c:if test="${!pageMaker.prev }">disabled</c:if>"><a class="page-link" href="managementBoard${pageMaker.makeQuery(pageMaker.startBlock-1) }&sort=${pageMaker.pc.sort}">Prev</a></li>
			
			<c:forEach begin="${pageMaker.startBlock }"  end="${pageMaker.endBlock }" var="i">
				<c:if test="${pageMaker.pc.page == i}">
					<li class="page-item active disabled"><a class="page-link white-text">${i}</a></li>
				</c:if>
				<c:if test="${pageMaker.pc.page != i}">
					<li class="page-item"><a class="page-link" href="managementBoard${pageMaker.makeQuery(i) }&sort=${pageMaker.pc.sort}">${i}</a></li>
				</c:if> 
			</c:forEach>
			
			<li class="page-item <c:if test="${!pageMaker.next }">disabled</c:if>"><a class="page-link" href="managementBoard${pageMaker.makeQuery(pageMaker.endBlock+1) }&sort=${pageMaker.pc.sort}">Next</a></li>
			<li class="page-item <c:if test="${!pageMaker.next }">disabled</c:if>"><a class="page-link" href="managementBoard${pageMaker.makeQuery(pageMaker.totalBlock) }&sort=${pageMaker.pc.sort}">Last</a></li>
		</ul>
	</nav>
</div>
<!-- Table with panel -->
<%@include file="../module/bottom.jsp"%>
<%@include file="../common/common_bottom.jsp"%>
<script src="${pageContext.request.contextPath }/resources/js/managementBoard.js"></script>
</body>
</html>