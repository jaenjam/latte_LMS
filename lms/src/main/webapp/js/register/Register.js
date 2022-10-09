

$(document).ready(function() {
		// 문서 시작되면 바로 기능 준비할거양
		
	getMyRegisterCart();

	// 학점이 select되면
    $('#subjectcredit').change(function() {
	// getRegisterForm 의 해당 id="" 값이 변경하면
	// 밑에 ┌ '이거' 실행할거다?
        getSubjectName(this.value);
        //				└>>> VIEW단의 OPTION VALUE 가져온다는 소리
    });
    
    
    // view단의 담기 버튼 누르면
    $('#addRegisterCart').click(function() {
		console.log("눌림?");
    	alert('장바구니에 담습니다!');
    	addRegisterCart();
    });
    
    
    // 삭제버튼 누르면
    $('#deleteRegisterCart').click(function() {
		console.log("삭제버튼눌림?");
		var result = confirm('정말 삭제하시겠습니까?');
		if(result) { // ㅇㅋ 누르면
			console.log("result : " + result);
			deleteRegisterCart();
		
		} else {
			console.log("result : " + result);
		}
	});
	
	
	// 수강신청하기버튼 누르면
	$('#addRegister').click(function(){
		console.log("수강신청하기버튼눌림?");
		var result = confirm('정말 수강신청하시겠습니까?');
		if(result) { // ㅇㅋ 누르면
			console.log("result : " + result);
			addRegister();
		} else {
			console.log("result : " + result);
		}
	})
	
	
});


// 바로 불러올 하단의 나의 수강바구니
function getMyRegisterCart() {
	

	
	$.ajax({
		url:'/api/register/get/MyRegisterCart', 
		type: "GET",
		contentType: 'application/json',
		success: function(data) {
			for(let i = 0; i<data.length; i++){
				console.log(data[i])
				
				let RegisteCartList = $("#RegisteCartList");
       			let li = document.createElement("li");
	       			li.innerHTML = "<input  class=\"myCart\" type=\"checkbox\" name=\"chk\" value=\""
	                	+ data[i].subject_approve_no
	                	+ "\">"
	                	 + "<p class=\"idbirth_p\" name=\"idbirth_n\" id=\"idbirth_"+i+"\">" 
	                    + " 과목명: "+  data[i].subject_name 
	                    + "　전공여부: " +data[i].subject_major
	                    +  "　/　요일: " + data[i].day
	                    +  "　/　교시: " + data[i].start_time + "~" + data[i].end_time
	                    +  "　/　담당교수: " + data[i].professor_name
	                    +  " </p>";

					//		┌ 다 가져와서 재정의 하려고 append 쓰는거야
                RegisteCartList.append(li);
           
           		console.log(li)           		
				
				
            }
		}
	})
}


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
                subjectList.append("<li>" + "<input onclick='run(this.id)' class=\"subject\" type=\"checkbox\" id=\"chk\" name=\"chk\" value=\""
                	+ data[i].subjectApproveNo
                	+ "\">"
                    + "<p class=\"idbirth_p\" name=\"idbirth_n\" id=\"idbirth_"+i+"\">" 
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




	
// 장바구니에 담기
function addRegisterCart() {

	$("input:checkbox[class='subject']").each(function(i){
		if($(this).is(":checked") == true){
			let inputThis = $(this);
			let subjectApproveNo = $(this).val();
			let info = $(this).parent().children("p")[0].cloneNode(true);
			$.ajax({	
		        url: '/api/register/add/registerCart/' + subjectApproveNo, // apiController와 통신할 주소는 여기야()
		        type: "POST",
		        contentType: 'application/json',
		
		        success: function (data) { //결과성공 콜백함수
		            let RegisteCartList = $("#RegisteCartList");
		       			let li = document.createElement("li");
		       			li.innerHTML = "<input  class=\"myCart\" type=\"checkbox\" name=\"chk\" value=\""
		                	+ subjectApproveNo
		                	+ "\">";
		                console.log(info);
		            	li.appendChild(info);
			
							//		┌ 다 가져와서 재정의 하려고 append 쓰는거야
		                RegisteCartList.append(li);
		           
		           		console.log(li)
		           		inputThis.prop("checked", true);
		            
		        },
		        error: function (request, status, error) { // 결과에러 콜백함수
		        	console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error)
		            alert("이미 담겨있는 과목입니다!");
		        }
		    });
		}
	})
	console.log(a)
};


// 장바구니에서 삭제하기
function deleteRegisterCart() {
	
	$("input:checkbox[class='myCart']").each(function(i){
		if($(this).is(":checked") == true){
			let inputThis = $(this);
			let subjectApproveNo = $(this).val();
			let info = $(this).parent().children("p")[0].cloneNode(true);
			$.ajax({
				 url: '/api/register/delete/registerCart/' + subjectApproveNo, // apiController와 통신할 주소는 여기야()
				 type: "POST",
				 contentType: 'application/json',
				 
				 success: function () {
					inputThis.parent("li").remove();
				}
				
			})
		}
	});
	
}




// 수강신청하기
function addRegister() {
	$("input:checkbox[class='myCart']").each(function(i){
		if($(this).is(":checked") == true){
			let inputThis = $(this);
			let subjectApproveNo = $(this).val();
			let info = $(this).parent().children("p")[0].cloneNode(true);
	$.ajax({
		url :'/api/register/add/register/' + subjectApproveNo,
		type: "POST",
		contentType: 'application/json',
		
		success: function() {
			inputThis.parent("li").remove();
			}
		})
		
		}
	});
}
