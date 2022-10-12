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

.input-group .input-group-text {
	font-size: 1.375rem;
}
</style>

<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body">

	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(4)">시험</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">시험출제</a></li>
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
								<h4 class="card-title">시험출제</h4>
							</div>
						</div>
						<br>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>학과</th>
										<th>과목</th>
										<th>교수</th>
										<th>년도</th>
										<th>학기</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="N" items="${subjectApproveList}">
										<tr>
											<td>${N.major_name}</td>
											<td>${N. subject_name}(${N.subject_no})</td>
											<td>${N.professor_name}</td>
											<td>${N.YEAR}</td>
											<td>${N.semester}</td>
											<c:if test="${not empty N.test_name}">
												<td>
													<button type="submit" class="btn">출제완료</button>
												</td>
											</c:if>
											<c:if test="${empty N.test_name}">
												<td><a
													href="${pageContext.request.contextPath}/test/multipleTest?subjectApproveNo=${N.subject_approve_no}">
														<button type="submit" class="btn btn-primary">출제</button>
												</a></td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
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