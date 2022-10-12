$(document).ready(function () {
	$(".submit_form").on('submit',function f() {
		let con = confirm("강의를 신청하시겠습니까?");
		return con;
	})
});

