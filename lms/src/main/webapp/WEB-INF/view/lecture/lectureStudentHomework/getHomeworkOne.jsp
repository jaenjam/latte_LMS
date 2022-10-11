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
                                    <form class="form-valide">
                                      
                                           
                                    <div class="row">
                            			<div class="col-sm-10">
	                            			<h4>${homeworkOne.homeworkTitle}</h4>
	                            		</div>
	                            	
                            		</div>
                            			<hr>
                            			<br>
                            		<div>
                            			 <p style="white-space:pre-line;">
                            			 	${homeworkOne.pfHomeworkNo}
                            			 </p>
                            		</div>
                            		
                            		
                            		
                            		<div class="row">
                                        	 <label class="col-lg-2 col-form-label" for="updateDate">
                                        	 	파일이름                                         	 	
                                        	 	<a href="${pageContext.request.contextPath}/lecture/downloadLecture?fileName=${homeworkOne.homeworkFileName}&lectureNo=${homeworkOne.lectureNo}">${homeworkOne.lectureOriginname}</a>
                                        	 </label>
                                     </div>
                                      	<br>
                                        
                                        
                                        
                                        <!--  버튼  -->
                                        <div style="float:right">
                                        <a href="${pageContext.request.contextPath}/lecture/lectureStudentHomework/modifyHomework?pfHomeworkNo=${homeworkOne.pfHomeworkNo}&subjectApproveNo=${homeworkOne.subjectApproveNo}">										  					
                                                <button type="submit" class="btn btn-primary" id='addLecture' name='addHomework'>수정하기</button>
                                                </a>	
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
   
