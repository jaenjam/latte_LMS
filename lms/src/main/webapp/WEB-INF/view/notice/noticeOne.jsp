<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>




        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">공지</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">공지사항</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">공지사항상세보기</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->
			
			
			
			
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body" style="color:black">
                            	<br>
                            		<div class="row">
                            			<div class="col-sm-10">
	                            			<h4>${noticeOne.noticeTitle}</h4>
	                            		</div>
	                            		<div class="col-sm-2" >
	                            			<p style="float:right;">${noticeOne.createDate}</p>
	                            		</div>
                            		</div>
                            			<hr>
                            			<br>
                            		<div>
                            			 <p style="white-space:pre-line;">
                            			 	${noticeOne.noticeContent}
                            			 </p>
                            		</div>
                            			<br>
	                              	<div style="float:right">
										<a href="${pageContext.request.contextPath}/notice/updateNotice?noticeNo=${noticeOne.noticeNo}">
											<button type="button" class="btn btn-primary">공지수정</button>
										</a>
										<a href="${pageContext.request.contextPath}/deleteNotice?noticeNo=${noticeOne.noticeNo}">
	                                        <button class="btn btn-primary" type="button" name="deleteNoticeBtn">공지삭제</button>
	                                    </a>
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