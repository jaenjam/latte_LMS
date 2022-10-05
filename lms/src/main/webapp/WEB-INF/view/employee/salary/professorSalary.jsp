<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/salary/professorSalary.js"></script>

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
				<li class="breadcrumb-item active"><a href="javascript:void(0)">교수</a></li>
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
								<h4 class="card-title">교수 연봉변경</h4>
							</div>
						</div>
						<br>
						<div class="table-responsive" style="width: 100%; overflow: auto;">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>사번</th>
										<th>소속학과번호 (학과이름)</th>
										<th>이름</th>
										<th>연봉등급 (연봉)</th>
									</tr>
								</thead>
								<c:forEach var="p" items="${professorSalaryList}">
									<form
										action="${pageContext.request.contextPath}/salaryProfesorAction?professorNo=${p.professorNo}"
										method="post" id="updateProfessorSalary">
									<tbody>
										<tr>
											<td>${p.professorNo}</td>
											<td>${p.majorNo}(${p.majorName})</td>
											<td>${p.professorName}</td>
											<td><select id="salaryNo" name="salaryNo">
													<option value="${p.salaryNo}" selected>
														${p.salaryNo} (${p.salaryValue})</option>
													<c:forEach var="sa" items="${salaryList}">
														<c:if test="${p.salaryNo ne sa.salaryNo}">
															<option value="${sa.salaryNo}">
																${sa.salaryNo}(${sa.salaryValue})</option>
														</c:if>
													</c:forEach>
											</select></td>
											<td><button onclick="updateProfessorSalary()"
													type="button" class="btn btn-primary"
													id="updateProfessorSalaryBtn">변경</button></td>
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