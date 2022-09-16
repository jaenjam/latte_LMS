<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<h2>관리자 정보확인</h2>
<table border="1">
		<tr>
			<th>사번</th>
			<th>이름</th>
			<th>주민번호</th>
			<th>나이</th>
			<th>성별</th>
			<th>전화번호</th>
			<th>이메일</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>재직상태</th>
			<th>관리자상태</th>
			<th>연봉등급</th>
		</tr>
		
		<c:forEach var="e" items="${employeeList}">
		<tr>
		<td>${e.employeeNo}</td>
		<td>${e.employeeName}</td>
		<td>${e.employeeRegiNo}</td>
		<td>${e.employeeAge}</td>
		<td>${e.employeeGender}</td>
		<td>${e.employeeTelephone}</td>
		<td>${e.employeeEmail}</td>
		<td>${e.employeeAddress}</td>
		<td>${e.employeeDetailAddress}</td>
		<td>${e.employeeState}</td>
		<td>${e.employeeActive}</td>
		<td>${e.salaryNo}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>