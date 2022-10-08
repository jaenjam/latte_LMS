<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<style>
.btn-primary {
	width: 180px;
	height: 60px;
	margin-top: 23px;
	font-size: 20px
}
</style>

<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body">

	<div class="container-fluid mt-3">

		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
			                                <h4 class="card-title">나의정보</h4>
			                                <br>
			                                <ul class="nav nav-pills mb-3">
			                                    <li class="nav-item"><a href="#navpills-1" class="nav-link active show" data-toggle="tab" aria-expanded="false">기본</a>
			                                    </li>
			                                    <li class="nav-item"><a href="#navpills-2" class="nav-link" data-toggle="tab" aria-expanded="false">수강</a>
			                                    </li>
			                                    <li class="nav-item"><a href="#navpills-3" class="nav-link" data-toggle="tab" aria-expanded="true">성적</a>
			                                    </li>
			                                    <li class="nav-item"><a href="#navpills-4" class="nav-link" data-toggle="tab" aria-expanded="true">장학</a>
			                                    </li>
			                                </ul>
			                                <div class="tab-content br-n pn">
			                                
			                                
			                                	<!-- 첫번째탭 : 기본 -->
			                                    <div id="navpills-1" class="tab-pane active show">
			                                        	<div class="table-responsive">
						                                    <table class="table table-bordered">
						                                    	<c:forEach var="s" items="${studentInfo}">
						                                            <tr>
						                                                <th>학번</th>
						                                                <td>${s.studentNo}</td>
						                                                <th>이름</th>
						                                                <td>
						                                                	${s.studentName}
						                                                	<c:if test="${s.studetnTop eq Y}">
						                                                		<span class="label gradient-8 btn-rounded">과대표</span>
						                                                	</c:if>
						                                                </td>
						                                            </tr>
						                                            <tr>
						                                            	<th>학과</th>
						                                            	<td>${s.majorName}</td>
						                                            	<th>학적상태</th>
						                                            	<td>${s.studentState}</td>
						                                            </tr>
						                                            <tr>
						                                            	<th>전화번호</th>
						                                            	<td>${s.studentTelephone}</td>
						                                            	<th>이메일</th>
						                                            	<td>${s.studentEmail}</td>						                                            	
						                                            </tr>
						                                            <tr>
						                                            	<th>장학금</th>
						                                            	<td>${s.scholarName}</td>
						                                            	<th>동아리</th>
						                                            	<td>${s.clubName}</td>						                                            	
						                                            </tr>
						                                    	</c:forEach>
						                                    </table>
						                                </div>
			                                    </div>
			                                    
			                                    
			                                    <!-- 두번째 탭 : 수강 -->
			                                    <div id="navpills-2" class="tab-pane">
			                                        	<div class="table-responsive">
						                                    <table class="table table-bordered">
						                                    	
						                                            <tr>
						                                            	<th>교과목번호</th>
						                                            	<th>과목명</th>
						                                            	<th>전공필수여부</th>
						                                            	<th>학점</th>
						                                            </tr>
						                                            <c:forEach var="m" items="${myRegisterListStu}">
							                                            <tr>
							                                            	<td>${m.subjectNo}</td>
							                                            	<td>${m.subjectName}</td>
							                                            	<td>${m.subjectMajor}</td>						                                            	
							                                            	<td>${m.subjectCredit}</td>						                                            							                                            						                                            	
							                                            </tr>
						                                    		</c:forEach>
						                                    </table>
						                                </div>
			                                    </div>
			                                    
			                                    
			                                    <!-- 세번째탭 : 성적 -->
			                                    <div id="navpills-3" class="tab-pane">
			                                    
			                                    </div>
			                                    
			                                    
			                                    <!-- 네번째탭 : 장학 -->
			                                    <div id="navpills-4" class="tab-pane">
			                                        	<div class="table-responsive">
						                                    <table class="table table-bordered">
						                                    	<c:forEach var="s" items="${studentInfo}">
						                                            <tr>
						                                            	<th>장학코드</th>
						                                            	<td>${s.scholarNo}</td>
						                                            </tr>
						                                            <tr>
						                                            	<th>장학명</th>
						                                            	<td>${s.scholarName}</td>
						                                            </tr>
						                                            <tr>
						                                            	<th>장학내용</th>
						                                            	<td>${s.scholarContent}</td>
						                                            </tr>
							                                        <tr>						                                            	
							                                            <th>장학금액</th>
						                                            	<td>${s.scholarPrice}</td>						                                            							                                            						                                            	
							                                        </tr>
						                                    	</c:forEach>
						                                    </table>
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
</div>
<!--**********************************
            Content body end
        ***********************************-->
<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>