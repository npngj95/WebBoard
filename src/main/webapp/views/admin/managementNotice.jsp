<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice List</title>
<%@include file="/views/common/common_top.jsp" %>
<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet">
<script>

</script>
</head>
<body>
<%@include file="/views/module/top.jsp" %>
<div class="container wrapper vh-100">
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
	<p class="h2 mb-4 text-center"><a href="./adminMain.jsp">Admin Main</a></p>
	
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
				<i class="far fa-trash-alt mt-0"></i>
			</button>
		</div>
	</div>

	<!-- table -->
	<div class="table-wrapper">
		<form name="managementNotice" action="deleteNotice.jsp"	method="post">
			<table class="table table-hover mb-3">
				<!--Table head-->
				<thead>
					<tr>
						<th width="5%" class="h6 text-center"></th>
						<th width="5%" class="h6 text-center">Category</th>
						<th class="text-left h6">Title</th>
						<th width="10%" class="h6 text-center">Writer</th>
						<th width="10%" class="h6 text-center">Input Date</th>
					</tr>
				</thead>
				<!--Table body-->
				<tbody>
					<tr>
						<th class="position-relative">
							<input class="form-check-input m-0 w-50 h-50" type="checkbox" name="noticeCheck" value="게시글번호1">
						</th>
						<td class="h6 text-center">공지</td>
						<td class="h6"><a href="updateNotice.jsp">게시판 이용수칙</a></td>
						<td class="h6 text-center">@admin</td>
						<td class="h6 text-center">2020-05-15</td>
					</tr>
					<tr>
						<th class="position-relative">
							<input class="form-check-input m-0 w-50 h-50" type="checkbox" name="noticeCheck" value="게시글번호2">
						</th>
						<td class="h6 text-center">공지</td>
						<td class="h6"><a href="updateNotice.jsp">제재 회원 목록</a></td>
						<td class="h6 text-center">@admin</td>
						<td class="h6 text-center">2020-05-14</td>
					</tr>
				</tbody>
				<!--Table body-->
			</table>
			<!--Table-->
		</form>
	</div>
</div>

<%@include file="/views/module/bottom.jsp" %>
<%@include file="/views/common/common_bottom.jsp" %>
<script src="${pageContext.request.contextPath }/resources/js/managementNotice.js"></script>
</body>
</html>