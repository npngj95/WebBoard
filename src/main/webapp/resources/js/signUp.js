
var isPass = [false, false, false, false, false];


function signUp() {
	idCheck();
	
	// 로딩 표시
	if(isPass[0] && isPass[1] && isPass[2] && isPass[3] && isPass[4]) {
		$(":submit").after($('<div>', {
			class : 'spinner-border text-info btn-block',
			html : '<span class="sr-only">Loading...</span>'
		}));
		$(":submit").after($('<br>'));
		$(":submit").remove();
	}
	
	return (isPass[0] && isPass[1] && isPass[2] && isPass[3] && isPass[4]);
}

// 아이디 유효성 검사
function idCheck(){
	var u_id = $("#u_id").val();
	var id = RegExp(/^[a-z0-9]+$/);
	
	// 사용불가능한 아이디일 때, 폰트 컬러 초기화(빨강)  
	$("#alertId").css("color", "red");
	
	if(!id.test(u_id) || (u_id.length < 6 || u_id.length > 20)) {	
		$("#alertId").text("아이디는 6~20자의 영문 소문자와 숫자로 작성해주세요.");
	}else{
		$.ajax({
			type : 'POST',
			url : "idCheck",
			data : {"u_id": u_id},
			
			success : function(result) {
				if(result == 1) {
					$("#alertId").text("같은 아이디가 존재합니다.");
					isPass[0] = false;
				}
				else {
					// 사용가능한 아이디일 때, 폰트 컬러 지정(초록색)  
					$("#alertId").css("color", "#03C75A");
					$("#alertId").text("사용가능한 아이디입니다.");
					isPass[0] = true;
				}
			}
		});
	}
	
	blankCheck();
}

//사용자명 유효성 검사
function nameCheck(){
	var u_name = $("#u_name").val();
	var name = RegExp(/^[가-힣]+$/);
	
	if(!name.test(u_name)) {
		 $("#alertName").text("띄어쓰기 없이 이름을 입력해주세요.");
		 isPass[1] = false;
    }else{
        $("#alertName").text("");
        isPass[1] = true;
    }
	
	blankCheck();
}

//E-mail 유효성 검사
function emailCheck(){
	var u_email = $("#u_email").val();
	var email = RegExp(/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/);
	
	if(!email.test(u_email)) {
		 $("#alertEmail").text("이메일 양식에 맞게 입력해주세요.");
		 isPass[2] = false;
    }else{
        $("#alertEmail").text("");
        isPass[2] = true;
    }
	
	blankCheck();
}

//비밀번호 유효성 검사
function pwdCheck() {
	var u_pwd = $("#u_pwd").val();
	var pwd = RegExp(/^[a-z0-9]+$/);
	var target = $(event.target);
	
	if(!pwd.test(u_pwd) || (u_pwd.length < 6 || u_pwd.length > 20)) {
		target.next().text("6~20자의 영문 소문자와 숫자의 사용 가능합니다.");
		isPass[3] = false;
    }else{
    	target.next().text("");
    	isPass[3] = true;
    }
	
	blankCheck();
}

//비밀번호 & 비밀번호 확인 일치 검사
function isSame(){
	var pwd = $("#u_pwd").val();
	var pwd2 = $("#u_pwd2").val();
	
	if(pwd != pwd2){
        $("#alertPwd2").text("비밀번호가 일치하지 않습니다.");
    	isPass[4] = false;
    }else{
        $("#alertPwd2").text("");
        isPass[4] = true;
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