function nullCheck() {

    //null check
    for(let k = 1; k<11; k++){
        let txtEle = $('.test_table'+ k +'input[type=text]');
        let radio = $('input[name=answer_radio'+k+']:checked').val();
        if("" == radio || null == radio){
            alert(k+"번 문제가 제대로 출제 되지 않았습니다.");
            return;
        }
        for (let i = 0; i < txtEle.length; i++) {
            if ("" == $(txtEle[i]).val() || null == $(txtEle[i]).val()) {
                alert(k+"번 문제가 제대로 출제 되지 않았습니다.");
                return;
            }
        }
    }

    creatTest()
}



function creatTest() {

    let testName = $('#testName').val().toString();
    let subjectApproveNo = $('#approveNo').val();

    console.log(subjectApproveNo +" "+testName);


    $.ajax({
        url: '/api/test/create/test/' + subjectApproveNo+'/'+testName,
        type: "GET",
        contentType: 'application/json',
        success: function (data) {
            createMultipleTest(data);
        },
        error: function (request, status, error) {
            alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
        }
    });

}

function createMultipleTest(testNo) {
    console.log("testNo :"+testNo);

    for(let i = 1 ; i<11; i++){
        let question = document.getElementById("multipleChoiceQuestion"+i).value;
        let radio = $('input[name=answer_radio'+i+']:checked').val();

        console.log("순번 : " + question +"  " + radio);

       $.ajax({
            url: '/api/test/create/MultipleTest/' + testNo+'/'+question + '/'+radio,
            type: "GET",
            contentType: 'application/json',
            success: function (data) {
                createMultipleTestExample(data, i);
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }
}

function createMultipleTestExample(MultiPleTestNo, index) {
    console.log(index+"번문제 보기 만들기 시작");
    for(let i = 1 ; i<5; i++){

        let nowExample = $('#multipleChoiceExample'+i+'_'+index).val();
        $.ajax({
            url: '/api/test/create/MultipleTestExample/' + MultiPleTestNo+'/'+i + '/'+nowExample,
            type: "GET",
            contentType: 'application/json',
            success: function (data) {

            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                return;
            }
        });
    }

}
