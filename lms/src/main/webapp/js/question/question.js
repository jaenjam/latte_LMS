function question(){
	
	var con = confirm("답글을 입력하시겠습니까?");
	
	
	if(con){
		//확인 버튼 클릭 true
		$('#addAnswer').submit();	
	}else{
		//취소 버튼 클릭 false
	}
	 //alert("답글을 입력하시겠습니까?");
 
 };