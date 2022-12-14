<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<!--  듣고있는 강의 리스트 / 평가제출여부 -->

<!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">나의 강의실</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">수강평가</a></li>
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
                            	
                               		<h4 class="card-title"> 교수평가 </h4>
                                </div>
                                <div class="col-sm-3">
                                 
                            	</div>
                            </div>
                                <br>
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                               	<th>년도</th>
                                                <th>학기</th>
                                                <th>학점</th>  
                                                <th>교수</th>
                                                <th>과목명</th>
                                                <th>평가여부</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                      
                                        <c:forEach var="L" items="${registerList}">
                                            <tr>
                                           		<td>${L.yearS}</td>
                                                <td>${L.semesterS}</td>
                                                <td>${L.subjectCredit}</td>
                                                <td> ${L.professorName} </td>
                                                <td>
                                                	<!--  강의 상세정보 -->
                                                	<a href="${pageContext.request.contextPath}/lecture/getLectureOne?lectureNo=${L.lectureNo}">
                                                		${L.subjectName}
                                                	</a>
                                                </td>
                                              <td>
                                               		<c:if test="${L.professorAssessCk == 'N'}">
                                               			N
                                                	</c:if>
                                                	
                                                	<c:if test="${L.professorAssessCk == null}">
                                                		N
                                                	</c:if>
                                                	
                                                	 <c:if test="${L.professorAssessCk == 'Y'}">
                                                	 	${L.professorAssessCk}
                                                	 </c:if>
                                                </td>	
                                               
                                               
                                                <td> 
                                               	 <c:if test="${L.professorAssessCk == 'N'}">
	                                                <a href="${pageContext.request.contextPath}/assess/professor/getProfessorAssessForm?professorAssessNo=${L.professorAssessNo}"> 
		                                                <button type="button" class="btn btn-primary">
		                                                	평가하기 
		                                                </button> 
	                                                </a> 
	                                              </c:if>
	                                                
	                                               <c:if test="${L.professorAssessCk == null}">
	                                                <a href="${pageContext.request.contextPath}/assess/professor/getProfessorAssessForm?professorAssessNo=${L.professorAssessNo}"> 
		                                                <button type="button" class="btn btn-primary">
		                                                	평가하기 
		                                                </button> 
	                                                </a>    	                                            
	                                             </c:if>
	                                                
	                                             <c:if test="${L.professorAssessCk == 'Y'}">
	                                                <a href="${pageContext.request.contextPath}/assess/professor/getProfessorAssessFormOne?professorAssessNo=${L.professorAssessNo}"> 
		                                                <button type="button" class="btn btn-primary">
		                                                	상세보기 
		                                                </button> 
	                                                </a> 
	                                               
	                                             </c:if>      
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                       
                                    </table>
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