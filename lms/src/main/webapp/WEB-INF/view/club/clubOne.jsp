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
				<li class="breadcrumb-item"><a href="javascript:void(0)">동아리</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">동아리 소개</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">동아리 상세보기</a></li>
			</ol>
		</div>
	</div>
	<!-- row -->

	<c:forEach var="c" items="${clubOne}">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body" style="color: black">
							<br>
							<h4 style="font-size:2.0em;">동아리 상세보기</h4>
							<hr>
							<div class="form-group row">
								<label class="col-lg-2 col-form-label" for="clubNo">동아리코드
								</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="clubNo"
										name="clubNo" value="${c.clubNo}" readonly="readonly">
								</div>
							</div>
							<!-- End 동아리코드 -->

							<div class="form-group row">
								<label class="col-lg-2 col-form-label" for="clubName">동아리명
								</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="clubName"
										name="clubName" value="${c.clubName}" readonly="readonly">
								</div>
							</div>
							<!-- End 동아리명 -->

							<div class="form-group row">
								<label class="col-lg-2 col-form-label" for="clubContent">동아리설명
								</label>
								<div class="col-lg-10">
									<textarea class="form-control" id="clubContent"
										name="clubContent" rows="15" readonly="readonly">${c.clubContent}</textarea>
								</div>
							</div>
							<!-- End 동아리설명 -->

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
								<label class="col-lg-2 col-form-label" for="clubRoom">동아리방
								</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="clubRoom"
										name="clubRoom" value="${c.clubRoom}" readonly="readonly">
								</div>
							</div>
							<!-- End 동아리방 -->

							<div style="float: right">
								<c:if test="${user eq 'employee'}">
									<a
										href="${pageContext.request.contextPath}/club/modifyClub?clubNo=${c.clubNo}">
										<button type="button" class="btn btn-primary">동아리수정</button>
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
