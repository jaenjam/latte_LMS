<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<!--  듣고있는 강의 평가 상세보기

<!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">나의 강의실</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">교수평가</a></li>
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
                                    교수평가는 자유롭게 남겨주세요!
                            	</div>
                            </div>
                                <br>
                                
                                
            <form name="reviewform" class="reviewform" id="reviewform" method="post" action="">                    
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>년도</th>
                                                <th>학기</th>
                                                <th>학점</th>  
                                                <th>교수</th>
                                                
                                                <th>별점</th>
                                                <th>평가여부</th>
                                                <th>평가내용</th>
                                            </tr>
	                                           
	                                            
                                        </thead>
                                         <c:forEach var="A" items="${AssessPfOne}">
                                        <tbody>
                                      	
                                       
                                            <tr>
                                               <td>${A.yearS}</td>
                                                <td>${A.semesterS}</td>
                                                <td>${A.subjectCredit}</td>
                                                <td> ${A.professorName} </td>
                                                <td> ${A.professorAssessScore} </td>
                                                <td> ${A.professorAssessCk} </td>
                                                <td>
                                                	<input type="hidden" id="registerNo" name="registerNo" value="${A.registerNo}">
                                                 	${A.professorAssessContent}
                                                 </td>
                                                
                                            </tr>
                                            
                                        
                                        </tbody>
                                       </c:forEach>
                                    </table>
                                    
                                    <hr>					
                                    <a href="${pageContext.request.contextPath}/assess/professor/getProfessorAssessForm?professorAssesNo=${A.professorAssessNo}">	
									    </a>	     <button type="button" class="btn btn-primary" name="save" id="save"> 수정하기 </button>
									
								   </div>
    							</form>

                                    
                                    
                               
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->
 
        <!--**********************************
            Content body end
        ***********************************-->


<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>

<script type="text/javascript" src="/js/assess/professorAssess.js"></script>

</body>
</html>