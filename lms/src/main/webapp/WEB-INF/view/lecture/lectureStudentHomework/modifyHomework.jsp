<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

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
                        <li class="breadcrumb-item"><a href="javascript:void(0)">나의강의실</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">과제</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">과제제출</a></li>
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
                                    <form class="form-valide" action="${pageContext.request.contextPath}/lecture/lectureStudentHomework/modifyHomework" method="post" enctype="multipart/form-data">
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="lectureTitle"> 제목 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="homeworkTitle" name="homeworkTitle" value="${homeworkOne.homeworkTitle}">
                                            	<input type="hidden" id="pfHomeworkNo" name="pfHomeworkNo" value="${homeworkOne.pfHomeworkNo}">
                                            	<input type="hidden" id="subjectApproveNo" name="subjectApproveNo" value="${homeworkOne.subjectApproveNo}">
                                            	<input type="hidden" id="studentNo" name="studentNo" value="${No}">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="homeworkContent"> 내용 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <textarea class="form-control" id="homeworkContent" name="homeworkContent" rows="5"  >${homeworkOne.homeworkContent}</textarea>
                                            </div>
                                        </div>
                                        
                                        
                                        <!--  파일 업로드  -->
										<div class="form-group row"> 
											<!--  기존 파일  -->
											<label class="col-lg-4 col-form-label" for="lectureContent">기존 파일: ${lectureOne.lectureOriginname}
												<input type="hidden" id="lectureFileNo" name="lectureFileNo" value="${lectureOne.lectureFileNo}">
											</label>                                        
	                                        <span style="font-size:11px; color: gray;">※첨부파일은 최대 1개까지 등록이 가능합니다.</span>
	                                        
	                                        
	                                        <!-- 새로운파일 -->
	                                        <div class="input-group mb-3">
		                                            <div class="custom-file">
		                                                <input type="file" class="custom-file-input" value="파일첨부하기" name="newfile" id="newfile">
		                                                <label class="custom-file-label" id="filename"> 파일을 첨부해주세요 </label>
		                                            </div>		                                           
	                                        </div>
                                  		</div>
                                      
                                        
                                        <!--  버튼  -->
                                        <div style="float:right">		
                                         		<button class="btn btn-primary" type="reset" name="deleteNoticeBtn">되돌리기</button>									  					
                                                <button type="submit" class="btn btn-primary" id='addLecture' name='addHomework'>추가</button>
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
</body>


<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>

<script>

</script>
   
