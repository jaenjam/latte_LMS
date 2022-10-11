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
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">과목공지사항</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">과목공지사항작성</a></li>
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
                                    <form class="form-valide" action="${pageContext.request.contextPath}/subject/notice/addSubjectNoticeForm" method="post" enctype="multipart/form-data">
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="lectureTitle">제목<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="subjectNoticeTitle" name="subjectNoticeTitle" placeholder="제목을 입력해주세요">
                                            	<input type="hidden" id="subjectApproveNo" name="subjectApproveNo" value="${subjectApproveNo}">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="lectureContent">내용<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <textarea class="form-control" id="subjectNoticeContent" name="subjectNoticeContent" rows="5" placeholder="내용을 입력해주세요"></textarea>
                                            </div>
                                        </div>
                                        
                                         <div class="form-group row">
                                          <div class="col-lg-6" id="imagePreview">
                                           <input style="display: block;" type="file" name ="file" id="inputImage" accept="image/*">
                                           
                                            <img style="width: 500px;" id="preview-image">
                                               <img id="img" />
                                            </div>
                                         </div>
                                        
                                        
                                      
                                        
                                        <!--  버튼  -->
                                        <div style="float:right">											  					
                                                <button type="submit" class="btn btn-primary" id='addSubjectNotice' name='addSubjectNotice'>추가</button>
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

<script type="text/javascript" src="/js/jquery/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/subject/addSubjectNoticeForm.js"></script>
<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>

<script>
</script>
   
