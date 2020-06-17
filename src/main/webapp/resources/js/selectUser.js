function openModal(path) {
	$("#path").val(path);
	$("#myModal1").modal("show");
}


function pwdCheck() {
	u_id = $("#u_id").val();
	u_pwd = $("#u_pwd").val();
	path = $("#path").val();
	
	$.ajax({
		 
		type : 'POST',
		url : "userCheck",
		data : {
			"u_id": u_id,
			"u_pwd":u_pwd
		},
		// dataType : 서버측에서 전송받은 데이터의 형식 (default : xml, json, script, text, html)
		
		success : function(result) {
			if(result < 1) {
				$("#alertPwd").text("비밀번호가 맞지 않습니다.")
			}
			else {
				location= path + "?u_id=" + u_id;
			}
		}
	});	
	
}