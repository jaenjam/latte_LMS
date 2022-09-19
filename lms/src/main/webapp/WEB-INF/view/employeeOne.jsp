<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/employeeOne?employeeNo=${employeeNo}">

<table border="1">
<tbody>
				<tr>
					<th>사번</th>
					<td>${e.employeeNo}</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${e.employeePass}</td>
				</tr>
				<tr>
					<th>주민번호</th>
					<td>${e.employeeRegiNo}</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>${e.employeeAge}</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${e.employeeGender}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${e.employeeTelephone}</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${e.employeeEmail}</td>
				</tr>
				<tr>
					<th>사진</th>
					<td></td>
				</tr>		

			</tbody>
			</table>
</form>

</body>
</html>