<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/status/studentStatus.js"></script>


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
                        <li class="breadcrumb-item"><a href="javascript:void(4)">재직/재학 상태</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">학생</a></li>
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
                               		<h4 class="card-title">학생 학적상태변경</h4>
                                </div>
                            </div>
                                <br>
                                <div class="table-responsive" style="width: 100%; overflow: auto;">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>학번</th>
                                                <th>소속학과 (학과이름)</th>
                                                <th>이름</th>
                                                <th>학적상태</th>
                                            </tr>
                                        </thead>
                                        
                                        <c:forEach varStatus="status" var="s" items="${studentStatusList}">
	                                        <form action="${pageContext.request.contextPath}/statusStudentAction?studentNo=${s.studentNo}"
	                                           method="post" id="updateStudentStatus${status.index}">
	                                            <tbody>
		                                            <tr>
		                                                <td>${s.studentNo}</td>
		                                                <td>${s.majorNo} (${s.majorName})</td>
		                                                <td>${s.studentName}</td>
		                                                <td>
		                                                	<select id="studentState" name="studentState">
		                                                		<option value="${s.studentState}" selected>
		                                                			${s.studentState}
		                                                		</option>
		                                                		<c:if test="${s.studentState eq '휴학'}">
		                                                			<option value="재적">재적</option>
		                                                			<option value="자퇴">자퇴</option>
		                                                			<option value="재학">재학</option>
		                                                		</c:if>
		                                                		<c:if test="${s.studentState eq '재적'}">
		                                                			<option value="휴학">휴학</option>
		                                                			<option value="자퇴">자퇴</option>
		                                                			<option value="재학">재학</option>
		                                                		</c:if>
		                                                		<c:if test="${s.studentState eq '자퇴'}">
		                                                			<option value="휴학">휴학</option>
		                                                			<option value="재적">재적</option>
		                                                			<option value="재학">재학</option>
		                                                		</c:if>
		                                                		<c:if test="${s.studentState eq '재학'}">
		                                                			<option value="휴학">휴학</option>
		                                                			<option value="재적">재적</option>
		                                                			<option value="자퇴">자퇴</option>
		                                                		</c:if>
		                                                	</select>
		                                                </td>
		                                                	<td>
		                                                		<button onclick="updateStudentStatus(${status.index})" type="button" class="btn btn-primary">변경</button>
		                                                	</td>
		                                            </tr>
	                                            </form>
	                                        </tbody>
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