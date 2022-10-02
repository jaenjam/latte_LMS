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

<script type="text/javascript" src="/js/studentClub/addStudentClub.js"></script>


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

	<div class="container-fluid">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body">
						<div class="form-validation">
							<form class="form-valide"
								action="${pageContext.request.contextPath}/club/addStudentClub"
								method="post">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="studentNo">이름</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="studentName"
											name="studentName" value="${Name}" readonly="readonly">
										<input type="hidden" class="form-control" id="studentNo"
											name="studentNo" value="${No}" readonly="readonly">
									</div>
								</div>

								<c:set value="${clubList}" var="c"/>
								<div class="form-group row">
										<label class="col-lg-4 col-form-label" >동아리 선택</label>
										<div class="col-lg-6">
										<select id="selectClub" name="clubNo" class="form-control" onselect="selectClub()">
											<option selected="selected">::동아리를 선택해주세요::</option>
											<c:forEach items="${clubList}" var="c">
												<option id="clubInfo" value="${c.clubNo}">${c.clubName}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								
								<!-- 동아리 선택하면 동아리 설명, 담당교수 구현 -->
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="clubContent">동아리
										설명 </label>
									<div class="col-lg-6">
										<textarea class="form-control" id="clubContent"
											name="clubContent" rows="10" readonly="readonly"></textarea>
									</div>

								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label" for="professorNo">담당교수
									</label>
									<div class="col-lg-6">
										<input type="text" class="form-control" id="professorNo"
											name="professorNo"
											readonly="readonly">
									</div>
								</div>
								<!-- End 담당교수 -->

								<div class="form-group row">
									<div class="col-lg-8 ml-auto">
										<button type="submit"  id = "addStudentClub" class="btn btn-primary">가입하기</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
	<!-- #/ container -->
<!--**********************************
            Content body end
        ***********************************-->
<!-- footer -->
<c:import url="/WEB-INF/template/footer.jsp"></c:import>