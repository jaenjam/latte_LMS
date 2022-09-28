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
                                                <th>소속학과번호 (학과이름)</th>
                                                <th>이름</th>
                                                <th>재직상태</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="p" items="${professorStatusList}">
                                            <tr>
                                                <td>${p.professorNo}</td>
                                                <td>${p.majorNo} (${p.majorName})</td>
                                                <td>${p.professorName}</td>
                                                <td>
                                                	<select id="professorState" name="professorState">
                                                		<option value="${p.professorState}" selected>
                                                			${p.professorState}
                                                		</option>
                                                		<c:if test="${p.professorState eq 'Y'}">
                                                			<option value="N">N</option>
                                                		</c:if>
                                                		<c:if test="${p.professorState eq 'N'}">
                                                			<option value="Y">Y</option>
                                                		</c:if>
                                                	</select>
                                                </td>
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