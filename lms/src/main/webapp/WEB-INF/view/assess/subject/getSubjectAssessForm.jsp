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
                            	
                               		<h4 class="card-title"> 과목평가 </h4>
                                </div>
                                <div class="col-sm-3">
                                    과목평가는 자유롭게 남겨주세요!
                            	</div>
                            </div>
                                <br>
                                
                                
            <form name="reviewform" class="reviewform" id="reviewform" method="post" action="${pageContext.request.contextPath}/assess/subject/getSubjectAssessForm">                    
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>년도</th>
                                                <th>학기</th>
                                                <th>학점</th>  
                                                <th>과목</th>
                                                
                                                <th>별점</th>
                                                <th>평가내용</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                      
                                        <c:forEach var="A" items="${AssessSbOne}">
                                            <tr>
                                               <td>${A.yearS}</td>
                                                <td>${A.semesterS}</td>
                                                <td>${A.subjectCredit}</td>
                                                <td> ${A.subjectName} </td>
                                                <td> ${A.subjectAssessScore} </td>
                                                <td> ${A.subjectAssessCk} </td>
                                                <td>
                                                	<input type="hidden" id="registerNo" name="registerNo" value="${A.registerNo}">
                                                 
                                                   	<input type="hidden" id="subjectAssessNo" name="subjectAssessNo" value="${A.subjectAssessNo}">
                                                 	<c:if test="${A.subjectAssessCk == 'N' }">
                                                 		<input type="hidden" id="subjectAssessCk" name="subjectAssessCk" value="Y">
                                                 	</c:if>
                                                 
                                                 </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                       
                                    </table>
                                    
                                    <hr>
                                    
										<div class="col-12">  <!-- ★ -->                               
											<h4 class="card-title"> 후기 </h4>									    
									        <input type="hidden" name="rate" id="rate" value="0"/>
									        <div class="review_rating">
									           
									            <div class="rating" title="별점을 선택해 주세요.">
									                <!-- 해당 별점을 클릭하면 해당 별과 그 왼쪽의 모든 별의 체크박스에 checked 적용 -->
									                <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
									                <label for="rating1"></label>
									                <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
									                <label for="rating2"></label>
									                <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
									                <label for="rating3"></label>
									                <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
									                <label for="rating4"></label>
									                <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
									                <label for="rating5"></label>
									            </div>
									        </div>
									        
									        <div class="review_contents">
									            <textarea rows="10" class="form-control" placeholder="100자 이상으로 작성해 주세요." id="reviewTextarea" name="reviewTextarea"></textarea>
									        </div>   
									        <div class="cmd">
									         <button type="button" class="btn btn-primary" name="save" id="save"> 평가하기 </button>
									        </div>
								       </div> <!-- ★ -->   
								      
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