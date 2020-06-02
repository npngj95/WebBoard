<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글 작성</title>
<%@include file="../common/common_top.jsp"%>
<link href="${pageContext.request.contextPath }/resources/css/board.css" rel="stylesheet"> 
</head>
<body>
<%@include file="../module/top.jsp"%>
<div class="container wrapper">
	<form class="text-center border border-light p-5" id="writeBoardForm" action="writeBoard" method="post" onsubmit="return submitContents()">
	
	    <p class="h4 mb-4">Write Board</p>
	
	    <!-- Name -->
	    <input type="text" name="b_writer" class="form-control mb-4" placeholder="Writer" value="${users.u_id }" readonly>
	
	    <!-- Email -->
	    <input type="email" name="b_email" class="form-control mb-4" placeholder="E-mail" value="${users.u_email }" readonly>
		
		<hr>
	    <!-- Category -->
	    <select name="b_category" class="browser-default custom-select mb-4" required>
	        <option selected hidden="true" value="">Category</option>
	        <option value="1">질문</option>
	        <option value="2">후기</option>
	    </select>
		
		<!-- Title -->
	    <input type="text" name="b_title" class="form-control mb-4" placeholder="Title" required>
	    
	    <!-- Content -->
	    <div class="form-group">
	        <textarea id="b_content" name="b_content" class="w-100 form-control rounded-0" rows="10" placeholder="Content"></textarea>
	    </div>
		
		<div class="container text-right">
			<button type="submit" style="width: 100px; height:40px; padding:5px;" class="btn btn-dark mb-3">글쓰기</button>
			<button type="button" style="width: 100px; height:40px; padding:5px;" class="btn btn-dark mb-3" onclick="location='../index'">취소</button>
		</div>
	</form>
</div>
<%@include file="../module/bottom.jsp"%>
<%@include file="../common/common_bottom.jsp"%>
<script src="${pageContext.request.contextPath }/resources/smartEditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
var oEditors = [];

$(function(){
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "b_content", //textarea에서 지정한 id와 일치해야 합니다. 
		sSkinURI: "${pageContext.request.contextPath}/resources/smartEditor/SmartEditor2Skin_ko_KR.html",  
		htParams : {
			bUseToolbar : true,
			bUseVerticalResizer : true,
			bUseModeChanger : true
		},
		fCreator: "createSEditor2"

	});
});

function submitContents() {
// 	var b_content = $("#b_content").html(); html이 아니라 val임 어딘가 변수에 저장되나보다..
	
	var b_content = $("#b_content").val();
    console.log(b_content);
	
	oEditors.getById["b_content"].exec("UPDATE_CONTENTS_FIELD", []);
	
	var b_content = $("#b_content").val();
    console.log(b_content);
    if( b_content == '<p><br></p>')  {
         alert("내용을 입력하세요.");
         oEditors.getById["b_content"].exec("FOCUS"); //포커싱
         return false;
    }
    
    return true;
}
</script>
</body>
</html>