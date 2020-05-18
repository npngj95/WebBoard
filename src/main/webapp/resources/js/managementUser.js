$(document).ready(function() {
	
	var flag = true;
	$("#checkAll").click(function() {
		var checkLength = $("input:checkbox[name=userCheck]").legnth;

			if(flag) {
				$("input:checkbox[name=userCheck]").prop("checked", true);
				flag = false;
			} else {
				$("input:checkbox[name=userCheck]").prop("checked", false);
				flag = true;
			}
			
	});
	
	$("#deleteUser").click(function() {
		document.managementUser.submit();
	});
	
	
});
