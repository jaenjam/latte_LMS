<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
                            	
                               		<h4 class="card-title"> 과제 </h4>
                                </div>
                                <div class="col-sm-3">
                                    <!--  교수만 과제추가버튼 보이게  --> 
                                    <c:if test="${user eq 'professor'}"> 
                                	<a href="${pageContext.request.contextPath}/lecture/addLectureForm?subjectApproveNo=${approveNo}">
                                		<button type="button" class="btn btn-primary">과제추가</button>
                                	</a>
                                	</c:if>
                            	</div>
                            </div>
                                <br>
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>번호</th>
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>작성일</th>
                                                <th>수정일</th>
                                                <th>조회수</th>

                                                    
                                                        
                                                    
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="L" items="${lectureList.content}" varStatus="status">
                                            <tr>
                                            	<td>${lectureList.totalElements - (lectureList.pageable.pageNumber*lectureList.pageable.pageSize+status.index) }</td>
                                               	<!-- <td>${L.lectureNo}</td> -->
                                                <td>
                                                	<a href="${pageContext.request.contextPath}/lecture/getLectureOne?lectureNo=${L.lectureNo}">
                                                		${L.lectureTitle}
                                                	</a>
                                                </td>
                                                <td> ${L.subjectApprove.professor.professorName} </td> <!-- subjectApprove로 professor끌어오고 그 안에  -->                                         
                                                <td> ${L.subjectApprove.professor.createDate} </td>                                                
                                                <td> ${L.subjectApprove.professor.updateDate} </td>
                                                <td> ${L.count} </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                       
                                    </table>
                                    
                                    
                                    <!--  하단에 페이징 넘버 10개씩만 뽑기 위함 -->
                                    <fmt:formatNumber value="${lectureList.pageable.pageNumber/10 }" pattern="0" var="tempNum"></fmt:formatNumber>
                                    <c:set var="beginNum" value="${tempNum*10+1 }">
                                    </c:set>
                                    <c:set var="endNum" value="${lectureList.totalPages-(tempNum*10) }"/>
                                    <c:choose>
                                    	<c:when test="${endNum lt 10 }">
                                    		<c:set var="endNum" value="${lectureList.totalPages }"/>
                                    	</c:when>
                                    	<c:otherwise>
                                    		<c:set var="endNum" value="${tempNum*10+10 }"/>
                                    	</c:otherwise>
                                    </c:choose>
                                    
 	                                   
                               
                                    
                                    
                                    
                                    
                                     	<div class="col-lg-12">
				                            <div class="card-body">
				                                <div class="bootstrap-pagination">
				                                    <nav>
					                                        <ul class="pagination justify-content-center">
					                                            <li class="page-item disabled">
					                                            <c:if test="${lectureList.pageable.pageNumber gt 10}">
					                                            <a class="page-link" href="#" tabindex="-1">Previous</a>
					                                            </c:if>
					                                            </li>
					                                            
						                                            <c:forEach var="P" begin="${beginNum }" end="${endNum}" varStatus="status">
							                                            <li class="page-item <c:if test="${lectureList.pageable.pageNumber+1 eq status.index}">active</c:if>">
							                                            <a class="page-link " href="${pageContext.request.contextPath}/lecture/getLectureList?page=${status.index}&subjectApproveNo=${approveNo}" value=${status.index}>${status.index}
							                                            </a>
							                                            </li>
						                                        	</c:forEach>
					                                           																										
					                                            <c:if test="${lectureList.totalPages - tempNum*10 gt 10}">
					                                            	<a class="page-link" href="#" tabindex="-1">Next</a>
					                                            </c:if>
					                                            
					                                        </ul>
				                                    </nav>
				                                </div>
				                            </div>
	                                	</div>
                                    
                                    
                                    
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
</body>
</html>