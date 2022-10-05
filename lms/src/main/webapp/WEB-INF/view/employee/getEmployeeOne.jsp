<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<style>
.mr-2 {
	margin-left: 10px;
}
</style>

	<!--**********************************
	            Content body start
	***********************************-->

	<div class="content-body">

		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">마이페이지</a></li>
					<li class="breadcrumb-item active"><a
						href="javascript:void(0)">정보보기</a></li>
				</ol>
			</div>
		</div>
		<!-- row -->

		<div class="container-fluid">
			<div class="row">
				<c:if test="${empty employeeImg}">
					<div class="col-lg-4 col-xl-3">
						<div class="card">
							<div class="card-body">
								<div class="media align-items-center mb-4">
									<img class="mr-2"
										src="/images/userprofile/image.jpg"
										width="200" height="200" alt="">
								</div>
								<div class="row mb-8">
									<div class="col-12 text-center">
										<p>정보수정에서 이미지 추가해주세요</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					</c:if>
			
				<c:forEach var="i" items="${employeeImg}">
					
					<c:if test="${i.filename ne null}">
						<div class="col-lg-4 col-xl-3">
							<div class="card">
								<div class="card-body">
									<div class="media align-items-center mb-4">
										<img class="mr-2"
											src="/images/userprofile/${i.filename}${i.contentType}"
											width="200" height="200" alt="">
									</div>
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
				
				
				<div class="col-lg-8 col-xl-9">
					<div class="card">
						<div class="card-body">
							<form action="${pageContext.request.contextPath}/employee/modifyEmployee" class="form-profile">
								<div class="form-group">
									<h4 class="card-title">나의 정보</h4>
									<div class="basic-form">
										<div class="form-row">
										<c:forEach var="i" items="${employeeOne}">
											<div class="form-group col-md-8">
												<div class="form-group">
													<label> 등급 </label> <input type="text" class="form-control"
														name="employeeActive" id="employeeActive"
														value="${employeeActive}" readonly>
												</div>
												<div class="form-group">
													<label> 사번 </label> <input type="text" class="form-control"
														name="employeeNo" id="employeeNo" value="${No}" readonly>
												</div>
												<div class="form-group">
													<label> 이름 </label> <input type="text" class="form-control"
														name="employeeName" id="employeeName" value="${Name}"
														readonly>
												</div>

												<div class="form-group">
													<label> 주민번호 </label> <input type="text"
														class="form-control" name="employeeRegiNo"
														id="employeeRegiNo" value="${employeeRegiNo}" readonly>
												</div>

												<div class="form-group">
													<label> 나이 </label> <input type="text" class="form-control"
														name="employeeAge" id="employeeAge" value="${employeeAge}"
														readonly>
												</div>

												<div class="form-group">
													<label> 성별 </label> <input type="text" class="form-control"
														name="employeeGender" id="employeeGender"
														value="${employeeGender}" readonly>
												</div>

												<div class="form-group">
													<label> 핸드폰 </label> <input type="text"
														class="form-control" name="employeeTelephone"
														id="employeeTelephone" value="${employeeTelephone}"
														readonly>
												</div>

												<div class="form-group">
													<label> 이메일 </label> <input type="text"
														class="form-control" name="employeeEmail"
														id="employeeEmail" value="${employeeEmail}" readonly>
												</div>

												<div class="form-group">
													<label> 주소 </label> <input type="text" class="form-control"
														name="employeeAddress" id="employeeAddress"
														value="${employeeAddress}" readonly>
												</div>

												<div class="form-group">
													<label> 상세주소 </label> <input type="text"
														class="form-control" name="employeeDetailAddress"
														id="employeeDetailAddress"
														value="${employeeDetailAddress}" readonly>
												</div>
												<div style="float:right">
													<a href="${pageContext.request.contextPath}/employee/modifyEmployee?employeeNo=${No}">
														<button type="submit" class="btn btn-primary px-3 ml-4">정보수정</button>
													</a>
												</div>
											</div>
											</c:forEach>
										</div>

									</div>
									
								</div>
							</form>
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


	<!--**********************************
        Scripts
    ***********************************-->
	<script src="plugins/common/common.min.js"></script>
	<script src="js/custom.min.js"></script>
	<script src="js/settings.js"></script>
	<script src="js/gleek.js"></script>
	<script src="js/styleSwitcher.js"></script>


</body>

</html>