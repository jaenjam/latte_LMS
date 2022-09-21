<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- header.jsp -->
	<c:import url="/WEB-INF/template/header.jsp"></c:import>
	<!-- sidebar.jsp -->
	<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>
	
	
	<form action="${pageContext.request.contextPath}/addProfessorImg"
		method="post" enctype="multipart/form-data">
		<fieldset>
			<table class="table table-bordered">
				<tr>
					<th>교수사번</th>
					<td><input type="text" class="form-control" name="professorNo"
						id="professorNo" readonly="readonly" value="${No}"></td>
				</tr>
				<tr>
					<td>이미지파일</td>
					<td><input type="file" name="imgFile"></td>
				</tr>
			</table>
			<button type="submit" id="btn">이미지등록</button>
		</fieldset>
	</form>

</body>
</html>