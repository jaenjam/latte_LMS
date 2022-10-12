<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->
<c:import url="/WEB-INF/template/header.jsp"></c:import>


<!-- sidebar.jsp -->
<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>


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
							<form>
								<input id="student_no" value="${No}" type="hidden">
								<c:set var="i" value="1" />
								<c:forEach var="N" items="${testOne}" varStatus="status">
									<c:if test="${i==5}">
										<c:set var="i" value="1" />
									</c:if>


									<c:if test="${i==1}">
										<input id="multiple_question_no_${status.index}" value="${N.multiplechoice_no}" type="hidden">
										<div style="font-size: 25px;">${N.multiplechoice_question}
											&nbsp;(${N.multiplechoice_score}점)</div>
										<br />
										<div style="font-size:20px">선택 : &nbsp;
											<input name="answer_radio${status.index}" type="radio" value="1" name="answerSelect"> 1 &nbsp;
											<input name="answer_radio${status.index}" type="radio" value="2" name="answerSelect"> 2 &nbsp;
											<input name="answer_radio${status.index}"type="radio" value="3" name="answerSelect"> 3 &nbsp;
											<input name="answer_radio${status.index}" type="radio" value="4" name="answerSelect"> 4 &nbsp;
										</div>
										<br />
									</c:if>

									<br />

									<div style="font-size: 20px;">${i}.&nbsp;
										${N.multiple_test_example_content}</div>
									<c:set var="i" value="${i+1}" />

									<br />


								</c:forEach>

								<button onclick="answerSubmit()" type="button" class="btn btn-primary"
									style="float: right;">제출</button>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/doMultipleTest.js"></script>

<c:import url="/WEB-INF/template/footer.jsp"></c:import>