<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<body>


        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">나의 강의실</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">과제</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">과제상세보기</a></li>
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
                                            <label class="col-lg-2 col-form-label" for="lectureNo">번호<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-10">
                                                <input type="text" class="form-control" id="lectureNo" name="lectureNo" value="${lectureOne.lectureNo}" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label" for="lectureTitle">제목<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-10">
                                                <input type="text" class="form-control" id="lectureTitle" name="lectureTitle" value="${lectureOne.lectureTitle}" placeholder="제목을 입력해주세요" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label" for="lectureContent">내용<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-10">
                                                <textarea class="form-control" id="lectureContent" name="lectureContent" rows="5" placeholder="내용을 입력해주세요" readonly="readonly">${lectureOne.lectureContent}</textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label" for="createDate">작성일<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-10">
                                                <input type="text" class="form-control" id="createDate" name="createDate" value="${lectureOne.createDate}" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label" for="updateDate">수정일<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-10">
                                                <input type="text" class="form-control" id="updateDate" name="updateDate" value="${lectureOne.updateDate}" readonly="readonly">
                                            </div>
                                        </div>
                                        <div style="float:right">
                                        	<div>
                                        	
                                        	<!-- 수정 삭제는 교수만 보이게 -->
                                        	<c:if test="${user eq 'professor'}"> 
												<a href="${pageContext.request.contextPath}/lecture/modifyLecture?lectureNo=${lectureOne.lectureNo}">
												<button type="button" class="btn btn-primary">수정</button>
												</a>
													<a href="${pageContext.request.contextPath}/lecture/removeLecture?lectureNo=${lectureOne.lectureNo}&subjectApproveNo=${lectureOne.subjectApproveNo}">
		                                        <button class="btn btn-primary" type="button" name="deleteNoticeBtn">삭제</button>
		                                    </a>
		                                    </c:if>
		                                    <!--  학생은 뒤로가기 버튼만 -->
		                                    
		                                    <c:if test="${user eq 'student'}"> 
		                                    	 <button class="btn btn-primary" type="button" name="backPage" id="backPage">뒤로가기</button>
		                                    </c:if>
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
    <!--**********************************
        Scripts
    ***********************************-->
    
    
    <!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>
    
    </body>
<script>
    
    $('#backPage').click(function() {
    	alert('이전화면으로 돌아갑니다!');
    	history.back();
    });
    
    
    
</script> 
    
    
    <script src="${pageContext.request.contextPath}/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/js/styleSwitcher.js"></script>


