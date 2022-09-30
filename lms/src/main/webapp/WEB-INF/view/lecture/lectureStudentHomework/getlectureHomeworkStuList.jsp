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
                            	
                               		<h4 class="card-title"> 과제 </h4>
                                </div>
                             
                            </div>
                                <br>
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>번호</th>
                                                <th>제목</th>
                                                <th>작성일</th>
                                                <th>제출여부</th>
                                                <th>제출</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                      
                                        <c:forEach var="L" items="${LectureHomeworList}">
                                            <tr>
                                                <td>${L.lectureNo}</td>
                                                <td>
                                                <!--  해당 넘버의 과제상세보기 로 연결 -->
                                                	<a href="${pageContext.request.contextPath}/lecture/getLectureOne?lectureNo=${L.lectureNo}">
                                                		${L.lectureTitle}
                                                	</a>
                                                </td> 
                                                <td> ${L.createDate} </td>   
                                                
                                                <!--  제출여부  -->                                             
                                                <td> 
                                      
	                                                ??? 안나옴 ㅋㅋㅅㅂ
                                                </td>
                                                
                                                
                                                <td>
	                                                <a href="${pageContext.request.contextPath}/lecture/addLectureForm?subjectApproveNo=${subjectApproveNo}">
	                                					<button type="button" class="btn btn-primary">제출하러가기</button>
	                                				</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
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


</body>
</html>