$(document).ready(function () {
	$(".submit_form").on('submit',function f() {
		let con = confirm("장학을 변경하시겠습니까?");
		return con;
	})
});

