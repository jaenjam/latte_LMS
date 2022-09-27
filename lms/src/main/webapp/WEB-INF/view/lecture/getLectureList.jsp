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
                                	<a href="${pageContext.request.contextPath}/lecture/addLectureForm?subjectApproveNo=${subjectApproveNo}">
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
                                        <c:forEach var="L" items="${lectureList.content}">
                                            <tr>
                                                <td>${L.lectureNo}</td>
                                                <td>
                                                	<a href="${pageContext.request.contextPath}/lecture/getLectureOne?lectureNo=${L.lectureNo}">
                                                		${L.lectureTitle}
                                                	</a>
                                                </td>
                                                <td> ${L.professorName} </td>                                          
                                                <td> ${L.createDateL} </td>                                                
                                                <td> ${L.updateDateL} </td>
                                                <td> ${L.countL} </td>
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