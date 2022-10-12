<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/status/employeeStatus.js"></script>

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
                        <li class="breadcrumb-item"><a href="javascript:void(4)">재직상태</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">관리자</a></li>
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
                               		<h4 class="card-title">관리자 재직상태변경</h4>
                                </div>
                            </div>
                                <br>
                                <div class="table-responsive" style="width: 100%; overflow: auto;">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>사번</th>
                                                <th>이름</th>
                                                <th>관리자</th>
                                                <th>재직상태</th>
                                            </tr>
                                        </thead>
                                        
                                        <c:forEach varStatus = "status" var="e" items="${EmployeeStatusList}">
                                           <form action="${pageContext.request.contextPath}/statusEmployeeAction?employeeNo=${e.employeeNo}"
                                           method="post" id="updateEmployeeStatus${status.index}">
	                                            <tbody>
	                                            <tr>
	                                                <td>${e.employeeNo}</td>
	                                                <td>${e.employeeName}</td>
	                                                <td>${e.employeeActive}</td>
	                                                <td>
	                                                	<select id="employeeState" name="employeeState">
	                                                		<option value="${e.employeeState}" selected>
	                                                			${e.employeeState}
	                                                		</option>
	                                                		<c:if test="${e.employeeState eq 'Y'}">
	                                                			<option value="N">N</option>
	                                                		</c:if>
	                                                		<c:if test="${e.employeeState eq 'N'}">
	                                                			<option value="Y">Y</option>
	                                                		</c:if>
	                                                	</select>
	                                                </td>
	                                                	<td>
	                                                		<button onclick="updateEmployeeStatus(${status.index})" type="button" class="btn btn-primary">변경</button>
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