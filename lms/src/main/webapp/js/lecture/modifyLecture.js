
// 인풋된 파일 밸류값이 변하면 바로 시작
$(document).ready(function(){	
	
	$('#newfile').change(function(){
		
		// 이 함수 실행시킬래
		showfileName();
	})
	
});	
	
function showfileName() {
	
	// 새로 변수선언 할건데 인풋타입 file에 올라왔던 그거
	var name = $('#newfile').val();
	
	name = name.substring(name.lastIndexOf("\\")+1);
	
	$("#filename").text(name);
}