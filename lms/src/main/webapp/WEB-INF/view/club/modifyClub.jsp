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
				<li class="breadcrumb-item active"><a href="javascript:void(0)">동아리
						소개</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">동아리상세보기</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">동아리
						수정</a></li>
			</ol>
		</div>
	</div>
	<!-- row -->
	<c:forEach var="c" items="${club}">
		<div class="container-fluid">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="card">
						<div class="card-body">
							<div class="form-validation">
								<form class="form-valide"
									action="${pageContext.request.contextPath}/modifyClub"
									method="post">
									<div class="form-group row">
										<label class="col-lg-2 col-form-label" for="clubNo">동아리코드<span
											class="text-danger">*</span></label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="clubNo"
												name="clubNo" value="${c.clubNo}">
										</div>
									</div>
									<div class="form-group row">
										<label class="col-lg-2 col-form-label" for="clubName">동아리명<span
											class="text-danger">*</span>
										</label>
										<div class="col-lg-10">
											<input type="text" class="form-control" id="clubName"
												name="clubName" value="${c.clubName}">
										</div>
									</div>

									<div class="form-group row">
										<label class="col-lg-2 col-form-label" for="majorIntroduce">동아리설명<span
											class="text-danger">*</span>
										</label>
										<div class="col-lg-10">
											<textarea class="form-control" id="clubContent"
												name="clubContent" rows="16">${c.clubContent}</textarea>
										</div>
									</div>

									<div class="form-group row">
										<label class="col-lg-2 col-form-label" for="professorNo">담당교수
											<span class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<select name="professorNo" class="form-control">
												<option selected="selected">::담당교수를 선택해주세요::</option>
												<c:forEach items="${professorList}" var="p">

													<option value="${c.professorNo}">${p.professorName}</option>
												</c:forEach>
											</select>
										</div>
									</div>

									<div class="form-group row">
										<label class="col-lg-2 col-form-label" for="clubName">동아리방<span
											class="text-danger">*</span>
										</label>
										<div class="col-lg-6">
											<input type="text" class="form-control" id="clubRoom"
												name="clubRoom" value="${c.clubRoom}">
										</div>
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
