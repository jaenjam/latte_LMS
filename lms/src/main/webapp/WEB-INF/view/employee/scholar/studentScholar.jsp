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
				<li class="breadcrumb-item"><a href="javascript:void(4)">장학
						관리</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">학생
						장학 관리</a></li>
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
								<h4 class="card-title">학생 장학 관리</h4>
							</div>
						</div>
						<br>
						<div class="table-responsive" style="width: 100%; overflow: auto;">
							<c:forEach var="s" items="${selectStudentList}">
								<form
									action="${pageContext.request.contextPath}/scholarStudentAction?studentNo=${s.studentNo}"
									method="post" id="studentScholar">
									<table class="table table-hover">
										<thead>
											<tr>
												<th>학번</th>
												<th>소속학과 (학과이름)</th>
												<th>이름</th>
												<th>장학 여부</th>
											</tr>
										</thead>
										<tbody>

											<tr>
												<td>${s.studentNo}</td>
												<td>${s.majorNo}(${s.majorName})</td>
												<td>${s.studentName}</td>
												<td><select id="studentScholar" name="studentScholar">
														<option value="${s.scholarNo}" selected>
															${s.scholarName}
															<c:if test="${empty s.scholarNo}">
																==선택해주세요==
														</c:if>
														</option>


														<c:forEach var="sc" items="${selectScholarList}">
															<c:if test="${s.scholarNo ne sc.scholarNo}">
																<option value="${sc.scholarNo}">
																	${sc.scholarName}</option>
															</c:if>
														</c:forEach>

												</select></td>
												<td><button type="submit" class="btn btn-primary">변경</button></td>
											</tr>
										</tbody>
									</table>
								</form>
							</c:forEach>
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