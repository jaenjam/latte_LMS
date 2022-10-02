<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/question/question.js"></script>



        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">QnA</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">질문상세보기</a></li>
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
	                            			<h4>
	                            				<c:if test="${answerOne.answerTitle ne null}">
	                            					<span class="badge badge-pill badge-primary">답변완료</span>&nbsp;
	                            				</c:if>
	                            				<c:if test="${answerOne.answerTitle eq null}">
	                            					<span class="badge badge-pill badge-light">답변전</span>&nbsp;
		                            			</c:if>
		                            			
		                            			
		                            			${questionOne.questionTitle}
	                            			</h4>
	                            		</div>
	                            		<div class="col-sm-2" >
	                            			<p style="float:right;">${questionOne.createDate}</p>
	                            		</div>
                            		</div>
                            			<hr>
                            			<br>
                            		<div>
                            			 <p style="white-space:pre-line;">
                            			 	${questionOne.questionContent}
                            			 </p>
                            		</div>
                            			<br>
	                            </div>
	                        </div>
	                    </div>
	                  
	                <c:if test="${answerOne.answerTitle ne null}">
	                
	                <!-- 답변리스트 -->
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body" style="color:black">
                            	<br>
                            		<div class="row">
                            			<div class="col-sm-10">
	                            			<h4>
		                            			<span class="badge badge-pill badge-light">
		                            				관리자
		                            			</span>
		                            			${answerOne.answerTitle}
	                            			</h4>
	                            		</div>
	                            		<div class="col-sm-2" >
	                            			<p style="float:right;">${answerOne.createDate}</p>
	                            		</div>
                            		</div>
                            			<hr>
                            			<br>
                            		<div>
                            			 <p style="white-space:pre-line;">
                            			 	${answerOne.answerContent}
                            			 </p>
                            		</div>
                            			<br>
	                            </div>
	                        </div>
	                    </div>
	                
	                </c:if>
	                 
	                <!-- 관리자 댓글 입력기능 -->   
	                <c:if test="${user eq 'employee'}">
                    <div class="col-lg-12">
                        <div class="card">
                        	<div class="card-body" style="color:black">
                        		<div class="basic-form">
                                    <form action="${pageContext.request.contextPath}/insertAnswer?questionNo=${questionOne.questionNo}" method="post" id="addAnswer">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">답글제목</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="answerTitle" name="answerTitle" placeholder="답글제목을 작성해주세요.">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">답글내용</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="answerContent" name="answerContent" placeholder="답글제목을 작성해주세요.">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">작성자</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" value="(관리자)${Name}" id="answerWriter" name="answerWriter" readonly="readonly">
                                            </div>
                                        </div>
                                    </form>
	                              		<div style="float:right">
											<button onclick="question()" type="button"  class="btn btn-primary" id="addAnswerBtn">답글작성하기</button>
										</div>
									</div>
	                            </div>
	                        </div>
	                    </div>
	                    </c:if>
	                </div>
	            </div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->


<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>