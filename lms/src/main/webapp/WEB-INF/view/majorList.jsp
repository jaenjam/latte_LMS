<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MajorList</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>학과코드</th>
			<th>학과명</th>
			<th>학과방</th>
		</tr>
		<c:forEach var="C" items="${majorList}">
		<tr>
			<td>${C.majorNo}</td>
			<td>${C.majorName}</td>
			<td>${C.majorRoom}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>