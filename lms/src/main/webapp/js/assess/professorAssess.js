
// 별점선택 이벤트 리스너

document.addEventListener('DOMContentLoaded', function(){

    document.querySelector('.rating').addEventListener('click',function(e){
        let elem = e.target;
        if(elem.classList.contains('rate_radio')){
            rating.setRate(parseInt(elem.value));
            console.log("찍어보라고하심" +elem.value);
            document.querySelector('#rate').value = parseInt(elem.value);
        }
    })

	//상품평 작성 글자수 초과 체크 이벤트 리스너
	document.querySelector('.form-control').addEventListener('keydown',function(){
	    //리뷰 400자 초과 안되게 자동 자름
	    let review = document.querySelector('.form-control');
	    let lengthCheckEx = /^.{400,}$/;
	    if(lengthCheckEx.test(review.value)){
	        //400자 초과 컷
	        review.value = review.value.substr(0,400);
	    }
	});



	//저장 전송전 필드 체크 이벤트 리스너
	document.querySelector('#save').addEventListener('click', function(e){
	    
	    if(rating.rate == 0){//별점 선택 안했으면 메시지 표시
	        rating.showMessage('rate');
	        console.log("별점X");
	        return false;
	    } else {
	    	console.log("전부 작성완료");
	    	$('#reviewform').submit();
	    	
	    }
	    //폼 서밋
	    alert("저장완료!");
	    rating.setRate(0);
	    document.querySelector('.form-control').value = '';
	});
});


//별점 마킹 모듈 프로토타입으로 생성
function Rating(){};
Rating.prototype.rate = 0;
Rating.prototype.setRate = function(newrate){
    //별점 마킹 - 클릭한 별 이하 모든 별 체크 처리
    this.rate = newrate;
    let items = document.querySelectorAll('.rate_radio');
    items.forEach(function(item, idx){
        if(idx < newrate){
            item.checked = true;
        }else{
            item.checked = false;
        }
    });
}




let rating = new Rating();//별점 인스턴스 생성


