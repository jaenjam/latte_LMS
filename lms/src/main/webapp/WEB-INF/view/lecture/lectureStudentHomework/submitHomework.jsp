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
                                    <form class="form-valide" action="${pageContext.request.contextPath}/lecture/lectureStudentHomework/submitHomework" method="post" enctype="multipart/form-data">
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="lectureTitle"> 제목 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="homeworkTitle" name="homeworkTitle" placeholder="제목을 입력해주세요">
                                            	<input type="hidden" id="subjectApproveNo" name="subjectApproveNo" value="${subjectApproveNo}">
                                            	<input type="hidden" id="lectureNo" name="lectureNo" value="${lectureNo}">
                                            	<input type="hidden" id="studentNo" name="studentNo" value="${No}">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="homeworkContent"> 내용 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <textarea class="form-control" id="homeworkContent" name="homeworkContent" rows="5" placeholder="내용을 입력해주세요"></textarea>
                                            </div>
                                        </div>
                                        
                                        
                                        <!--  파일 업로드  -->
										<div class="form-group row"> 
											<label class="col-lg-4 col-form-label" for="lectureContent">첨부파일
                                            </label>	                                        
	                                        <span style="font-size:11px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span>
	                                        <div class="input-group mb-3">
		                                            <div class="custom-file">
		                                                <input type="file" class="custom-file-input" value="파일첨부하기" name="file" id="file">
		                                                <label class="custom-file-label"> 파일을 첨부해주세요 </label>
		                                            </div>		                                           
	                                        </div>
                                  		</div>
                                      
                                        
                                        <!--  버튼  -->
                                        <div style="float:right">											  					
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
   
