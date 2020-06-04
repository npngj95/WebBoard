$(document).ready(function() {
    $('#b_content').summernote({
    	lang: 'ko-KR', // default: 'en-US'
    	tabsize: 2,
        height: 400
    });
});

function empCheck() {
	if($('#b_content').summernote('isEmpty')) {
		alert('내용을 입력해주세요.');
		return false;
	}
	
	return true;
}