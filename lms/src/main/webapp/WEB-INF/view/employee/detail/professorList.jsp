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
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">교수</a></li>
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
                               		<h4 class="card-title">교수 리스트</h4>
                                </div>
                            </div>
                                <br>
                                <div class="table-responsive" style="width: 100%; overflow: auto;">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>사번</th>
                                                <th>학과번호(학과이름)</th>
                                                <th>이름</th>
                                                <th>주민번호</th>
                                                <th>나이</th>
                                                <th>성별</th>
                                                <th>전화번호</th>
                                                <th>이메일</th>
                                                <th>주소</th>
                                                <th>상세주소</th>
                                                <th>교수실</th>
                                                <th>재직상태</th>
                                                <th>생성일</th>
                                                <th>수정일</th>
                                                <th>연봉등급</th>
                                                <th>연봉</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="p" items="${professorList}">
                                            <tr>
                                                <td>${p.professorNo}</td>
                                                <td>${p.majorNo}(${p.majorName})</td>
                                                <td>${p.professorName}</td>
                                                <td>${p.professorRegiNo}</td>
                                                <td>${p.professorAge}</td>
                                                <td>${p.professorGender}</td>
                                                <td>${p.professorTelephone}</td>
                                                <td>${p.professorEmail}</td>
                                                <td>${p.professorAddress}</td>
                                                <td>${p.professorDetailAddress}</td>
                                                <td>${p.professorRoom}</td>
                                                <td>${p.professorState}</td>
                                                <td>${p.createDate}</td>
                                                <td>${p.updateDate}</td>
                                                <td>${p.salaryNo}</td>
                                                <td>${p.salaryValue}</td>
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