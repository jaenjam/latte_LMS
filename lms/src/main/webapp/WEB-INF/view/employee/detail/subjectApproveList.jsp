<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.table {
	white-space: nowrap;
}
</style>

<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body">

	<div class="row page-titles mx-0">
		<div class="col p-md-0">
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="javascript:void(4)">과목관리</a></li>
				<li class="breadcrumb-item active"><a href="javascript:void(0)">과목승인</a></li>
				
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
								<h4 class="card-title">과목승인 리스트</h4>
							</div>
						</div>
						<br>
						<div class="table-responsive" style="width: 100%; overflow: auto;">

							<table class="table table-hover">
								<thead>
									<tr>
										<th>승인번호</th>
										<th>학과번호 (학과명)</th>
										<th>과목번호 (과목명)</th>
										<th>담당교수사번 (교수명)</th>
										<th>년도</th>
										<th>학기</th>
										<th>개강일</th>
										<th>종강일</th>
										<th>총수업일수</th>
										<th>개설과목승인</th>
										<th>강의실</th>
										<th>요일</th>
										<th>시작시간</th>
										<th>종료시간</th>
									</tr>
								</thead>
								<c:forEach var="a" items="${subjectApproveList}">
									<form action="${pageContext.request.contextPath}/modifySubjectApprove?subjectApproveNo=${a.subjectApproveNo}" method="post">
									<tbody>

										<tr>
											<td>${a.subjectApproveNo}</td>
											<td>${a.majorNo}(${a.majorName})</td>
											<td>${a.subjectNo}(${a.subjectName})</td>
											<td>${a.professorNo}(${a.professorName})</td>
											<td>
												<c:if test = "${a.year eq null}">
													<input type="text" name="year" id="year" value="${a.year}" style="width:36px;height:20px;font-size:13px;">
												</c:if>
												<c:if test = "${a.year != null}">
													${a.year}
												</c:if>
											</td>
											<td>
											<c:if test = "${a.semester eq null}">
												<input type="text" name="semester" id="semester" value="${a.semester}" style="width:36px;height:20px;font-size:13px;">
											</c:if>
											<c:if test = "${a.semester != null}">
												<input type="text" name="semester" id="semester" value="${a.semester}" style="width:36px;height:20px;font-size:13px;">
											</c:if>
											<td>${a.startDate}</td>
											<td>${a.endDate}</td>
											<td>${a.totalDate}</td>
											<td>
											<select id="approveActive" name="approveActive">
													<c:forEach items="${a.approveActive}">
														<c:if test="${a.approveActive == 'Y'}">
															<option value="${a.approveActive}" selected>${a.approveActive}</option>
															<option value="N">N</option>
														</c:if>
														
														<c:if test="${a.approveActive == 'N'}">
															<option value="${a.approveActive}" selected>${a.approveActive}</option>
															<option value="Y">Y</option>
														</c:if>
													</c:forEach>
											</select>
											</td>
											<td>
												<c:if test = "${a.subjectRoom eq null}">
												<input type="text" name="subjectRoom" value="${a.subjectRoom}" style="width:65px;height:20px;font-size:13px;">
												</c:if>
													<c:if test = "${a.subjectRoom != null}">
												<input type="text" name="subjectRoom" value="${a.subjectRoom}" style="width:65px;height:20px;font-size:13px;">
												</c:if>
											</td>
											<td>
											<select id="subjectDay" name="subjectDay">
												<c:forEach items="${a.day}">
													<c:if test = "${a.day eq null}">
														<option value ="월" selected>월</option>
														<option value ="화">화</option>
														<option value ="수">수</option>
														<option value ="목">목</option>
														<option value ="금">금</option>
													</c:if>
													<c:if test="${a.day == '월'}">
														<option value ="${a.day}" selected>${a.day}</option>
														<option value ="화">화</option>
														<option value ="수">수</option>
														<option value ="목">목</option>
														<option value ="금">금</option>
													</c:if>
													
													<c:if test="${a.day == '화'}">
														<option value ="월">월</option>
														<option value ="${a.day}" selected>${a.day}</option>
														<option value ="수">수</option>
														<option value ="목">목</option>
														<option value ="금">금</option>
													</c:if>
													
													<c:if test="${a.day == '수'}">
														<option value ="월">월</option>
														<option value ="화">화</option>
														<option value ="${a.day}" selected>${a.day}</option>
														<option value ="목">목</option>
														<option value ="금">금</option>
													</c:if>
													
													<c:if test="${a.day == '목'}">
														<option value ="월">월</option>
														<option value ="화">화</option>
														<option value ="수">수</option>
														<option value ="${a.day}" selected>${a.day}</option>
														<option value ="금">금</option>
													</c:if>
													
													<c:if test="${a.day == '금'}">
														<option value ="월">월</option>
														<option value ="화">화</option>
														<option value ="수">수</option>
														<option value ="목">목</option>
														<option value ="${a.day}" selected>${a.day}</option>
													</c:if>
												 </c:forEach>
											</select>
											</td>
											<td>
												<c:if test = "${a.startTime eq null}">
												<input type="text" name="startTime" id="startTime" value="${a.startTime}" style="width:20px;height:20px;font-size:13px;">
												</c:if>
												<c:if test = "${a.startTime != null}">
												<input type="text" name="startTime"  id="startTime" value="${a.startTime}" style="width:20px;height:20px;font-size:13px;">
												</c:if>
										
											</td>
											
											<td>
											<c:if test = "${a.endTime eq null}">
												<input type="text" name="endTime" id="endTime" value="${a.endTime}" style="width:20px;height:20px;font-size:13px;">
											</c:if> 
											<c:if test = "${a.endTime != null}">
												<input type="text" name="endTime" id="endTime" value="${a.endTime}" style="width:20px;height:20px;font-size:13px;">
											</c:if> 
											
											</td>
											
											<td>
												<button type="submit" class="btn btn-primary">변경</button>
											</td>
										</tr>
									</tbody>
									</form>
								</c:forEach>
							</table>
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