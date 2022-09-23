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
				<li class="breadcrumb-item"><a href="javascript:void(0)">학과</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">학과상세보기</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">학과수정</a></li>
			</ol>
		</div>
	</div>
	<!-- row -->
	<c:forEach var="c" items="${major}">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="form-validation">
								<form class="form-valide"
									action="${pageContext.request.contextPath}/modifyMajor"
									method="post">
									<div class="form-group row">
										<label class="col-lg-2 col-form-label" for="majorNo">학과코드</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="majorNo"
												name="majorNo" value="${c.majorNo}" readonly="readonly">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-2 col-form-label" for="majorName">학과명<span
											class="text-danger">*</span>
										</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="majorName"
												name="majorName" value="${c.majorName}">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-2 col-form-label"
											for="majorIntroduceHeader">학과슬로건<span
											class="text-danger">*</span>
										</label>
										<div class="col-lg-10">
											<textarea class="form-control" id="majorIntroduceHeader"
												name="majorIntroduceHeader" rows="1">${c.majorIntroduceHeader}</textarea>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-2 col-form-label" for="majorIntroduce">학과설명<span
											class="text-danger">*</span>
										</label>
										<div class="col-lg-10">
											<textarea class="form-control" id="majorIntroduce"
												name="majorIntroduce" rows="16">${c.majorIntroduce}</textarea>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-2 col-form-label" for="majorSubject">학과교과목<span
											class="text-danger">*</span>
										</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="majorSubject"
												name="majorSubject" value="${c.majorSubject}">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-2 col-form-label" for="majorRoom">학과방<span
											class="text-danger">*</span>
										</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="majorRoom"
												name="majorRoom" value="${c.majorRoom}">
										</div>
									</div>


									<div style="float: right">
										<div>
											<button type="reset" class="btn btn-primary">되돌리기</button>
											<button type="submit" class="btn btn-primary">수정완료</button>
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

<!-- footer -->
<c:import url="/WEB-INF/template/footer.jsp"></c:import>
