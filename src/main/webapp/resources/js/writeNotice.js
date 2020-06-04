// summernote
$(document).ready(function() {
    $("#b_content").summernote({
    	lang: 'ko-KR', // default: 'en-US'
    	tabsize: 2,
        height: 400
    });
});

// textarea 공란 체크
function empCheck() {
	if(!emailCheck()) {
		return false;
	}
	
	if($("#b_content").summernote("isEmpty")) {
		alert("내용을 입력해주세요.");
		return false;
	}
	
	return true;
}

// E-mail 유효성 검사
function emailCheck(){
	var b_email = $("#b_email").val();
	var email = RegExp(/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/);
	
	if(!email.test(b_email)) {
		alert("이메일 양식에 맞게 입력하세요");
		return false;
    } else {
    	return true;
    }
}