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
                            <div class="card-body">
                                <div class="form-validation">
                                    <form class="form-valide" action="${pageContext.request.contextPath}/noticeOne" method="post">
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label" for="noticeNo">번호<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-10">
                                                <input type="text" class="form-control" id="noticeNo" name="noticeNo" value="${noticeOne.noticeNo}" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label" for="noticeTitle">제목<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-10">
                                                <input type="text" class="form-control" id="noticeTitle" name="noticeTitle" value="${noticeOne.noticeTitle}" placeholder="제목을 입력해주세요">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label" for="noticeContent">내용<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-10">
                                                <textarea class="form-control" id="noticeContent" name="noticeContent" rows="5" placeholder="내용을 입력해주세요">${noticeOne.noticeContent}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label" for="createDate">작성일<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-10">
                                                <input type="text" class="form-control" id="createDate" name="createDate" value="${noticeOne.createDate}" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label" for="updateDate">수정일<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-10">
                                                <input type="text" class="form-control" id="updateDate" name="updateDate" value="${noticeOne.updateDate}" readonly="readonly">
                                            </div>
                                        </div>
                                        <div style="float:right">
                                        	<div>
												<button type="button" class="btn btn-primary">수정</button>
												<button type="button" class="btn btn-primary">삭제</button>
											</div>
										</div>
                                    </form>
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