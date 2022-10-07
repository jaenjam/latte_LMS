

// 문서끝나면 수정버튼 누르면 시작
$(document).on('click', "#modify" , function(e){
	
	// 데이터 담을건데 이름은 이래
	const studentSubmitCk = $("#studentSubmitCk").val();
	const score = $("#score").val();
	const pfHomeworkNo = $("input:hidden[name=pfHomeworkNo]").val();
	
	// 찍혔나 확인
	console.log("studentSubmitCk :"  + studentSubmitCk);
	console.log("score : " + score);
	console.log("pfHomeworkNo : " + pfHomeworkNo);
	// 수정시
	if(score == "") {// 아무것도 입력 안하면
		alert("점수를 입력해주세요!");
		return;
	}
	
	// ajax 통신을 위해 formData의 데이터 객체를 생성함
	
	var formData = new FormData();
	formData.append("studentSubmitCk",  '"'+studentSubmitCk+'"');
	formData.append("score", score);
	formData.append("pfHomeworkNo", pfHomeworkNo);
	// 이것도 있는데 밑에처럼 해보자 밑에걸 더 많이봄
	
	//var formData = {"studentSubmitCk": studentSubmitCk
	//,"score": score 
	//,"pfHomeworkNo" : pfHomeworkNo };
	
	
	console.log("formData : " + formData);
	
	// ajax 파일전송 보내기 위해
	
	$.ajax({
		anyne : true,
		type : "post",
		url : "/api/notstudent/modify/studentLectureHomeworkStuList/" ,
		contentType : "application/json; charset=UTF-8",
		data : formData,
		dataType : "JASON",
		contentType: false, 
		processData: false,
		success : function(result) {			
			alert("수정을 완료했습니다.");
			location.href = "/lecture/nonStudnet/getlectureHomeworkStuList";
			}		
	});
	
});