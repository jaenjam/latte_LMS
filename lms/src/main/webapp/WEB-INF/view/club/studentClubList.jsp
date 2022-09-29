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
				<li class="breadcrumb-item"><a href="javascript:void(0)"></a>교수
					페이지</li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">
				</a>동아리 가입승인</li>
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
								<h4 class="card-title">동아리 가입승인</h4>
							</div>
						</div>
						<br>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>학번</th>
										<th>이름</th>
										<th>동아리명</th>
										<th>신청일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="sc" items="${studentClubNo}">
										<tr>
											<td>${sc.studentNo}</td>
											<td>${sc.clubNo}</td>
											<td>${sc.createDate}</td>
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
</div>



<!-- #/ container -->

<!--**********************************
            Content body end
***********************************-->


<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>
