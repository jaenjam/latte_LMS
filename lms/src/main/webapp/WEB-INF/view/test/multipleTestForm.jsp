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
				<div class="stepper-item completed">
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
									<h4 class="card-title">문제출제</h4>
									<!-- 시험출제 -->
								</div>
							</div>
							<br>
							<form action="${pageContext.request.contextPath}/addMultipleTest"
								method="post">
								<table class="table">
									<tr>
										<th class="align-middle" style="width: 20%">문제 내용</th>
										<td><input id="multipleChoiceQuestion"
											class="form-control" type="text"
											name=""></td>
									</tr>
									<tr>
										<th class="align-middle">정답</th>
										<td style="padding-top: 0.75rem; padding-bottom: 0.75rem;">
											<div class="row">
												<div class="col">
													<input class="" type="radio"
														name="" value="1"> 1번
												</div>
												<div class="col">
													<input class="" type="radio"
														name="" value="2"> 2번
												</div>
												<div class="col">
													<input class="" type="radio"
														name="" value="3"> 3번
												</div>
												<div class="col">
													<input class="" type="radio"
														name="" value="4"> 4번
												</div>
											</div>
										</td>
									</tr>
									<tr>
										<th class="align-middle">1번 보기</th>
										<td>
										<input type="hidden" value="1" name=""> 
										<input id="multipleChoiceExample1" class="form-control" type="text" name="multipleChoiceExampleList"></td>
									</tr>
									<tr>
										<th class="align-middle">2번 보기</th>
										<td>
										<input type="hidden" value="2" name=""> 
										<input id="multipleChoiceExample2"
											class="form-control" type="text"
											name="multipleChoiceExampleList"></td>
									</tr>
									<tr>
										<th class="align-middle">3번 보기</th>
										<td>
										<input type="hidden" value="3" name=""> 
										<input id="multipleChoiceExample3"
											class="form-control" type="text"
											name="multipleChoiceExampleList"></td>
									</tr>
									<tr>
										<th class="align-middle">4번 보기</th>
										<td><input type="hidden" value="4" name=""> 
										<input id="multipleChoiceExample4"
											class="form-control" type="text"
											name="multipleChoiceExampleList"></td>
									</tr>
									<tr><td><input type="hidden" value="10" name=""></td></tr>

									<tr>
										<td class="text-right" colspan="2"><button type="submit"
												class="btn btn-primary" style="float: right;">출제</button></td>
									</tr>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/template/footer.jsp"></c:import>