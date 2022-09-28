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
                            <div class="card-body" style="color:black">
                            	<br>
                            		<div class="row">
                            			<div class="col-sm-10">
	                            			<h4>${lectureOne.lectureTitle}</h4>
	                            		</div>
	                            		<div class="col-sm-2" >
	                            			<p style="float:right;">${lectureOne.count}</p>
	                            		</div>
                            		</div>
                            			<hr>
                            			<br>
                            		<div>
                            			 <p style="white-space:pre-line;">
                            			 	${lectureOne.lectureContent}
                            			 </p>
                            		</div>
                            			<br>
                            		<div class="row">
                                        	 <label class="col-lg-2 col-form-label" for="updateDate">
                                        	 	파일이름                                         	 	
                                        	 	<a href="${pageContext.request.contextPath}/lecture/downloadLecture?fileName=${lectureOne.lectureFilename}&lectureNo=${lectureOne.lectureNo}">${lectureOne.lectureOriginname}</a>
                                        	 </label>
                                     </div>
                                      	<br>
                            			
                            			
	                              	<div style="float:right">
		                              	<c:if test="${user eq 'professor'}"> 
											<a href="${pageContext.request.contextPath}/lecture/modifyLecture?lectureNo=${lectureOne.lectureNo}">
												<button type="button" class="btn btn-primary"> 수정 </button>
												</a>
											<a href="${pageContext.request.contextPath}/lecture/removeLecture?lectureNo=${lectureOne.lectureNo}&subjectApproveNo=${lectureOne.subjectApproveNo}">
		                                        <button class="btn btn-primary" type="button" name="deleteNoticeBtn"> 삭제 </button>
		                                    </a>
		                                </c:if>
		                                
		                                 <c:if test="${user eq 'student'}"> 
		                                    	 <button class="btn btn-primary" type="button" name="backPage" id="backPage"> 뒤로가기 </button>
		                                 		
		                                 		<!-- 과제제출 -->
			                                 	<a href="${pageContext.request.contextPath}/lectureStudentHomework/submitHomework?lectureNo=${lectureOne.lectureNo}">
													<button type="button" class="btn btn-primary"> 과제제출 </button>
												</a>
		                                 
		                                 </c:if> 
		                                
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


