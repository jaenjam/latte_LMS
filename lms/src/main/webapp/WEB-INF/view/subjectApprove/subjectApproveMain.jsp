<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<style>
.btn-primary {
	width: 180px;
	height: 60px;
	margin-top: 23px;
	font-size: 20px
}
</style>

<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body">

	<div class="container-fluid mt-3">

		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-12">
						<div class="card">


							<div class="card-body pb-0 d-flex justify-content-between">
								<div>
									<a
										href="${pageContext.request.contextPath}/lecture/getLectureList?subjectApproveNo=${MyRegister.subjectApproveNo}">
										<h4 class="mb-1">과목 과제</h4>
									</a>
									<p>${myRegisterListStu}</p>
									<h3 class="m-0">$ 12,555</h3>
									<div>${MyRegister}</div>
								</div>
							</div>
						</div>


					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body pb-0 d-flex justify-content-between">
								<div>
									<h4 class="mb-0">${MyRegister.subjectName}</h4>
									<p>교수: ${MyRegister.professorName} / 강의실:
										${MyRegister.subjectRoom} / 학점: ${MyRegister.subjectCredit} /
										요일: ${MyRegister.day}</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col-lg-3 col-md-6">
				<div class="card">
					<div class="card-body">
						<h4 class="card-title">과목 정보</h4>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-6">
				<form action="${pageContext.request.contextPath}/test/addTestForm">
					<button type="submit" class="btn btn-primary">시험추가</button>
				</form>
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