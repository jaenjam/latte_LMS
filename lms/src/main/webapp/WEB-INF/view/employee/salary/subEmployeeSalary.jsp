<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/salary/subEmployeeSalary.js"></script>

<style>
.btn {
	float: right;
	line-height: 18px;
}

.table {
	white-space: nowrap;
}
</style>

<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body">

	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(4)">연봉관리</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">서브관리자</a></li>
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
								<h4 class="card-title">서브관리자 연봉변경</h4>
							</div>
						</div>
						<br>
						<div class="table-responsive" style="width: 100%; overflow: auto;">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>사번</th>
										<th>이름</th>
										<th>관리자</th>
										<th>연봉등급 (연봉)</th>
									</tr>
								</thead>
								<c:forEach varStatus="status" var="es"
									items="${subEmployeeSalaryList}">
									<form
										action="${pageContext.request.contextPath}/salaryEmployeeAction?employeeNo=${es.employeeNo}&employeeActive=${es.employeeActive}"
										method="post" id="updateSubEmployeeSalary${status.index}">
										<tbody>
											<tr>
												<td>${es.employeeNo}</td>
												<td>${es.employeeName}</td>
												<td>${es.employeeActive}</td>
												<td><select id="salaryNo" name="salaryNo">
														<option value="${es.salaryNo}" selected>
															${es.salaryNo} (${es.salaryValue})</option>
														<c:forEach var="sa" items="${salaryList}">
															<c:if test="${es.salaryNo ne sa.salaryNo}">
																<option value="${sa.salaryNo}">
																	${sa.salaryNo}(${sa.salaryValue})</option>
															</c:if>
														</c:forEach>
												</select></td>
												<td><button
														onclick="updateSubEmployeeSalary(${status.index})"
														type="button" class="btn btn-primary">변경</button></td>
											</tr>
										</tbody>
									</form>
								</c:forEach>
							</table>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- #/ container -->
</div>
<!--**********************************
            Content body end
        ***********************************-->




<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>