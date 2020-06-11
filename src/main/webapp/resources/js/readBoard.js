
// summerNote
$(document).ready(function() {
    $("#b_content").summernote({
    	lang: 'ko-KR', // default: 'en-US'
    	tabsize: 2,
    	minHeight: 400,
        disableDragAndDrop: true,
        toolbar: false,
        disable: true
    });
    
    $("#b_content").summernote("disable");
  	$(".note-editable").css("background", "white");
  	
});

//************************************************************************************************************************************

//게시글 관련 메서드 (좋아요, 싫어요 버튼)
function updateLike(b_num, u_id) {
	now_like = $("#like").text();
	
	if(!u_id) {
		$("#modal2-body-text").text("먼저 로그인 해야 합니다.");
		$("#modal2-btn").attr("onclick", "location='../login'")
		openModal(2);
		return;
	}

	$.ajax({
		type : 'POST',
		url : "updateLike",
		data : {
			"b_num": b_num
		},
		
		beforeSend : function(request){
			request.setRequestHeader("AJAX", "true");
		},
		
		success : function(result) {
			// ajax처리 이후, html Body의 일부분 (div영역)만 리로딩 하기 위해 .load()함수를 사용
			//$("#like-log").load(window.location.href + " #like-hate-btn");
			// == $("#like-log").load(document.URL + " #like-hate-btn")
			if(now_like == result){
				openModal(2);
			}
			$("#like").text(result);
		},
		
		error : function() {
			location.href="../login";
		}
	});
	
}

function updateHate(b_num, u_id) {
	now_hate = $("#hate").text();
	
	if(!u_id) {
		$("#modal2-body-text").text("먼저 로그인 해야 합니다.");
		$("#modal2-btn").attr("onclick", "location='../login'")
		openModal(2);
		return;
	}

	$.ajax({
		type : 'POST',
		url : "updateHate",
		data : {
			"b_num": b_num
		},
		
		beforeSend : function(request){
			request.setRequestHeader("AJAX", "true");
		},
		
		success : function(result) {
			if(now_hate == result){
				openModal(2);
			} 
			$("#hate").text(result);
		},
		
		error : function() {
			location.href="../login";
		}
	});
	
}

//************************************************************************************************************************************

//댓글 관련 메서드

$(document).ready( //첫 로딩시 댓글 출력 
	function(){
    	selectReply();
	}
);

function frame(r_writer, r_content, r_regdate, r_num) { //댓글 row작성 메서드
	var html = "";
	
	html += "<tr>";
	html += "<th width='15%' scope='row'><b>" + r_writer + "</b></th>";
	html += "<td width='*' class='text-left'>" + r_content + "</td>";
	html += "<td width='10%'>" + r_regdate + "</td>";
	html += "<td width='5%'>";
	if(u_id == r_writer) {
		html += "<i class='far fa-trash-alt' onclick=deleteReplyCheck("+ r_num +") style='cursor: pointer;'></i>";
	}
	html += "</td></tr>";
	
	return html;
}

function selectReply() {
	
	$.ajax({
		type : 'POST',
		url : "selectReply",
		data : {
			"b_num": b_num
		},
		
		success : function(replyList) { //해당 글의 댓글들을 JSON형식으로 반환받음(replyList)
			var html = "";
			
            if(replyList.length > 0){
                for(i=0; i<replyList.length; i++){
                	reply = replyList[i];
                	var regdate = new Date(reply.r_regdate);
                	
                	html += frame(reply.r_writer, reply.r_content, regdate.toLocaleDateString(), reply.r_num);
                	//댓글 수만큼 frame메서드로 Row생성
                }
            }
            
            $("#replyCnt").text(replyList.length);
            $("#replyList").html(html);
            
        }
		
	});
}

// input에 focus되면 로그인 체크
function writeReplyLogin(u_id) {
	if(!u_id) {
		$(event.target).blur();
		
		$("#modal2_title").text("댓글 작성");
		$("#modal2-body-text").text("먼저 로그인 해야 합니다.");
		$("#modal2-btn").attr("onclick", "location='../login'")
		openModal(2);
		return;
	}
}

//댓글 쓰기 메서드
function writeReply(b_num, u_id) {
	r_content = $("#r_content").val();
	
	if(!r_content) { //입력내용이 없으면 Modal.show 후 return으로 댓글입력 생략
		$("#modal2_title").text("댓글 작성");
		$("#modal2-body-text").text("댓글내용을 입력해야 합니다.");
		$("#modal2-btn").attr("onclick", "closeModal(2)");
		openModal(2);
		return;
	}
	
	$.ajax({
		type : 'POST',
		url : "writeReply",
		data : {
			"r_writer": u_id,
			"r_content" : r_content,
			"b_num": b_num
		},
		
		beforeSend : function(request){
			request.setRequestHeader("AJAX", "true");
		},
		
		success : function() {
			console.log("success : ");
			selectReply(); //댓글 입력 후 댓글 다시 조회
			$("#r_content").val("");
		},
		
		error : function(request) {
			if(request.status == 500) {
				alert('현재 게시글이 존재하지않습니다.');
				location.href="../index";
			} else {
				location.href="../login";
			}
			
		}
		
	});
	
}

//댓글 삭제확인 Modal.show 
function deleteReplyCheck(r_num) {
	$("#modal1-btn").attr("onclick", "deleteReply("+ r_num +")");
	openModal(1);
}
//댓글 삭제 메서드
function deleteReply(r_num) {
	$.ajax({
		type : 'POST',
		url : "deleteReply",
		data : {
			"r_num": r_num
		},
		beforeSend : function(request){
			request.setRequestHeader("AJAX", "true");
		},
		
		
		success : function(result) {
			selectReply(); // 댓글 삭제 후 댓글 다시 조회
			closeModal(1);
		},
		
		error : function(request) {
			if(request.status == 500) {
				alert('현재 게시글이 존재하지않습니다.');
				location.href="../index";
			} else {
				location.href="../login";
			}
		}
		
	});
}

function openModal(n) {
	$("#myModal" + n).modal("show");
}
function closeModal(n) {
	$("#myModal" + n).modal("hide");
}
