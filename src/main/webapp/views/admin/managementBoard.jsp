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

<!-- main_content -->
<div class="container wrapper vh-100">
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
	<p class="h2 mb-4 text-center"><a href="./adminMain.jsp">Admin Main</a></p>
	
	<div class="bg-default py-2 mb-3 d-flex justify-content-between align-items-center">
		<!-- 전체 선택 -->
		<div>
			<button type="button" class="btn btn-outline-white btn-rounded btn-sm px-2" id="checkAll"></button>
		</div>
	
	 	<span class="white-text font-weight-bold">게시글 관리</span>
	
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
		<form name="managementBoard" action="deleteBoard.jsp" method="post">
		    <table class="table table-hover mb-3">
				<!--Table head-->
			    <thead>
		        	<tr>
						<th width="3%" class="text-center">  </th>
				        <th width="5%" class="text-center">Category</th>
				        <th class="text-left">Title</th>
				        <th width="10%" class="text-center">Writer</th>
				    	<th width="10%" class="text-center">Input Date</th>
		          	</tr>
	        	</thead>
	        	<!--Table body-->
	        	<tbody>
	          		<tr>
		            	<th scope="row">
		              		<input class="form-check-input ml-0" type="checkbox" name="boardCheck" value="게시글번호1">
		            	</th>
	            		<td class="text-center">질문</td>
	            		<td>####집 어때요?</td>
	            		<td class="text-center">@mdo</td>
	            		<td class="text-center">2020-05-15</td>
	          		</tr>
	          		<tr>
	            		<th scope="row">
	              			<input class="form-check-input ml-0" type="checkbox" name="boardCheck" value="게시글번호2">
	            		</th>
	            		<td class="text-center">리뷰</td>
	            		<td><a href="../board/readBoard.jsp">@@@집 후기입니다 ~</a></td>
	            		<td class="text-center">@fat</td>
	            		<td class="text-center">2020-05-14</td>
	          		</tr>
	        	</tbody>
	        	<!--Table body-->
	    	</table>
	    	<!--Table-->
	    </form>
    </div>
</div>
<!-- Table with panel -->
<%@include file="/views/module/bottom.jsp" %>
<%@include file="/views/common/common_bottom.jsp" %>
<script src="${pageContext.request.contextPath }/resources/js/managementBoard.js"></script>
</body>
</html>