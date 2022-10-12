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
	font-size
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	:
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	12px
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	;
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


		<div class="container-fluid">
			<div class="row">
				<div class="col-12">
					<div class="card">
						<div class="card-body">
							<div class="row">
								<div class="col-sm-9">
									<h4 class="card-title" style="font-size: 25px;">시험응시</h4>
									<br /> <br /> 
								</div>
							</div>
							<form action="${pageContext.request.contextPath}/addTest"
								method="post">
								<c:set var="i" value="1" />
								<c:forEach var="N" items="${testOne}">
									<c:if test="${i==5}">
										<c:set var="i" value="1" />
									</c:if>
									<c:if test="${i==1}">
										<div style="font-size: 25px;">${N.multiplechoice_question}
											&nbsp(${N.multiplechoice_score}점)</div>
										<br />
										<div style="font-size:20px">선택 : &nbsp
											<input type="radio" value="1" name="answerSelect"> 1 &nbsp
											<input type="radio" value="2" name="answerSelect"> 2 &nbsp
											<input type="radio" value="3" name="answerSelect"> 3 &nbsp
											<input type="radio" value="4" name="answerSelect"> 4 &nbsp
										</div>
										<br />
									</c:if>
									<br />
									<div style="font-size: 20px;">${i}.&nbsp
										${N.multiple_test_example_content}</div>
									<c:set var="i" value="${i+1}" />
									<br />
								</c:forEach>

								<button type="submit" class="btn btn-primary"
									style="float: right;">제출</button>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="/WEB-INF/template/footer.jsp"></c:import>