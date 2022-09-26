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
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">과목</a></li>
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
                               		<h4 class="card-title">과목 리스트</h4>
                                </div>
                            </div>
                                <br>
                                <div class="table-responsive" style="width: 100%; overflow: auto;">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>과목코드</th>
                                                <th>과목명</th>
                                                <th>개설상태</th>
                                                <th>학점</th>
                                                <th>전필여부</th>
                                                <th>개설날짜</th>
                                                <th>폐강날짜</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="s" items="${subjectList}">
                                            <tr>
                                                <td>${s.subjectNo}</td>
                                                <td>${s.subjectName}</td>
                                                <td>${s.subjectState}</td>
                                                <td>${s.subjectCredit}</td>
                                                <td>${s.subjectMajor}</td>
                                                <td>${s.createDate}</td>
                                                <td>${s.endDate}</td>
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