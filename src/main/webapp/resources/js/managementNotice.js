$(document).ready(function() {
	
	$('.toggleButton').each(function(index, item) {
		$(item).click(function() {
			$('.toggleContent' + index).slideToggle();
		});
	});
	
	var flag = true;
	$("#checkAll").click(function() {
		var checkLength = $("input:checkbox[name=noticeCheck]").legnth;

			if(flag) {
				$("input:checkbox[name=noticeCheck]").prop("checked", true);
				flag = false;
			} else {
				$("input:checkbox[name=noticeCheck]").prop("checked", false);
				flag = true;
			}
			
	});
	
	$("#deleteNotice").click(function() {
		document.managementNotice.submit();
	});
	
	
});
