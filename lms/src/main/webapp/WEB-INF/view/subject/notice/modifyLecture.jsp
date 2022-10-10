/lecture/modifyLecture<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                        <li class="breadcrumb-item"><a href="javascript:void(0)">과제</a></li>
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
                                    <form class="form-valide" action="${pageContext.request.contextPath}/lecture/modifyLecture?lectureNo=${lectureOne.lectureNo}&subjectApproveNo=${lectureOne.subjectApproveNo}" method="post">
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
                                                <input type="text" class="form-control" id="lectureTitle" name="lectureTitle" value="${lectureOne.lectureTitle}" placeholder="제목을 입력해주세요">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-2 col-form-label" for="lectureContent">내용<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-10">
                                                <textarea class="form-control" id="lectureContent" name="lectureContent" rows="5" placeholder="내용을 입력해주세요">${lectureOne.lectureContent}</textarea>
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
                                        
                                        
                                         <!--  파일 업로드  -->										
                                         <div class="form-group row"> 
                                         
                                         	<!--  기존 파일  -->
											<label class="col-lg-4 col-form-label" for="lectureContent">기존 파일: ${lectureOne.lectureOriginname}
												<input type="hiden" id="lectureFileNo" name="lectureFileNo" value="${lectureOne.lectureFileNo}">
								
								
                                            </label>	
                                            <!--  기존파일 삭제하는 쿼리 -->
                                            
                                            <!--  안내문 .. 인데 나 지금 하나만 가능함 ㅎ; -->                                        
	                                        <span style="font-size:11px; color: gray;">※첨부파일은 최대 10개까지 등록이 가능합니다.</span>
	                                        
	                                        <!--  새로운 파일  -->
	                                        <div class="input-group mb-3">
		                                            <div class="custom-file">
		                                                <input type="file" class="custom-file-input" value="파일첨부하기" name="newfile" id="newfile">
		                                                <label class="custom-file-label"> 파일을 첨부해주세요 </label>
		                                            </div>
		                                           
	                                        </div>
                                  		</div>
                                  
                                      
                                        
                                        <!--  수정 버튼  -->
                                        <div style="float:right">
                                        	<div>
												
					                            <button class="btn btn-primary" type="reset" name="deleteNoticeBtn">되돌리기</button>
		                                      	<a href="${pageContext.request.contextPath}/lecture/modifyLecture?lectureNo=${lectureOne.lectureNo}&subjectApproveNo=${lectureOne.subjectApproveNo}">
												<button type="submit" class="btn btn-primary">수정</button>
												</a>
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