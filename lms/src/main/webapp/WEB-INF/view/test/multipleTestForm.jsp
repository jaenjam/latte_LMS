<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->
<c:import url="/WEB-INF/template/header.jsp"></c:import>
<!-- sidebar.jsp -->
<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<style>
.stepper-wrapper {
	margin-top: auto;
	display: flex;
	justify-content: space-between;
	margin-bottom: 20px;
}

.stepper-item {
	position: relative;
	display: flex;
	flex-direction: column;
	align-items: center;
	flex: 1;
	@media
	(
	max-width
	:768px)
{
	font-size:12px;
}

}
.stepper-item::before {
	position: absolute;
	content: "";
	border-bottom: 2px solid #ccc;
	width: 100%;
	top: 20px;
	left: -50%;
	z-index: 2;
}

.stepper-item::after {
	position: absolute;
	content: "";
	border-bottom: 2px solid #ccc;
	width: 100%;
	top: 20px;
	left: 50%;
	z-index: 2;
}

.stepper-item .step-counter {
	position: relative;
	z-index: 5;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background: #ccc;
	margin-bottom: 6px;
}

.stepper-item.active {
	font-weight: bold;
}

.stepper-item.completed .step-counter {
	background-color: #4bb543;
}

.stepper-item.completed::after {
	position: absolute;
	content: "";
	border-bottom: 2px solid #4bb543;
	width: 100%;
	top: 20px;
	left: 50%;
	z-index: 3;
}

.stepper-item:first-child::before {
	content: none;
}

.stepper-item:last-child::after {
	content: none;
}


</style>

<div class="row page-titles mx-0">

	<div class="col p-md-0">
		<ol class="breadcrumb">
			<li class="breadcrumb-item">강의</li>
			<li class="breadcrumb-item active"><a
				href="${pageContext.request.contextPath}/professor/addProfessorImgForm">시험추가</a></li>
		</ol>
	</div>
</div>
<!-- row -->
<br />
<br />
<div class="content-body">
	<div class="container">
		<div class="stepper-wrapper">
			<div class="stepper-item completed">
				<div class="step-counter">1</div>
				<div class="step-name">고사선택</div>
			</div>
			<div class="stepper-item completed">
				<div class="step-counter">2</div>
				<div class="step-name">문제추가</div>
			</div>
			<div class="stepper-item active">
				<div class="step-counter">3</div>
				<div class="step-name">Third</div>
			</div>
			<div class="stepper-item">
				<div class="step-counter">4</div>
				<div class="step-name">Forth</div>
			</div>
		</div>
	</div>
	<br /> <br />

	<div class="container-fluid">
		<div class="row">
			<div class="col-12">
				<div class="card">
					<div class="card-body">
						<div class="row">
							<div class="col-sm-9">
								<h4 class="card-title">문제추가</h4>
							</div>

						</div>
						<br>
						<form action="${pageContext.request.contextPath}/addMultipleTest"
							method="post">
							<c:forEach var="T" items="${testList}">
								<div class="row">
									<div class="col-sm-11">
										<h3>${T.major_name}:
											${T.subject_name}(${T.year}년${T.semester} ${T.test_name}고사)</h3>
									</div>
									<div class="col-sm-1">
										<h3 style="font-size: 20px;">${T.professor_name}교수</h3>
									</div>
								</div>

								<input type="hidden" name="TestNo" class="form-control">
								<table class="table table-hover">
									<thead>
										<tr>
											<td>문제 :</td>
											<td><input type="text" name="multiplechoiceQuestion"
												class="form-control"></td>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>보기번호</td>
											<td><input type="text" name="" class="form-control"></td>
											<td>보기내용</td>
											<td><input type="text" class="form-control"></td>
										</tr>
									</tbody>
								</table>
								<button type="submit" class="btn btn-primary"
									style="float: right;">다음</button>
							</c:forEach>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/template/footer.jsp"></c:import>