
var isPass = [false, false];


function updatePwd() {
	return (isPass[0] && isPass[1]);
}

//비밀번호 유효성 검사
function pwdCheck() {
	var u_pwd = $("#u_pwd").val();
	var pwd = RegExp(/^[a-z0-9]+$/);
	var target = $(event.target);
	
	if(!pwd.test(u_pwd) || (u_pwd.length < 6 || u_pwd.length > 20)) {
		target.next().text("6~20자의 영문 소문자와 숫자의 사용 가능합니다.");
		isPass[0] = false;
    }else{
    	target.next().text("");
    	isPass[0] = true;
    }
	
	blankCheck();
}

//비밀번호 & 비밀번호 확인 일치 검사
function isSame(){
	var pwd = $("#u_pwd").val();
	var pwd2 = $("#u_pwd2").val();
	
	if(pwd != pwd2){
        $("#alertPwd2").text("비밀번호가 일치하지 않습니다.");
    	isPass[1] = false;
    }else{
        $("#alertPwd2").text("");
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

//CapsLock 체크
function capslock(e){
	var keyCode = 0;
	var shirftKey = false;
	var target = $(event.target);
	
	keyCode = e.keyCode;
	shiftKey = e.shiftKey;
	
	if(((keyCode >= 65 && keyCode <90) && !shiftKey) || ((keyCode >= 97 && keyCode <= 122) && shiftKey)){
		target.next().text("CapsLock이 걸려있습니다.");
	}else{
		target.next().text("");
	}
}