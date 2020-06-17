var isPass = [true, true];

function updateUser() {
	return (isPass[0] && isPass[1]);
}

//사용자명 유효성 검사
function nameCheck(){
	var u_name = $("#u_name").val();
	var name = RegExp(/^[가-힣]+$/);
	
	if(!name.test(u_name)) {
		 $("#alertName").text("띄어쓰기 없이 이름을 입력해주세요.");
		 isPass[0] = false;
    }else{
        $("#alertName").text("");
        isPass[0] = true;
    }
	
	blankCheck();
}

//E-mail 유효성 검사
function emailCheck(){
	var u_email = $("#u_email").val();
	var email = RegExp(/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/);
	
	if(!email.test(u_email)) {
		 $("#alertEmail").text("이메일 양식에 맞게 입력해주세요.");
		 isPass[1] = false;
    }else{
        $("#alertEmail").text("");
        isPass[1] = true;
    }
	
	blankCheck();
}

//입력값 공란 체크
function blankCheck(){
	var target = $(event.target);
	
    if(!target.val()){
    	target.next().text("필수정보입니다.");
    }
}