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
}
</style>

<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body">

	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)">학과</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">학과소개</a></li>
			</ol>
		</div>
	</div>
	<!-- row -->

	<div class="container-fluid">
		<c:forEach var="C" items="${majorList}">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">${C.majorName}</h4>
					<br/>
					<div class="table-responsive">
						<div class="majorheader">${C.majorIntroduceHeader}</div>
						<br/>
						<p style="white-space:pre-line;">${C.majorIntroduce}</p>
						<br/>
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

