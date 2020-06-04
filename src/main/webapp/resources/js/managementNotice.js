$(document).ready(function() {
	
	$('.toggleButton').each(function(index, item) {
		$(item).click(function() {
			$('.toggleContent' + index).slideToggle();
		});
	});
	
	var flag = true;
	$("#checkAll").click(function() {

			if(flag) {
				$("input:checkbox[name=b_numList]").prop("checked", true);
				flag = false;
			} else {
				$("input:checkbox[name=b_numList]").prop("checked", false);
				flag = true;
			}
			
	});
	
	$("#deleteNotice").click(function() {
		if($("input:checkbox[name=b_numList]:checked").length == 0) {
			alert("선택된 공지글이 없습니다");
		} else {
			document.managementNotice.submit();
		}
	})
	
});
