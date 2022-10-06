<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- header.jsp -->
<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->
<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body">

	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)">상세관리</a></li>
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
									
								<div class="form-group row">
									<input type="text" class="form-control"
										id="datepicker-autoclose" placeholder="mm/dd/yyyy"> <span
										class="input-group-append"><span
										class="input-group-text"><i
											class="mdi mdi-calendar-check"></i></span></span>
								</div>


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
	</div>
	<!-- #/ container -->
</div>
<!--**********************************
            Content body end
        ***********************************-->
<script type="text/javascript"> <
	//공백 확인
	$('#addScholar').click(function() {
		if ($('#scholarNo').val() == '') {
			alert('장학코드를 입력해주세요.');
		} else if ($('#scholaName').val() == '') {
			alert('장학명을 입력해주세요.');
		} else if ($('#scholarContent').val() == '') {
			alert('장학내용을 입력해주세요.');
		} else if ($('#scholarPrice').val() == '') {
			alert('장학금액을 입력해주세요.');
		} else {
			addScholar.submit();
		}
	})
</script>
<!-- footer -->
<c:import url="/WEB-INF/template/footer.jsp"></c:import>