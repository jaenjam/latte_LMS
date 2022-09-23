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
				<li class="breadcrumb-item"><a href="javascript:void(0)">동아리</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">동아리
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
								action="${pageContext.request.contextPath}/addClub"
								method="post">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="clubNo">동아리코드<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="clubNo"
											name="clubNo"
											placeholder="동아리코드를 입력해주세요  &nbsp; ex)&nbsp;HE(헬스동아리)">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for=clubName>동아리명<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="clubName"
											name="clubName"
											placeholder="동아리명을 입력해주세요  &nbsp; ex)&nbsp;헬스동아리">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="clubRoom">동아리방<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="clubRoom"
											name="clubRoom"
											placeholder="동아리방을 입력해주세요  &nbsp; ex)&nbsp;452호">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="clubContent">동아리
										설명<span class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<textarea class="form-control" id="clubContent"
											name="clubContent" rows="5" placeholder="동아리설명을 입력해주세요"></textarea>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="professorNo">담당교수
									</label>

									<div class="col-lg-6">
										<select name="professorNo" class="form-control">
											<option selected="selected">::담당교수를 선택해주세요::</option>
											<c:forEach items="${professorList}" var="p">

												<option value="${p.professorNo}">${p.professorName}</option>
											</c:forEach>
										</select>
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
	$('#addClub').click(function() {
		if ($('#clubNo').val() == '') {
			alert('동아리코드를 입력해주세요.');
		} else if ($('#clubName').val() == '') {
			alert('동아리명을 입력해주세요.');
		}	else if ($('#clubContent').val() == '') {
			alert('동아리내용을 입력해주세요.');
		} else if ($('#clubRoom').val() == '') {
			alert('동아리방명을 입력해주세요.');
		} else if ($('#professorNo').val() == '') {
			alert('담당교수를 입력해주세요.');
		} else {
			addClub.submit();
		}
	})
</script>
<!-- footer -->
<c:import url="/WEB-INF/template/footer.jsp"></c:import>