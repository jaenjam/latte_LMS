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
				<li class="breadcrumb-item"><a href="javascript:void(0)">학과</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">학과소개</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">학과상세보기</a></li>
			</ol>
		</div>
	</div>
	<!-- row -->

	<c:forEach var="c" items="${majorOne}">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body" style="color: black">
							<br>
							<h4 style="font-size:2.0em;">학과상세보기</h4>
							<hr>
							<div class="form-group row">
								<label class="col-lg-2 col-form-label" for="majorNo">학과코드
								</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="majorNo"
										name="majorNo" value="${c.majorNo}" readonly="readonly">
								</div>
							</div>
							<!-- End 학과코드 -->

							<div class="form-group row">
								<label class="col-lg-2 col-form-label" for="majorName">학과명
								</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="majorName"
										name="majorName" value="${c.majorName}" readonly="readonly">
								</div>
							</div>
							<!-- End 학과명 -->

							<div class="form-group row">
								<label class="col-lg-2 col-form-label"
									for="majorIntroduceHeader">학과슬로건 </label>
								<div class="col-lg-10">
									<textarea class="form-control" id="majorIntroduceHeader"
										name="majorIntroduceHeader" rows="1" readonly="readonly">${c.majorIntroduceHeader}</textarea>
								</div>
							</div>
							<!-- End 학과내용 -->

							<div class="form-group row">
								<label class="col-lg-2 col-form-label" for="majorIntroduce">학과내용
								</label>
								<div class="col-lg-10">
									<textarea class="form-control" id="majorIntroduce"
										name="majorIntroduce" rows="15" readonly="readonly">${c.majorIntroduce}</textarea>
								</div>
							</div>
							<!-- End 학과내용 -->

							<div class="form-group row">
								<label class="col-lg-2 col-form-label" for="majorSubject">학과교과목
								</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="majorSubject"
										name="majorSubject" value="${c.majorSubject}"
										readonly="readonly">
								</div>
							</div>
							<!-- End 학과교과목 -->

							<div class="form-group row">
								<label class="col-lg-2 col-form-label" for="majorRoom">학과방
								</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="majorRoom"
										name="majorRoom" value="${c.majorRoom}" readonly="readonly">
								</div>
							</div>
							<!-- End 학과방 -->

							<div style="float: right">
								<c:if test="${user eq 'employee'}">
									<a
										href="${pageContext.request.contextPath}/major/modifyMajor?majorNo=${c.majorNo}">
										<button type="button" class="btn btn-primary">학과수정</button>
									</a>
								</c:if>
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