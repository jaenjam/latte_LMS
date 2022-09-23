<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>


<style>
	.btn {
		float:right;
		line-height: 18px;
	}
</style>


<div class="content-body" style="min-height: 876px;">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">FAQ(자주묻는질문)</a></li>
                    </ol>
                </div>
            </div>
            
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
	                            	<div class="col-sm-9">
	                               		<h4 class="card-title">FAQ</h4>
	                                </div>
	                                
	                            <c:if test="${user eq 'employee'}">
	                                <div class="col-sm-3">
	                                	<a href="${pageContext.request.contextPath}/faq/addFaqForm">
	                                		<button type="button" class="btn btn-primary">faq추가</button>
	                                	</a>
	                            	</div>
	                            </c:if>
	                            </div>
	                                <p class="text-muted">
	                                	<code></code>
	                                </p>
                                <div id="accordion-two" class="accordion">
	                                <c:forEach var="f" items="${faqList}">
	                                    <div class="card">
	                                        <div class="card-header">
	                                            <h5 class="mb-0" data-toggle="collapse" data-target="#collapseOne1" aria-expanded="true" aria-controls="collapseOne1">
	                                            	<i class="fa" aria-hidden="true"></i>
	                                            	${f.faqTitle}
	                                            </h5>
	                                        </div>
	                                        <div id="collapseOne1" class="collapse show" data-parent="#accordion-two" style="">
	                                            <div class="card-body">
	                                            	${f.faqContent}
		                                            <c:if test="${user eq 'employee'}">
		                                            	
		                                            	<!-- 삭제버튼 -->
		                                            	<a href="${pageContext.request.contextPath}/deleteFaq?faqNo=${f.faqNo}" data-toggle="tooltip" data-placement="top" title="" data-original-title="삭제">
		                                            		<i class="fa fa-close color-danger"></i>
		                                            		
		                                            	</a>
		                                            	
		                                            	<!-- 수정버튼 -->
			                                            <a href="${pageContext.request.contextPath}/faq/updateFaq?faqNo=${f.faqNo}" data-toggle="tooltip" data-placement="top" title="" data-original-title="수정">
			                                            	<i class="fa fa-pencil color-muted m-r-5"></i>
			                                            </a>
		                                            

		                                            </c:if>
	                                            </div>
	                                        </div>
	                                        
	                                    </div>
	                                </c:forEach>
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