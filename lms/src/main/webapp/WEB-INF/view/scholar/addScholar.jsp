<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

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
				<li class="breadcrumb-item"><a href="javascript:void(0)">장학</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">장학소개</a></li>
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
								action="${pageContext.request.contextPath}/addScholar"
								method="post">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="scholarNo">장학코드<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="scholarNo"
											name="scholarNo" placeholder="장학코드를 입력해주세요  &nbsp; ex)&nbsp;2001"">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for=scholarName>장학명<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="scholarName"
											name="scholarName" placeholder="장학명을 입력해주세요  &nbsp; ex)&nbsp;성적우수장학금"">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="scholarContent">장학내용<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<textarea class="form-control" id="scholarContent"
											name="scholarContent" rows="5" placeholder="장학내용을 입력해주세요"></textarea>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label"
										for="scholarPrice">장학금액<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control"
											id="scholarPrice" name="scholarPrice"
											placeholder="장학금액을 입력해주세요">
									</div>
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