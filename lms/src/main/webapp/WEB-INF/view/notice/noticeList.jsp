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
	
	.input-group .input-group-text {
    	font-size: 1.375rem;
   
	}
	
	.content-body{
   		min-width: 1050px;
   	}
    


</style>

 <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(4)">공지</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">공지사항</a></li>
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
                               		<h4 class="card-title">공지사항</h4>
                                </div>
                                <div class="col-sm-3">
	                                <c:if test="${user eq 'employee'}">
	                                	<a href="${pageContext.request.contextPath}/notice/addNoticeForm">
	                                		<button type="button" class="btn btn-primary">공지추가</button>
	                                	</a>
	                                </c:if>
                            	</div>
                            </div>
                                <br>
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>번호</th>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>작성일</th>
                                                <th>수정일</th>
                                                <th>조회수</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="N" items="${noticeList.content}">
                                            <tr>
                                                <td>${N.noticeNo}</td>
                                                <td>
                                                	<a href="${pageContext.request.contextPath}/notice/noticeOne?noticeNo=${N.noticeNo}">
                                                		${N.noticeTitle}
                                                	</a>
                                                </td>
                                                <td>${N.noticeWriter}</td>
                                                <td>${N.createDate}</td>
                                                <td>${N.updateDate}</td>
                                                <td>
                                                	${N.count}
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                <br>
	                            <div class="form-group">
	                            	<div class="row" >
	                            		<div class="col-sm-7" style="margin: 0 0 0 240px">
	                                		<input type="text" class="form-control input-rounded" placeholder="검색어를 입력해주세요!">
	                                	</div>
	                                	<div class="col-sm-1">
											<div class="input-group icons">
												<div class="input-group-prepend">
													<span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1">
														<i class="mdi mdi-magnify"></i>
													</span>
												</div>
											</div>
	                                	</div>
	                                	<div class="col-lg-12">
				                            <div class="card-body">
				                                <div class="bootstrap-pagination">
				                                    <nav>
				                                        <ul class="pagination justify-content-center">
				                                            <li class="page-item disabled"><a class="page-link" href="#" tabindex="-1">Previous</a>
				                                            </li>
				                                            <li class="page-item"><a class="page-link" href="#">1</a>
				                                            </li>
				                                            <li class="page-item"><a class="page-link" href="#">2</a>
				                                            </li>
				                                            <li class="page-item"><a class="page-link" href="#">3</a>
				                                            </li>
				                                            <li class="page-item"><a class="page-link" href="#">Next</a>
				                                            </li>
				                                        </ul>
				                                    </nav>
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