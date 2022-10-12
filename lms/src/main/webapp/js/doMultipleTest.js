function answerSubmit() {

    let studentNo = $('#student_no').val();
    for(let i = 0; i<40; i+=4){
        let randomInt = Math.random();
        let multipleQuestionNo = $('#multiple_question_no_'+i).val();
        let radio = $('input[name=answer_radio'+i+']:checked').val();

        console.log("multipleQuestionNo : "+multipleQuestionNo +" studentNo : "+studentNo+" radio : "+radio);

        $.ajax({
            url: '/api/test/create/testAnswer/' + multipleQuestionNo+'/'+studentNo+'/'+radio,
            type: "GET",
            contentType: 'application/json',
            success: function (data) {
                if(i == 36){
                    successAlert();
                }

            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });

    }

}

function successAlert() {
    alert("시험 응시가 완료 되었습니다.");
    location.href = "/test/doTest"
}

