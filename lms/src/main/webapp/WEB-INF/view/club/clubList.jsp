<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- header.jsp -->
<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->
<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>
<style>
.majorheader {
	font-family: 궁서체;
	font-weight: 400;
	font-size: 1.5em;
	color: black;
}

.addmajor {
	margin-right: 33px;
}
</style>

<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body">
	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)">동아리</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">동아리 소개</a></li>
			</ol>
		</div>
	</div>

	<div class="addScholar">
		
			<a href="${pageContext.request.contextPath}/club/addClub">
				<button type="submit" class="btn btn-primary" style="float: right;">동아리 추가</button>
			</a>
			<!-- 관리자만 보이게 설정 -->
		
	</div>
	<br />
	<br />

	<div class="container-fluid">
		<c:forEach var="c" items="${clubList}">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">
					<a href="${pageContext.request.contextPath}/club/clubOne?clubNo=${c.clubNo}">${c.clubName}</a>
					</h4>
					<br />
					<div class="table-responsive">
						<div class="clubheader">${c.clubContent}</div>
						<br />					
						<p style="color: darkred;">동아리방 : ${c.clubRoom}</p>
						<br/>
						<p style="color: darkred;">담당교수 : ${c.professorName}</p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<!-- #/ container -->

<!--**********************************
            Content body end
        ***********************************-->
<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>

