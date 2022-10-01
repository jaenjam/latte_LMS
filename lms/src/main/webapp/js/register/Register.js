

$(document).ready(function() {
		// 

    $('#credit').change(function() {
	// getRegisterForm 의 해당 id="" 값이 변경하면
	// 밑에 이거 실행
        getSubjectName(this.value);
        //				>>> VIEW단의 OPTION VALUE 가져온다는 소리
    });
});

// '이거' 가 뭔지 정의하기
function getSubjectName(subjectCredit) {
    $.ajax({
        url: '/api/register/get/subjectName' + subjectCredit,
        type: "GET",
        contentType: 'application/json',
        success: function (data) {
            console.log(data);
            for(let i = 0; i<data.length; i++){
                console.log("i start");
                let map = data[i];
                console.log(map);
                $('#clubContent').val(map.clubContent);
                $('#professorNo').val(map.professorName);

            }
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });
}