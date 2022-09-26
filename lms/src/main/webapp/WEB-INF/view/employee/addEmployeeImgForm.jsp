<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- header.jsp -->
<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<div class="content-body">

	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">나의 정보</a></li>
				<li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/professor/addProfessorImgForm">사진파일추가</a></li>
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
								<h4 class="card-title">사진파일추가</h4>
							</div>

						</div>
						<br>
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>사번</th>
										<td><input type="text" class="form-control"
											name="employeeNo" id="No" readonly="readonly"
											value="${No}"></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>이미지파일</td>
										<td><input type="file" name="imgFile"></td>
									</tr>
								</tbody>
							</table>
							
								<form action="${pageContext.request.contextPath}/addEmployeeImg" method="post" enctype="multipart/form-data">
									<button type="submit" class="btn btn-primary" style="float: right;">파일등록</button>
								</form>
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- #/ container -->
</div>

<!-- footer -->
<c:import url="/WEB-INF/template/footer.jsp"></c:import>