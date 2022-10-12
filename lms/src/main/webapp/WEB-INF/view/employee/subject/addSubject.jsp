<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- header.jsp -->
<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->
<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>


<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="images/favicon.png">
<!-- Custom Stylesheet -->
<link
	href="${pageContext.request.contextPath}/plugins/bootstrap-material-datetimepicker/css/bootstrap-material-datetimepicker.css"
	rel="stylesheet">
<!-- Page plugins css -->
<link
	href="${pageContext.request.contextPath}/plugins/clockpicker/dist/jquery-clockpicker.min.css"
	rel="stylesheet">
<!-- Color picker plugins css -->
<link
	href="${pageContext.request.contextPath}/plugins/jquery-asColorPicker-master/css/asColorPicker.css"
	rel="stylesheet">
<!-- Date picker plugins css -->
<link
	href="${pageContext.request.contextPath}/plugins/bootstrap-datepicker/bootstrap-datepicker.min.css"
	rel="stylesheet">
<!-- Daterange picker plugins css -->
<link
	href="${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/plugins/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">


<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body">

	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)">과목관리</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">과목
						추가</a></li>
			</ol>
		</div>
	</div>
	<!-- row -->

	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="form-validation">
							<form class="form-valide"
								action="${pageContext.request.contextPath}/addSubject"
								method="post">


								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="subjectNo">과목코드<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="subjectNo"
											name="subjectNo"
											placeholder="과목코드을 입력해주세요 &nbsp; ex)&nbsp;Z001">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="subjectName">과목명<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="subjectName"
											name="subjectName" placeholder="과목명을 입력해주세요">
									</div>
								</div>

								<input type="hidden" class="form-control" id="subjectState"
									name="subjectState" value="Y">

								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="subjectCredit">학점<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="subjectCredit"
											name="subjectCredit" placeholder="학점을 입력해주세요">

									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="subjectMajor">전필여부<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<select id="subjectMajor" name="subjectMajor">
											<option value="Y">Y</option>
											<option value="N">N</option>
										</select>
									</div>
								</div>


								<!-- 달력 -->
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="createDate">개강일
										/ 종강일 <span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<div class="input-daterange input-group" id="date-range">
											<input type="text" class="form-control" name="createDate" value="createDate">											
											<input type="text" class="form-control" name="endDate" value="endDate">
										</div>
									</div>

								</div>
								<!-- 달력 -->



								<div class="form-group row">
									<div class="col-lg-8 ml-auto">
										<button type="submit" class="btn btn-primary">추가</button>
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
</div>
<!--**********************************
            Content body end
        ***********************************-->



<!--**********************************
        Scripts
    ***********************************-->

<script
	src="${pageContext.request.contextPath}/plugins/common/common.min.js"></script>
<script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
<script src="${pageContext.request.contextPath}/js/settings.js"></script>
<script src="${pageContext.request.contextPath}/js/gleek.js"></script>
<script src="${pageContext.request.contextPath}/js/styleSwitcher.js"></script>

<script
	src="${pageContext.request.contextPath}/plugins/moment/moment.js"></script>
<script
	src="${pageContext.request.contextPath}/plugins/bootstrap-material-datetimepicker/js/bootstrap-material-datetimepicker.js"></script>
<!-- Clock Plugin JavaScript -->
<script
	src="${pageContext.request.contextPath}/plugins/clockpicker/dist/jquery-clockpicker.min.js"></script>
<!-- Color Picker Plugin JavaScript -->
<script
	src="${pageContext.request.contextPath}/plugins/jquery-asColorPicker-master/libs/jquery-asColor.js"></script>
<script
	src="${pageContext.request.contextPath}/plugins/jquery-asColorPicker-master/libs/jquery-asGradient.js"></script>
<script
	src="${pageContext.request.contextPath}/plugins/jquery-asColorPicker-master/dist/jquery-asColorPicker.min.js"></script>
<!-- Date Picker Plugin JavaScript -->
<script
	src="${pageContext.request.contextPath}/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<!-- Date range Plugin JavaScript -->
<script
	src="${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.js"></script>
<script
	src="${pageContext.request.contextPath}/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>

<script
	src="${pageContext.request.contextPath}/js/plugins-init/form-pickers-init.js"></script>







<!-- footer -->
<c:import url="/WEB-INF/template/footer.jsp"></c:import>