

$(document).ready(function() {
		// 

    $('#subjectcredit').change(function() {
	// getRegisterForm 의 해당 id="" 값이 변경하면
	// 밑에 ┌ '이거' 실행
        getSubjectName(this.value);
        //				>>> VIEW단의 OPTION VALUE 가져온다는 소리
    });
});

// ┌ '이거' 가 뭔지 정의하기
function getSubjectName(subjectCredit) {
    $.ajax({
        url: '/api/register/get/subjectName/' + subjectCredit,
        type: "GET",
        contentType: 'application/json',

        success: function (data) { //결과성공 콜백함수
            let subjectList = $("#subjectList");
            subjectList.empty();
            for(let i = 0; i<data.length; i++){

                subjectList.append("<li>" + "<input onclick='run(this.id)' class=\"subject\" type=\"checkbox\" id=\"chk\">"
                    + "<p class=\"idbirth_p\">" +  data[i].subject.subjectName + "</p></li>");
            }
        },
        error: function (request, status, error) { // 결과에러 콜백함수
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}