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
                        <li class="breadcrumb-item"><a href="javascript:void(0)">공지</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">공지사항</a></li>
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
                               		<h4 class="card-title">성공했다면 여기로</h4>
                                </div>
                                <div class="col-sm-3">
                                	<a href="${pageContext.request.contextPath}/notice/addNoticeForm">
                                		<button type="button" class="btn btn-primary">과제추가</button>
                                	</a>
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
                                                
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="L" items="${lectureList}">
                                            <tr>
                                                <td>${L.lectureNo}</td>
                                                <td>
                                                	<a href="${pageContext.request.contextPath}/lecture/LectureOne?lectureNo=${L.lectureNo}">
                                                		${L.lectureTitle}
                                                	</a>
                                                </td>
                                                <td>${L.professorName}</td>
                                                <c:set var="createD" value ="${L.createDateL}" />
                                                <td> ${fn:substring(createD,0,10) } </td>
                                                <c:set var="updateD" value ="${L.updateDateL}" />
                                                <td>${fn:substring(updateD,0,10)}</td>
                                                
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