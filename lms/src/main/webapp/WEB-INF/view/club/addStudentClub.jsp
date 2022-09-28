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
				<li class="breadcrumb-item"><a href="javascript:void(0)">동아리
						소개</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">동아리
						가입</a></li>
			</ol>
		</div>
	</div>
	<!-- row -->
	<c:forEach var="c" items="${clubOne}">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="form-validation">
								<form class="form-valide"
									action="${pageContext.request.contextPath}/addStudentClub"
									method="post">
									<div class="form-group row">
										<div class="col-lg-4">
											<label class="col-lg-4 col-form-label" for="studentNo">이름</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" id="studentName"
													name="studentName" value="${s.studentName}"
													readonly="readonly">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-lg-6">
												<select name="clubNo" class="form-control">
													<option selected="selected">::동아리를 선택해주세요::</option>
													<c:forEach items="${clubList}" var="c">
														<option value="${c.clubNo}">${c.clubName}</option>
													</c:forEach>
												</select>
											</div>
										</div>
										<!-- 동아리 선택하면 동아리 설명, 담당교수 구현 -->
										<div class="form-group row">
											<label class="col-lg-4 col-form-label" for="clubContent">동아리
												설명<span class="text-danger">*</span>
											</label>
											<div class="col-lg-10">
												<textarea class="form-control" id="clubContent"
													name="clubContent" rows="15" readonly="readonly">${c.clubContent}</textarea>
											</div>

										</div>
										<div class="form-group row">
											<label class="col-lg-2 col-form-label" for="professorNo">담당교수
											</label>
											<div class="col-lg-10">
												<input type="text" class="form-control" id="professorNo"
													name="professorNo" value="${c.professorName}"
													readonly="readonly">
											</div>
										</div>
										<!-- End 담당교수 -->

										<div class="form-group row">
											<div class="col-lg-8 ml-auto">
												<button type="submit" class="btn btn-primary">가입하기</button>
											</div>
										</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	<!-- #/ container -->
</div>
<!--**********************************
            Content body end
        ***********************************-->
<script type="text/javascript"> <
	//공백 확인
	$('#addStudentClub').click(function() {
		if ($('#clubNo').val() == '') {
			alert('동아리를 선택해주세요.');
			
			addStudentClub.submit();
		}
	})
</script>
<!-- footer -->
<c:import url="/WEB-INF/template/footer.jsp"></c:import>