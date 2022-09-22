<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
				<li class="breadcrumb-item"><a href="javascript:void(0)">학과</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">학과소개</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">학과추가</a></li>
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
								action="${pageContext.request.contextPath}/addMajor"
								method="post">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="majorNo">학과코드<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="majorNo"
											name="majorNo" placeholder="학과코드를 입력해주세요  &nbsp; ex)&nbsp;1001"">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for=majorName>학과명<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="majorName"
											name="majorName" placeholder="학과명을 입력해주세요  &nbsp; ex)&nbsp;컴퓨터공학과"">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for=majorRoom>학과방<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="majorRoom"
											name="majorRoom" placeholder="학과명을 입력해주세요  &nbsp; ex)&nbsp;201호">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label"
										for="majorIntroduceHeader">학과슬로건<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control"
											id="majorIntroduceHeader" name="majorIntroduceHeader"
											placeholder="학과슬로건을 입력해주세요  &nbsp; ex)&nbsp;&quot;IT의 최고 전문가! 그 안에 내가 있다&quot;">
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="majorIntroduce">학과소개<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<textarea class="form-control" id="majorIntroduce"
											name="majorIntroduce" rows="5" placeholder="학과소개를 입력해주세요"></textarea>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="majorSubject">학과목<span
										class="text-danger">*</span>
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="majorSubject"
											name="majorSubject"
											placeholder="학과목을 입력해주세요 &nbsp; ex)&nbsp;주요교과목:생활체육">
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



<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>