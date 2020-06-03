<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice List</title>
<%@include file="../common/common_top.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet">
</head>
<body>
<%@include file="../module/top.jsp"%>
<div class="container wrapper">
	<!-- modal -->
	<div class="modal" id="selectModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">선택 공지 삭제</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<p>선택된 공지글들을 삭제하시겠습니까?</p>
				</div>
				<div class="modal-footer">
					<!-- JQuery 처리 -->
					<button type="button" class="btn btn-danger" id="deleteNotice">삭제</button>
					<button type="button" class="btn btn-dark" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- Admin Main 이동 -->
	<p class="h2 mb-4 text-center"><a href="adminMain">Admin Main</a></p>
	
	<div class="bg-default py-2 mb-3 d-flex justify-content-between align-items-center">
		<!-- 전체 선택 -->
		<div>
			<button type="button" class="btn btn-outline-white btn-rounded btn-sm p-2 ml-3" id="checkAll"></button>
		</div>
		
		<span class="h5 m-0 white-text  font-weight-bold">공지글 관리</span>
		
		<!-- 삭제버튼 -->
		<div>
			<button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2 mr-4" id="deleteBtn" 
				data-toggle="modal" data-target="#selectModal">
				<i class="far fa-trash-alt m-0 h6"></i>
			</button>
		</div>
	</div>

	<!-- table -->
	<div class="table-wrapper">
		<form name="managementNotice" action="deleteNoticeList"	method="post">
			<table class="table table-hover mb-3">
				<!--Table head-->
				<thead>
					<tr>
						<th width="5%" class="h6 text-center"></th>
						<th width="5%" class="h6 text-center">Category</th>
						<th class="text-left h6">Title</th>
						<th width="10%" class="h6 text-center">Writer</th>
						<th width="10%" class="h6 text-center">RegDate</th>
						<th width="10%" class="text-center">Edit Notice</th>
					</tr>
				</thead>
				<!--Table body-->
				<tbody>
					<c:forEach items="${noticeList }" var="notice" varStatus="i">
						<tr>
							<th class="position-relative">
								<input class="form-check-input m-0 w-50 h-50" type="checkbox" name="b_numList" value="${notice.b_num }">
							</th>
							<td class="h6 text-center">공지</td>
							<td class="h6 toggleButton" style="cursor: pointer;">${notice.b_title }</td>
							<td class="h6 text-center">${notice.b_writer }</td>
							<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd" value="${notice.b_regdate }"/></td>
							<td class="text-center"><i class="fas fa-edit m-0 h5" style="cursor: pointer;" onclick="location.href='updateNotice?b_num=${notice.b_num }'"></i></td>
						</tr>
						<tr class="toggleContent${i.index }" style="display: none;">
	          				<td class="toggleContent${i.index }" colspan="6" style="display: none;"><div class="toggleContent${i.index }" style="display: none;">${notice.b_content }</div></td>
	          			</tr>
					</c:forEach>
				</tbody>
				<!--Table body-->
			</table>
			<!--Table-->
		</form>
	</div>
</div>

<%@include file="../module/bottom.jsp"%>
<%@include file="../common/common_bottom.jsp"%>
<script src="${pageContext.request.contextPath }/resources/js/managementNotice.js"></script>
</body>
</html>