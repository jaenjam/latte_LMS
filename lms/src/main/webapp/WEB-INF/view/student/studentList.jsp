<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>


<style>
.btn {
	float: right;
	line-height: 18px;
}
</style>

<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body">

	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(0)">관리자 페이지</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">학생
						관리</a></li>
			</ol>
		</div>
	</div>
	<!-- row -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-sm-9">
								<h4 class="card-title">학생 관리</h4>
							</div>
							<div class="col-sm-3">
							<c:if test="${user eq 'employee'}">
								<a href="/student/modifystudentList">
									<button type="button" class="btn btn-primary">수정하기</button>
								</a>
							</c:if>
							</div>
						</div>
						<br>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>학번</th>
										<th>학과</th>
										<th>이름</th>
										<th>주민번호</th>
										<th>나이</th>
										<th>성별</th>
										<th>전화번호</th>
										<th>이메일</th>
										<th>주소</th>
										<th>상세주소</th>
										<th>학적상태</th>
										<th>과대표여부</th>
										<th>장학여부</th>
										<th>계정상태</th>					
										<th>가입일</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="s" items="${studentList}">
										<tr>
											<td>${s.studentNo}</td>
											<td>${s.majorName}</td>
											<td>${s.studentName}</td>
											<td>${s.studentRegiNo}</td>
											<td>${s.studentAge}</td>
											<td>${s.studentGender}</td>
											<td>${s.studentTelephone}</td>
											<td>${s.studentEmail}</td>
											<td>${s.studentAddress}</td>
											<td>${s.studentDetailAddress}</td>
											<td>${s.studentState}</td>
											<td>${s.studentTop}</td>
											<td>${s.scholarName}</td>
											<td>${s.studentActive}</td>
											<td>${s.createDate}</td>
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




<!-- #/ container -->

<!--**********************************
            Content body end
        ***********************************-->


<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>
