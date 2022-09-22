<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<style>
.btn {
	float: right;
	line-height: 18px;
}

.professorList {
	font-family: 맑은고딕;
	font-weight: 400;
	font-size: 2.5em;
	color:black;
}
</style>
<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body">

	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)">마이페이지</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">교수목록</a></li>
			</ol>
		</div>
	</div>
	<!-- End row page-titles mx-0 -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-sm-9">
								<h4 class="professorList">교수 목록</h4>
							</div>
							<div class="col-sm-3">
								<a href="">
									<button type="button" class="btn btn-primary">수정하기</button>
								</a>
							</div>
						</div>
						<br>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>교수사번</th>
										<th>담당학과</th>
										<th>교수명</th>
										<th>주민번호</th>
										<th>성별</th>
										<th>핸드폰</th>
										<th>이메일</th>
										<th>주소</th>
										<th>상세주소</th>
										<th>교수실</th>
										<th>재직상태</th>
										<th>연봉등급</th>
										<th>가입일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="C" items="${professorList}">
										<tr>
											<td>${C.professorNo}</td>
											<td>${C.majorName}</td>
											<td>${C.professorName}</td>
											<td>${C.professorRegiNo}</td>
											<td>${C.professorGender}</td>
											<td>${C.professorTelephone}</td>
											<td>${C.professorEmail}</td>
											<td>${C.professorAddress}</td>
											<td>${C.professorDetailAddress}</td>		
											<c:if test="${C.professorRoom eq null}"><td>미정</td></c:if>
											<c:if test="${C.professorRoom ne null}"><td>${C.professorRoom}</td></c:if>
											<td>${C.professorState}</td>
											<td>${C.salaryNo}</td>
											<td>${C.createDate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>