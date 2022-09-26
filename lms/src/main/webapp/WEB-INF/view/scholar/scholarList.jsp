<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
				<li class="breadcrumb-item"><a href="javascript:void(0)">장학</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">장학소개</a></li>
			</ol>
		</div>
	</div>
<c:if test="${user eq 'employee'}">
	<div class="addScholar">
			<a href="${pageContext.request.contextPath}/scholar/addScholar">
				<button type="submit" class="btn btn-primary" style="float: right;">장학추가</button>
			</a>
			<!-- 관리자만 보이게 설정 -->
		
	</div>
	<br />
	<br />

	<div class="container-fluid">
		<c:forEach var="s" items="${scholarList}">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">
					<a href="${pageContext.request.contextPath}/scholar/scholarOne?scholarNo=${s.scholarNo}">${s.scholarName}</a>
					</h4>
					<br />
					<div class="table-responsive">
						<div class="scholarheader">${s.scholarContent}</div>
						<br />
						<c:set var ="price" value="${s.scholarPrice}"/>
						<p style="color: darkred;"><fmt:formatNumber value="${price}" type="currency" />원</p>
					</div>
				</div>
			</div>
		</c:forEach>
		
	</div>
	</c:if>
	
	
	<c:if test="${user ne 'employee'}">
	<div class="container-fluid">
		<c:forEach var="s" items="${scholarList}">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">
					${s.scholarName}
					</h4>
					<br />
					<div class="table-responsive">
						<div class="scholarheader">${s.scholarContent}</div>
						<br />
						<c:set var="price" value="${s.scholarPrice}"/>						
						<p style="color: darkred;"></p>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	</c:if>
	
</div>

<!-- #/ container -->

<!--**********************************
            Content body end
        ***********************************-->
<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>

