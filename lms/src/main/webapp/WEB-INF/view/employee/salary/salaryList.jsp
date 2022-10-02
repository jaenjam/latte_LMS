<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->
<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->
<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>


<style>
.salaryHeader {
	font-family: 돋움체;
	font-weight: 400;
	font-size: 1.5em;
	color: black;
	font-weight: 400;
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
				<li class="breadcrumb-item"><a href="javascript:void(0)">연봉관리</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">연봉관리</a></li>
			</ol>
		</div>
	</div>


	<div class="container-fluid">
		<c:forEach var="C" items="${salaryList}">
			<div class="card">
				<div class="card-body">
					<form action="${pageContext.request.contextPath}/salaryAction?salaryNo=${C.salaryNo}" method="post">
						<h4 class="card-title" style="font-size: 2.0em;">
							${C.salaryNo}등급</h4>
						<br />
						<div class="table-responsive">
							<div class="salaryHeader">
								연봉 : <input type="text" name="salaryValue"
									value="${C.salaryValue}"> (만원) &nbsp
								<button type="submit" class="btn btn-light"
									style="font-size: 18px; font-weight: bold;">변경</button>
							</div>
						</div>
					</form>
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