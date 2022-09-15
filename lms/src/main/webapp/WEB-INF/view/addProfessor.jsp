<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Professor Login</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<form action="${pageContext.request.contextPath}/addProfessor" method="post">

	<h1> addProfessor </h1>

	<table border="1">
		<tr>
			<td> 
				id: <input type="text" name="professorNo" id="professorNo">
		 	</td>
		 </tr>
		<tr>
			<td> 
				pw: <input type="password" name="professorPass" id="professorPass">
			</td>
		</tr>		
	</table>	
	<button type="button" id="loginBtn"> LOGIN </button>
	<a href=""> SIGN IN </a>

</form>
</body>
<script>
	$('#loginBtn').click(function(){
	    if($('#loginId').val() == '') {
	       alert('아이디를 입력해주세요!');
	    } else if($('#loginPw').val() == '') {
	       alert('패스워드를 입력해주세요!');
	    } else {
	       loginForm.submit();
	    }
	 });
</script>
</body>
</html>