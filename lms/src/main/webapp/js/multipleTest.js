let multipleTest = 0;
let multipleTestExample = 0;

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

    for(let i = 1 ; i<11; i++){
        let question = document.getElementById("multipleChoiceQuestion"+i).value;
        let radio = $('input[name=answer_radio'+i+']:checked').val();


       $.ajax({
            url: '/api/test/create/MultipleTest/' + testNo+'/'+question + '/'+radio,
            type: "GET",
            contentType: 'application/json',
            success: function (data) {
                multipleTest++;
                console.log("multipleTest : " + multipleTest);
                createMultipleTestExample(data, i);
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }
}

function createMultipleTestExample(MultiPleTestNo, index) {
    for(let i = 1 ; i<5; i++){
        let nowExample = $('#multipleChoiceExample'+i+'_'+index).val();
        $.ajax({
            url: '/api/test/create/MultipleTestExample/' + MultiPleTestNo+'/'+i + '/'+nowExample,
            type: "GET",
            contentType: 'application/json',
            success: function (data) {
                multipleTestExample++;
                console.log("multipleTestExample : " + multipleTestExample);
                if(multipleTestExample == 40){
                    successAlert();
                }
            },
            error: function (request, status, error) {
                alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                return;
            }
        });
    }
}


function successAlert() {
    alert("문제가 출제 되었습니다.");
    location.href = "/test/testList"
}
