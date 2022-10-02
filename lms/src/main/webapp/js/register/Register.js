

$(document).ready(function() {
		// 문서 시작되면 바로 기능 준비할거양

	// 학점이 select되면
    $('#subjectcredit').change(function() {
	// getRegisterForm 의 해당 id="" 값이 변경하면
	// 밑에 ┌ '이거' 실행할거다?
        getSubjectName(this.value);
        //				└>>> VIEW단의 OPTION VALUE 가져온다는 소리
    });
    
    
    // view단의 담기 버튼 누르면
    $('#addReigisterCart').click(function() {
		console.log("눌림?");
    	alert('장바구니에 담습니다!');
    	addRegisterCart(this.value);
    });
});


// ┌ '이거' 가 뭔지 정의하기
function getSubjectName(subjectCredit) {
    $.ajax({
        url: '/api/register/get/subjectName/' + subjectCredit, // apiController와 통신할 주소는 여기야()
        type: "GET",
        contentType: 'application/json',

        success: function (data) { //결과성공 콜백함수
            let subjectList = $("#subjectList");
            subjectList.empty();
            // └ 가져올 리스트 초기화로 비워주기 (for문 돌리니까)
            for(let i = 0; i<data.length; i++){
	
					//		┌ 다 가져와서 재정의 하려고 append 쓰는거야
                subjectList.append("<li>" + "<input onclick='run(this.id)' class=\"subject\" type=\"checkbox\" id=\"chk\" name=\"chk\">"
                    + "<p class=\"idbirth_p\" name=\"idbirth_n\" id=\"idbirth_i\"value=\"idbirth_v\">" 
                    + " 과목명: "+  data[i].subject.subjectName 
                    + "　전공여부: " +data[i].subject.subjectMajor
                    +  "　/　요일: " + data[i].day
                    +  "　/　교시: " + data[i].startTime + "~" + data[i].endTime
                    +  "　/　담당교수: " + data[i].professor.professorName
                    +  " </p></li>");
           
           console.log(data[i])
            }
        },
        error: function (request, status, error) { // 결과에러 콜백함수
        	console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
            alert("과목을 불러올 수 없습니다!");
        }
    });
} // getSubjectName function end




	

function addRegisterCart() {
	console.log("들어옴?")
	var subjectCk = [];
	
	// 이름이 chk 중 체크된거 위에 선언한 객체에 담을거야
	$("input[name='chk']:checked").each(function(i){
		console.log("맞음?")
		
		var registerCart = $(idbirth_i).val();
		
		// console.log(subjectList) // 이건 empty로 선언해서 비어있어
		//console.log(idbirth_n)
		console.log(idbirth_i)
		//console.log(idbirth_v)
		
		console.log("?????"+registerCart)
	

}
)};
