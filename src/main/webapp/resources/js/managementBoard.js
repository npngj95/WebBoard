$(document).ready(function() {
	
	var flag = true;
	$("#checkAll").click(function() {
		
			if(flag) {
				$("input:checkbox[name=boardCheck]").prop("checked", true);
				flag = false;
			} else {
				$("input:checkbox[name=boardCheck]").prop("checked", false);
				flag = true;
			}
			
	});
	
	$("#deleteBoard").click(function() {
		document.managementBoard.submit();
	});
	
});
