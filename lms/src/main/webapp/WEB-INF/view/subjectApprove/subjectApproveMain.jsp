<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<style>
.btn-primary {
	width: 180px;
	height: 60px;
	margin-top: 23px;
	font-size: 20px
}
</style>

<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body">

	<div class="container-fluid mt-3">

		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
			                                <h4 class="card-title">${MyRegister.subjectName}</h4>
			                                <br>
			                                <ul class="nav nav-pills mb-3">
			                                 	<li class="nav-item"><a href="#navpills-2" class="nav-link" data-toggle="tab" aria-expanded="false">강의정보</a>
			                                    </li>
			                                    
			                                    
			                                    <li class="nav-item"><a href="#navpills-5" class="nav-link" data-toggle="tab" aria-expanded="true">과목공지사항</a>
			                                    </li>
			                                    
			                                    
			                                    <li class="nav-item"><a href="#navpills-1" class="nav-link active show" data-toggle="tab" aria-expanded="false">과제</a>
			                                    </li>
			                                    
			                                    <li class="nav-item"><a href="#navpills-6" class="nav-link" data-toggle="tab" aria-expanded="false">과제일람</a>
			                                    </li>
			                                    
			                                    <c:if test="${user eq 'professor'}"> 
				                                    <li class="nav-item"><a href="#navpills-3" class="nav-link" data-toggle="tab" aria-expanded="true">시험추가</a>
				                                    </li>
			                                    </c:if>
			                                    <li class="nav-item"><a href="#navpills-4" class="nav-link" data-toggle="tab" aria-expanded="true">출석체크</a>
			                                    </li>
			                                </ul>
			                                <div class="tab-content br-n pn">
			                                    <div id="navpills-1" class="tab-pane active show">
			                                        <div>
														<a href="${pageContext.request.contextPath}/lecture/getLectureList?subjectApproveNo=${MyRegister.subjectApproveNo}">
															<h4 class="mb-1">과제일람</h4>
														</a>
			                                        </div>
			                                    </div>
			                                    
			                                    
			                                    <div id="navpills-5" class="tab-pane">
			                                        <div>
														<a href="${pageContext.request.contextPath}/subject/notice/getSubjectNoticeList?subjectApproveNo=${MyRegister.subjectApproveNo}">
														<button type="submit" class="btn btn-primary">과목공지사항</button>
														</a>	
			                                        </div>
			                                    </div>
			                                    
			                                    
			                                    
			                                    
			                                    <div id="navpills-2" class="tab-pane">
													<div>
														<h4 class="mb-0">${MyRegister.subjectName}</h4>
														<p>교수: ${MyRegister.professorName} / 강의실:
															${MyRegister.subjectRoom} / 학점: ${MyRegister.subjectCredit} /
															요일: ${MyRegister.day}</p>
													</div>
			                                    </div>
			                                    
			                                    <!--  교수만 시험제출 보이게 -->
			                                   	<c:if test="${user eq 'professor'}"> 
			                                    <div id="navpills-3" class="tab-pane">
			                                        <div>
														<form action="${pageContext.request.contextPath}/test/addTestForm">
															<button type="submit" class="btn btn-primary">시험추가</button>
														</form>
			                                        </div>
			                                    </div>
			                                    </c:if>
			                                    
			                                    
			                                    <div id="navpills-4" class="tab-pane">
			                                        <div>
			                                        	<select class="custom-select mr-sm-2" id="inlineFormCustomSelect">
		                                                    <option selected="selected">Choose...</option>
		                                                    <option value="1">One</option>
		                                                    <option value="2">Two</option>
		                                                    <option value="3">Three</option>
                                                		</select>
                                                		
                                                		<br>
			                                        	
			                                        	<div class="table-responsive">
						                                    <table class="table table-bordered">
						                                        <thead>
						                                            <tr>
						                                                <th>#</th>
						                                                <th>소속학과</th>
						                                                <th>학생</th>
						                                                <th>출석일</th>
						                                                <th>출석상태</th>
						                                                <th>비고</th>
						                                            </tr>
						                                        </thead>
						                                        <tbody>
						                                        <c:forEach var="r" items="${registerStudentList}">
						                                            <tr>
						                                                <th>1</th>
						                                                <td>${r.majorName}(${r.majorNo})</td>
						                                                <td>${r.studentName}(${r.studentNo})</td>
						                                                <td>
						                                                	${r.attendanceDate}
						                                                </td>
						                                                <td>${r.attendanceState}</td>
						                                                <td>${r.attendanceEtc}</td>
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
				</div>
			</div>
		</div>

	<!-- #/ container -->
</div>
<!--**********************************
            Content body end
        ***********************************-->
<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>