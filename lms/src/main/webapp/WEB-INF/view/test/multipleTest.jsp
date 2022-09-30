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
			<li class="breadcrumb-item active">시험추가</li>
		</ol>
	</div>
</div>
<!-- row -->
<br />
<br />
<div>

	<div class="content-body">
		<div class="container">
			<div class="stepper-wrapper">
				<div class="stepper-item completed">
					<div class="step-counter">1</div>
					<div class="step-name">고사선택</div>
				</div>
				<div class="stepper-item active">
					<div class="step-counter">2</div>
					<div class="step-name">시험출제</div>
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
									<h4 class="card-title">중간/기말선택</h4>
								</div>
							</div>
							<br>
							<form action="${pageContext.request.contextPath}/addTest"
								method="post">
								<input type="hidden" name="subjectApproveNo"
									value="${subjectApproveNo}" readonly="readonly"
									class="form-control">
								<!-- test테이블에 subject_approve_no & test_name(중간/기말)만 받아줘야함  -->
								<table class="table table-hover">
									<thead>
										<!-- session값에 넣어줘서 그냥 빼주면됌 이거 hidden으로 가리고 join값으로 정보빼서 보여주기 -->
										<tr>
											<td><select name="testName" class="form-control">
													<option>== 고사선택 ==</option>
													<option value="중간">중간</option>
													<option value="기말">기말</option>
											</select></td>
										</tr>

									</thead>
								</table>

								<button type="submit" class="btn btn-primary"
									style="float: right;">다음</button>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/template/footer.jsp"></c:import>