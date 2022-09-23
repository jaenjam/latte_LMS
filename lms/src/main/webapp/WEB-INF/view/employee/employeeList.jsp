<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<style>
.btn {
	float: right;
	line-height: 18px;
}
</style>

<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body">

	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)">관리자 페이지</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">직원
						관리</a></li>
			</ol>
		</div>
	</div>
	<!-- row -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-sm-9">
								<h4 class="card-title">직원 관리</h4>
							</div>
							<div class="col-sm-3">
								<c:if test="${employeeActive eq '총관리자'}">
									<a href="/employee/modifyEmployeeList">
										<button type="button" class="btn btn-primary">수정하기</button>
									</a>
								</c:if>
							</div>
						</div>
						<br>
						<div class="table-responsive">
							<c:if test="${employeeActive eq '총관리자'}">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>사번</th>
											<th>직급</th>
											<th>이름</th>
											<th>주민번호</th>
											<th>나이</th>
											<th>성별</th>
											<th>전화번호</th>
											<th>이메일</th>
											<th>주소</th>
											<th>상세주소</th>
											<th>재직상태</th>
											<th>연봉등급</th>
											<th>입사일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="e" items="${employeeList}">
											<tr>
												<td>${e.employeeNo}</td>
												<td>${e.employeeActive}</td>
												<td>${e.employeeName}</td>
												<td>${e.employeeRegiNo}</td>
												<td>${e.employeeAge}</td>
												<td>${e.employeeGender}</td>
												<td>${e.employeeTelephone}</td>
												<td>${e.employeeEmail}</td>
												<td>${e.employeeAddress}</td>
												<td>${e.employeeDetailAddress}</td>
												<td>${e.employeeState}</td>
												<td>${e.salaryNo}</td>
												<td>${e.createDate}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
						</div>
						<div class="table-responsive">
							<c:if test="${employeeActive ne '총관리자'}">
								<table class="table table-hover">
									<thead>
										<tr>
											<th>사번</th>
											<th>직급</th>
											<th>이름</th>
											<th>주민번호</th>
											<th>나이</th>
											<th>성별</th>
											<th>전화번호</th>
											<th>이메일</th>
											<th>주소</th>
											<th>상세주소</th>
											<th>재직상태</th>
											<th>입사일</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="e" items="${employeeList}">
											<tr>
												<td>${e.employeeNo}</td>
												<td>${e.employeeActive}</td>
												<td>${e.employeeName}</td>
												<td>${e.employeeRegiNo}</td>
												<td>${e.employeeAge}</td>
												<td>${e.employeeGender}</td>
												<td>${e.employeeTelephone}</td>
												<td>${e.employeeEmail}</td>
												<td>${e.employeeAddress}</td>
												<td>${e.employeeDetailAddress}</td>
												<td>${e.employeeState}</td>
												<td>${e.createDate}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</c:if>
						</div>



					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<!-- #/ container -->

<!--**********************************
            Content body end
        ***********************************-->


<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>
