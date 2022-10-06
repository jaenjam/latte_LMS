function approveClub(){
	
	let con = confirm("가입을 승인하시겠습니까?");
	
	let studentNo = document.getElementById("student"+no).value;
	let clubNo = document.getElementById("club"+no).value;
	
	if(con){
		//확인 버튼 클릭 true
		$('#approve').submit();	
	}else{
		
		
	}
	
 
 };