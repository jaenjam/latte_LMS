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
				<li class="breadcrumb-item active"><a href="javascript:void(0)">장학
						소개</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">장학
						상세보기</a></li>
			</ol>
		</div>
	</div>
	<!-- row -->

	<c:forEach var="c" items="${scholarOne}">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body" style="color: black">
							<br>
							<h4 style="font-size: 2.0em;">장학 상세보기</h4>
							<hr>
							<div class="form-group row">
								<label class="col-lg-2 col-form-label" for="clubNo">장학코드
								</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="scholarNo"
										name="scholarNo" value="${s.scholarNo}" readonly="readonly">
								</div>
							</div>
							<!-- End 장학코드 -->

							<div class="form-group row">
								<label class="col-lg-2 col-form-label" for="clubName">장학명
								</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="scholarName"
										name="scholarName" value="${s.scholarName}"
										readonly="readonly">
								</div>
							</div>
							<!-- End 장학명 -->

							<div class="form-group row">
								<label class="col-lg-2 col-form-label" for="scholarContent">장학설명
								</label>
								<div class="col-lg-10">
									<textarea class="form-control" id="scholarContent"
										name="scholarContent" rows="15" readonly="readonly">${s.scholarContent}</textarea>
								</div>
							</div>
							<!-- End 장학설명 -->

							<div class="form-group row">
								<label class="col-lg-2 col-form-label" for="scholarPrice">장학금액
								</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="scholarPrice"
										name="scholarPrice" value="${s.scholarPrice}"
										readonly="readonly">
								</div>
							</div>

							<!-- END 장학금액 -->

							<div style="float: right">

								<a
									href="${pageContext.request.contextPath}/scholar/modifyScholar?scholarNo=${s.scholarNo}">
									<button type="button" class="btn btn-primary">장학수정</button>
								</a>

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