function updateEmployeeStatus(no){
	
	let con = confirm("재직상태를 변경하시겠습니까?");
	
	if(con){
		//확인버튼 눌렀을때
		document.getElementById("updateEmployeeStatus"+no).submit();
	}else{
		
	}
}