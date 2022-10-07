<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>


<script type="text/javascript" src="/js/jquery/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/lecture/getlectureHomeworkStuList.js"></script>



<!--  교수가 자기 수업듣는 학생들의 과제제출 일람 볼 수 있는
 	여기서 학생의 제출과제이름 누르면 one으로 연결 >>> 다운 가능
 	여기서 제출 / 미제출 변경 및 점수입력 가능
  -->

<!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">나의 강의실</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">과제일람</a></li>
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
                            	
                               		<h4 class="card-title"> 과제제출일람 </h4>
                                </div>
                             
                            </div>
                                <br>
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>과제번호</th>
                                                <th>학생명</th>
                                                <th>제목</th>
                                                <th>제출여부</th>
                                                <th>점수</th>
                                            </tr>
                                        </thead>
                                       
                                        <tbody>
                                       <form id="modifystu" method="post" action="${pageContext.request.contextPath}/lecture/addLectureForm?subjectApproveNo=${subjectApproveNo}">
                                  
                                        <c:forEach var="L" items="${LectureTotalList}">
                                            <tr>
                                            	<td>${L.lectureNo}
                                            	</td>
                                                <td>${L.studentName}
                                                	<input type="hidden" name="pfHomeworkNo" id="pfHomeworkNo" value="${L.pfHomeworkNo}">
                                                </td>
                                                
                                                <!--  학생이 제출한 제목명 -->
                                                <td>
                                              		<c:if test="${L.homeworkTitle == null}">
                                              			제출하지 않았습니다
                                              		</c:if>
                                                	<c:if test="${L.homeworkTitle != null}">
                                              			${L.homeworkTitle}
                                              		</c:if>
                                              	</td>	
                                                <!--  제출여부 1111 -->                                             
                                                <td> 
                                                <select name="studentSubmitCk" id="studentSubmitCk">
		                                      		<c:forEach items="${L.studentSubmitCk}">
		                                      			<c:if test="${L.studentSubmitCk == '미제출'}">
		                                      				<option value=${L.studentSubmitCk} selected> ${L.studentSubmitCk} </option>
		                                      				<option value="제출"> 제출 </option>	
		                                      			</c:if>
		                                      			
		                                      			<c:if test="${L.studentSubmitCk == 'null'}">
		                                      				<option value=${L.studentSubmitCk}> 제출 </option>
		                                      				<option value="제출"> 미제출 </option>	
		                                      			</c:if>
		                                      			
		                                      			<c:if test="${L.studentSubmitCk == '제출'}">
		                                      				<option value=${L.studentSubmitCk}> ${L.studentSubmitCk} </option>
		                                      				<option value="미제출"> 미제출 </option>	
		                                      			</c:if>
		                                      		
		                                      		</c:forEach>	
                                                </select>
                                                </td>
                                     
                                     
                                     		
                                     	
                                                 <!--  제출여부  -->                                             
                                                <td> 
                                                	<input type="text" id="score" name="score" value="${L.score}">
                                                </td>
                                                
                                                <td>
	                                               
	                                					<button type="button" class="btn btn-primary" name="modify" id="modify">수정하기</button>
	                                				
                                                </td>
                                                
                                            </tr>
                                        </c:forEach>
                                        </form>
                                        </tbody>
                                        
                                        
                                    </table>
                                    
                                    
                                     <!--  하단 뒤로가기 -->
	                                    <div style="float:right">
	                                     	<button class="btn btn-primary" type="button" name="backPage" id="backPage"> 뒤로가기 </button>
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


<script>
    
    $('#backPage').click(function() {
    	alert('이전화면으로 돌아갑니다!');
    	history.back();
    });
    
    
    
</script> 
    
    
    <script src="${pageContext.request.contextPath}/plugins/common/common.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/js/gleek.js"></script>
    <script src="${pageContext.request.contextPath}/js/styleSwitcher.js"></script>


</html>