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
				<li class="breadcrumb-item"><a href="javascript:void(0)">장학</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">장학
						소개</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">장학상세보기</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">장학
						수정</a></li>
			</ol>
		</div>
	</div>
	<!-- row -->
	<c:forEach var="s" items="${scholar}">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="form-validation">
								<form class="form-valide"
									action="${pageContext.request.contextPath}/modifyScholar"
									method="post">
									<div class="form-group row">
										<label class="col-lg-2 col-form-label" for="scholarNo">장학코드<span
											class="text-danger">*</span></label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="scholarNo"
												name="scholarNo" value="${s.scholarNo}" readonly>
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-2 col-form-label" for="scholarName">장학명<span
											class="text-danger">*</span>
										</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="scholarName"
												name="scholarName" value="${s.scholarName}">
										</div>
									</div>

									<div class="form-group row">
										<label class="col-lg-2 col-form-label" for="scholarContent">장학설명<span
											class="text-danger">*</span>
										</label>
										<div class="col-lg-10">
											<textarea class="form-control" id="scholarContent"
												name="scholarContent" rows="16">${s.scholarContent}</textarea>
										</div>
									</div>
									
									<div class="form-group row">
										<label class="col-lg-2 col-form-label" for="scholarPrice">장학금액<span
											class="text-danger">*</span>
										</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="scholarPrice"
												name="scholarPrice" value="${s.scholarPrice}">
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
</div>
<!-- #/ container -->
<!--**********************************
            Content body end
        ***********************************-->

<!-- footer -->
<c:import url="/WEB-INF/template/footer.jsp"></c:import>
