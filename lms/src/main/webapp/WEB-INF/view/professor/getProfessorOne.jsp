<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial;
}

/* Style the tab */
.tab {
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}
</style>
</head>
<body>

	<!-- header.jsp -->
	<%@include file="/WEB-INF/template/header.jsp"%>
	<!-- sidebar.jsp -->
	<%@include file="/WEB-INF/template/sidebar.jsp"%>
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
				<div class="col-lg-4 col-xl-3">
					<div class="card">
						<div class="card-body">
							<div class="media align-items-center mb-4">
								<img class="mr-2" src="${filename}" width="80" height="80"
									alt="">
							</div>
							<div class="row mb-8">
								<div class="col-12 text-center">
									<form
										action="${pageContext.request.contextPath}/professor/addProfessorImgForm">
										<button class="btn btn-danger px-5">사진첨부하기</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-8 col-xl-9">
					<div class="card">
						<div class="card-body">
							<form action="${pageContext.request.contextPath}/modifyProfessor"
								method="post" class="form-profile">
								<h4 class="card-title">정보보기</h4>
								<div class="basic-form">

									<div class="form-row">
										<c:forEach var="M" items="${professorOne}">
											<div class="form-group col-md-8">
												<div class="form-group">
													<label> 이름: </label> <input type="text"
														class="form-control" name="professorName"
														id="professorName" value="${M.professorName}" readonly="readonly">
												</div>

												<div class="form-group">
													<label> 전공: </label> <input type="text"
														class="form-control" name="professorMajor"
														id="professorMajor" value="${M.majorName}"
														readonly="readonly">
												</div>
												<div class="form-group">
													<label> 교수실: </label>
													<c:if test="${professorRoom eq null}">
														<input type="text" class="form-control"
															name="professorRoom" id="professorRoom" value="미정"
															readonly="readonly">
													</c:if>
													<!-- 교수실이 null값이라면 미정출력 -->
													<c:if test="${professorRoom ne null}">
														<input type="text" class="form-control"
															name="professorRoom" id="professorRoom"
															value="${professorRoom}" readonly="readonly">
													</c:if>
													<!-- 교수실이 정해져있으면 교수실출력 -->
												</div>
												<div class="form-group">
													<label> 주민번호: </label> <input type="text"
														class="form-control" name="professorRegiNo"
														id="professorRegiNo" value="${professorRegiNo}"
														readonly="readonly">
												</div>

												<div class="form-group">
													<label> 연봉: </label> <input type="text"
														class="form-control" name="salaryValue" id="salaryValue"
														value="${M.salaryValue}(만원)" readonly="readonly">

												</div>

												<div class="form-group">
													<label> 나이: </label> <input type="text"
														class="form-control" name="professorAge" id="professorAge"
														value="${professorAge}" readonly="readonly">
												</div>

												<div class="form-group">
													<label> 성별: </label> <input type="text"
														class="form-control" name="professorGender"
														id="professorGender" value="${professorGender}"
														readonly="readonly">
												</div>

												<div class="form-group">
													<label> 핸드폰: </label> <input type="text"
														class="form-control" name="professorTelephone"
														id="professorTelephone" value="${professorTelephone}"
														readonly="readonly">
												</div>

												<div class="form-group">
													<label> 이메일: </label> <input type="text"
														class="form-control" name="professorEmail"
														id="professorEmail" value="${professorEmail}"
														readonly="readonly">
												</div>

												<div class="form-group">
													<label> 주소: </label> <input type="text"
														class="form-control" name="professorAddress"
														id="professorAddress" value="${professorAddress}"
														readonly="readonly">
												</div>

												<div class="form-group">
													<label> 상세주소: </label> <input type="text"
														class="form-control" name="studentDetailAddress"
														id="studentDetailAddress"
														value="${professorDetailAddress}" readonly="readonly">
												</div>

												<div class="form-group">
													<label> 학적상태: </label>
													<c:if test="${M.professorState eq 'Y'}">
														<input type="text" class="form-control"
															name="professorState" id="professorState" value="재직중"
															readonly="readonly">
													</c:if>
													<c:if test="${M.professorState ne 'Y'}">
														<input type="text" class="form-control"
															name="professorState" id="professorState" value="휴직중"
															readonly="readonly">
													</c:if>
												</div>
												<div style="float: right">
													<a
														href="${pageContext.request.contextPath}/professor/modifyProfessor?professorNo=${M.professorNo}">
														<button type="button" class="btn btn-primary">정보수정</button>
													</a>
												</div>
											</div>
										</c:forEach>
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