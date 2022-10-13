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
				<li class="breadcrumb-item active"><a href="javascript:void(0)">시험응시</a></li>
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
								<h4 class="card-title">시험응시</h4>
							</div>
						</div>
						<br>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>코드</th>
										<th>과목</th>
										<th>교수</th>
										<th>년도</th>
										<th>학기</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="N" items="${testList}">
										<tr>
											<td>${N.subject_no}</td>
											<td>${N.subject_name}</td>
											<td>${N.professor_name}</td>
											<td>${N.year}</td>
											<td>${N.semester}${N.test_name}</td>
											<c:if test="${empty N.test_name}">
											<td><button type="submit" class="btn btn-light">미출제</button></td>
											</c:if>
											
											<c:forEach var="t" items="${test}">
												<!-- 응시 -->
												<c:if test="${not empty N.test_name}">
												
												
												<c:if test="${N.test_no ne t.test_no}">		
																							<td><a href="${pageContext.request.contextPath}/test/doMultipleTest?testNo=${N.test_no}">
												<button type="submit" class="btn btn-primary">응시</button>
												</a></td> 
															
												</c:if>
												
												
												<!-- 응시완료 -->
												<c:if test="${N.test_no eq t.test_no}">
												<td><a href="">
												<button type="submit" class="btn btn-light">응시완료</button>
												</a></td>					
												</c:if>
												</c:if>
											</c:forEach>
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