<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
				<li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
			</ol>
		</div>
	</div>

	<div class="addmajor">

		<a href="${pageContext.request.contextPath}/major/addMajor">
			<button type="submit" class="btn btn-primary" style="float: right;">학과추가</button>
		</a>
		<!-- 관리자만 보이게 설정 -->
	</div>
	<br /> <br />

	<div class="container-fluid">
		<c:forEach var="C" items="${majorList}">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title" style="font-size: 2.0em;"><a href="${pageContext.request.contextPath}/major/majorOne?majorNo=${C.majorNo}">${C.majorName}</a></h4>
					<br/>
					<div class="table-responsive">
						<div class="majorheader"><a href="${pageContext.request.contextPath}/major/majorOne?majorNo=${C.majorNo}">${C.majorIntroduceHeader}</a></div>
						<br />
						<p style="white-space: pre-line;"><a href="${pageContext.request.contextPath}/major/majorOne?majorNo=${C.majorNo}">${C.majorIntroduce}</a></p>
						<br />
						<p style="color: darkred;">${C.majorSubject}</p>
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

