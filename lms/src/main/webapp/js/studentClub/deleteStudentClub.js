function deleteStudentClub(no){
	
	let con = confirm("가입 취소 하시겠습니까?");

	let studentNo = document.getElementById("student"+no).value;
	let clubNo = document.getElementById("club"+no).value;

	console.log(no);
	console.log(studentNo);
	console.log(clubNo);

	if(con){
		location.href = "/studentClubList?studentNo="+studentNo+"&clubNo="+clubNo
	}else{
		
	}
 }