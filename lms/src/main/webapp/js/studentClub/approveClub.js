function approveClub(no){
	
	let con = confirm("가입을 승인하시겠습니까?");
	
	
	let professorNo = document.getElementById("professor"+no).value;
	let studentNo = document.getElementById("student"+no).value;
	let clubNo = document.getElementById("club"+no).value;
	
	console.log(no);
	console.log(studentNo);
	console.log(clubNo);
	console.log(professorNo);
	
	
	
	
	if(con){
		location.href = "/professorClubList?studentNo="+studentNo+"&clubNo="+clubNo+"&professorNo="+professorNo;
	}else{
		
	}
 }