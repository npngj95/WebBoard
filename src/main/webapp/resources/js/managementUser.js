
$(document).ready(function() {
	
	var flag = true;

	$("#checkAll").click(function() {
			
			if(flag) {
				$("input:checkbox[name=u_idList]").prop("checked", true);
				flag = false;
			} else {
				$("input:checkbox[name=u_idList]").prop("checked", false);
				flag = true;
			}
			
	});
	
	$("#deleteUser").click(function() {
		if($("input:checkbox[name=u_idList]:checked").length == 0) {
			alert("선택된 유저가 없습니다");
		} else {
			document.managementUser.submit();
		}
	})
	
	
});