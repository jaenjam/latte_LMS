<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>


<link rel="stylesheet" type="text/css" href="/css/club/clubList.css" />
<style>
.addClub {
	margin-right: 33px;
}

.addStudentClub {
	margin-right: 33px;
}
</style>


<div class="content-body" style="min-height: 876px;">

	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)">동아리</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">동아리
						소개</a></li>
			</ol>
		</div>
	</div>
	<!-- row -->

	<c:if test="${user eq 'student'}">
		<div class="addStudentClub">
			<a href="${pageContext.request.contextPath}/club/addStudentClub">
				<button type="submit" class="btn btn-primary"
					style="float: right;">동아리 가입</button>
			</a>
			<!--학생만 보이게 설정 -->
		</div>
	</c:if>

	<c:if test="${user eq 'employee'}">
		<div class="addClub">
			<a href="${pageContext.request.contextPath}/club/addClub">
				<button type="submit" class="btn btn-primary" style="float: right;">동아리
					추가</button>
			</a>
			<!-- 관리자만 보이게 설정 -->
		</div>
		<br />
		<br />
	</c:if>



	<div class="clubContainer">
		<c:forEach var="c" varStatus="status" items="${clubList}">
			<div class="card">
				<img class="img-fluid"
					src="${pageContext.request.contextPath}/images/clubUploadFile/${c.fileName}"
					alt="">
				<div class="card-body">
					<h5 class="card-title">
						<c:if test="${user eq 'employee'}">
							<a
								href="${pageContext.request.contextPath}/club/clubOne?clubNo=${c.clubNo}">${c.clubName}</a>
						</c:if>

						<c:if test="${user ne 'employee'}">
							${c.clubName}
						</c:if>
					</h5>
					<p class="card-text">${c.clubContent}</p>
				</div>
				<div class="card-footer">
					<p class="card-text d-inline">
						<small class="text-muted">동아리방 : ${c.clubRoom}</small>
					</p>
					<p class="card-link float-right">
						<small>담당교수 : ${c.professorName}</small>
					</p>
				</div>
			</div>
		</c:forEach>
	</div>

</div>
	<!-- footer -->

	<c:import url="/WEB-INF/template/footer.jsp"></c:import>