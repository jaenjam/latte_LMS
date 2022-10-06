<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<style>
	.btn {
		float:right;
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
                        <li class="breadcrumb-item"><a href="javascript:void(4)">상세관리</a></li>
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
                                                <th>담당교수사번 (교수이름)</th>
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
                                        <tbody>
                                        <c:forEach var="a" items="${subjectApproveList}">
                                            <tr>
                                            	<td>${a.subjectApproveNo}</td>
                                            	<td>${a.majorNo} (${a.majorName})</td>
                                                <td>${a.subjectNo} (${a.subjectName})</td>
                                                <td>${a.professorNo} (${a.professorName})</td>
                                                <td>${a.year}</td>
                                                <td>${a.semester}</td>
                                                <td>${a.startDate}</td>
                                                <td>${a.endDate}</td>
                                                <td>${a.totalDate}</td>
                                                <td><select id="approveActive" name="approveActive">
													<option value="${a.approveActive}" selected>
														${a.approveActive}</option>
														<c:if test="${a.approveActive eq 'Y'}">
														<option value="N">N</option>
														</c:if>
														<c:if test="${a.approveActive eq 'N'}">
														<option value="Y">Y</option>
														</c:if>
											</select></td>
                                                <td>${a.approveActive}</td>
                                                <td>${a.subjectRoom}</td>
                                                <td>${a.day}</td>
                                                <td>${a.startTime}</td>
                                                <td>${a.endTime}</td>
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
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
 

 
        
<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>