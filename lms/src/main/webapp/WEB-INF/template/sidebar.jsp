 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
 
        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                
                
                
                	<!-- 학생용 : 마이페이지 -->
                	
                	
                    <c:if test="${user eq 'student'}">
                    
	                    <li class="mega-menu mega-menu-sm">
	                        <a class="has-arrow" href="javascript:void(0)" aria-expanded="false">
	                            <i class="icon-notebook menu-icon"></i>
	                            <span class="nav-text">마이페이지</span>
	                        </a>
	                        <ul aria-expanded="false">
	                            <li>
	                            	<a href="./page-login.html">나의정보</a>
	                            </li>
	                            <li>
	                            	<a href="./page-register.html">전체출결현황</a>
	                            </li>
	                        </ul>
	                    </li>
                    </c:if>
                    
                    
                    
                    
                    <!-- 관리자페이지 (총관리자) -->
                    
                    
                    <c:if test="${user eq 'employee'}">
                    
                    
                    
	                    <!-- 상세관리 : 교수, 학생, 과목, 승인과목 -->
                    	
                    	<li class="nav-label">총관리자</li>
                    	
	                    <li class="mega-menu mega-menu-sm">
	                        <a class="has-arrow" href="javascript:void(1)" aria-expanded="false">
	                            <i class="icon-notebook menu-icon"></i>
	                            <span class="nav-text">상세관리</span>
	                        </a>
	                        <ul aria-expanded="false">
	                            <li>
	                            	<a href="${pageContext.request.contextPath}/employee/detail/subEmployeeList">서브관리자</a>
	                            </li>
	                            <li>
	                            	<a href="${pageContext.request.contextPath}/employee/detail/professorList">교수</a>
	                            </li>
	                            <li>
	                            	<a href="${pageContext.request.contextPath}/employee/detail/studentList">학생</a>
	                            </li>
		                        <li>
		                           	<a href="${pageContext.request.contextPath}/employee/detail/subjectList">과목</a>
		                        </li>
		                        <li>
		                           	<a href="${pageContext.request.contextPath}/employee/detail/subjectApproveList">과목승인</a>
		                        </li>
	                         </ul>
	                    </li>
	                    
	                    
	                    
	                    
	                    <!-- 연봉관리 : 관리자, 서브관리자, 교수  -->
                    	
                    	
	                    <li class="mega-menu mega-menu-sm">
	                        <a class="has-arrow" href="javascript:void(1)" aria-expanded="false">
	                            <i class="icon-notebook menu-icon"></i>
	                            <span class="nav-text">연봉관리</span>
	                        </a>
	                        <ul aria-expanded="false">
	                            <li>
	                            	<a href="${pageContext.request.contextPath}/employee/salary/employeeSalary">관리자</a>
	                            </li>
		                        <li>
		                           	<a href="${pageContext.request.contextPath}/employee/salary/subEmployeeSalary">서브관리자</a>
		                        </li>
		                        <li>
		                           	<a href="${pageContext.request.contextPath}/employee/salary/professorSalary">교수</a>
		                        </li>
	                         </ul>
	                    </li>
	                    
	                    
	                    
	               
	               
	                    <!-- 계정상태변경 : 서브관리자, 교수, 학생  -->
                    	
                    	
	                    <li class="mega-menu mega-menu-sm">
	                        <a class="has-arrow" href="javascript:void(1)" aria-expanded="false">
	                            <i class="icon-notebook menu-icon"></i>
	                            <span class="nav-text">계정상태</span>
	                        </a>
	                        <ul aria-expanded="false">
	                            <li>
	                            	<a href="${pageContext.request.contextPath}/employee/state/subEmployeeState">서브관리자</a>
	                            </li>
		                        <li>
		                           	<a href="${pageContext.request.contextPath}/employee/state/professorState">교수</a>
		                        </li>
	                            <li>
	                            	<a href="${pageContext.request.contextPath}/employee/state/studentState">학생</a>
	                            </li>
	                         </ul>
	                    </li>
	               
	               
	                    
	                    
                    
                    	<!-- 비밀번호초기화 : 서브관리자, 교수, 학생 -->
                    	
                    	
	                    <li class="mega-menu mega-menu-sm">
	                        <a class="has-arrow" href="javascript:void(1)" aria-expanded="false">
	                            <i class="icon-notebook menu-icon"></i>
	                            <span class="nav-text">비밀번호초기화</span>
	                        </a>
	                        <ul aria-expanded="false">
	                            <li>
	                            	<a href="${pageContext.request.contextPath}/employee/reset/subEmployeeReset">서브관리자</a>
	                            </li>
	                            <li>
	                            	<a href="${pageContext.request.contextPath}/employee/reset/professorReset">교수</a>
	                            </li>
		                        <li>
		                           	<a href="${pageContext.request.contextPath}/employee/reset/studentReset">학생</a>
		                        </li>
	                         </ul>
	                    </li>
	                    
	                    
	                    
                    </c:if>
                    
                   
                   
                   
                    <!-- 나의강의실 - 학생용 --> 
                    
                    <c:if test="${user eq 'student'}">
                    
	                    <li class="mega-menu mega-menu-sm">
	                        <a class="has-arrow" href="javascript:void(1)" aria-expanded="false">
	                            <i class="icon-graph menu-icon"></i> <span class="nav-text">나의강의실</span>
	                        </a>
	                        <ul aria-expanded="false">
	                            <li>
	                            	<a href="./chart-flot.html">시간표</a>
	                            </li>
	                            <li>
	                            	<a href="./chart-morris.html">강의출결</a>
	                            </li>
	                            
	                            <!-- 학생이 수강하는 과목 List 보여주기 / 교수는 수업하는 과목 List 보여주기 -->
	                            
	           
	                            		<c:forEach var="sl" items="${myRegisterListStu}">
	                            		<!--  승인된과목의 페이지는... 본의아니게 숫자로 해야할듯 ㅠㅠ -->
	                            			<li>
	                            					<a style="background: #white;" href="${pageContext.request.contextPath}/subjectApprove/subjectApproveMain?subjectApproveNo=${sl.subjectApproveNo}">${sl.subjectName}</a>
	                            	
	                            			<li>
	                            		</c:forEach>
	                           
	
	                            
	                            <!-- ${pageContext.request.contextPath}/lecture/getLectureList?No=${No} //강의과제제출교수 -->
	                  
	                            <li>
	                            	<a href="${pageContext.request.contextPath}/lecture/getLectureList?No=${No}">강의과제</a>
	                            </li>
	                        </ul>
	                     </li>
                     </c:if>	
                            
                    
                    
                    
                    
                                       
                    <!-- 나의강의실 - 교수용 --> 
                    
                    <c:if test="${user eq 'professor'}"> 
	                    <li class="mega-menu mega-menu-sm">
	                        <a class="has-arrow" href="javascript:void(1)" aria-expanded="false">
	                            <i class="icon-graph menu-icon"></i>
	                            <span class="nav-text">나의강의실</span>
	                        </a>
	                        
	                        <ul aria-expanded="false">
	                            <li>
	                           		<a href="./chart-flot.html">시간표</a>
	                            </li>
	                            <li>
	                            	<a href="./chart-morris.html">강의출결</a>
	                            </li>
	                            
	                            <!-- 학생이 수강하는 과목 List 보여주기 / 교수는 수업하는 과목 List 보여주기 -->
	            
	                  
	                            		<c:forEach var="sl" items="${myRegisterListStu}">
	                            		<!--  승인된과목의 페이지는... 본의아니게 숫자로 해야할듯 ㅠㅠ -->
	                            			<li>
	                            				<a style="background: #white;" href="${pageContext.request.contextPath}/${sl}">${sl.professorNo}</a>
	                                 		<li>
	                            		</c:forEach>
	                           
	                            
	                            <!-- ${pageContext.request.contextPath}/lecture/getLectureList?No=${No} //강의과제제출교수 -->
	                  
	                            <li>
	                            	<a href="${pageContext.request.contextPath}/lecture/getLectureList?No=${No}">강의과제</a>
	                            </li>
	                        </ul>
	                    </li>
                    </c:if>	
                    
                    
                    
                    
                    
                    
                    <!-- 학과소개 -->
                    
                    
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void(2)" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i>
                            <span class="nav-text">학과</span>
                        </a>
                        <ul aria-expanded="false">
                            <li>
                            	<a href="${pageContext.request.contextPath}/major/majorList">학과 소개</a>
                            </li>
                        </ul>
                    </li>
                    
                    
                    
                    
                    <!-- 장학 -->
                    
                    
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void(3)" aria-expanded="false">
                            <i class="icon-badge menu-icon"></i>
                            <span class="nav-text">장학</span>
                        </a>
                        <ul aria-expanded="false">
                            <li>
                            	<a href="${pageContext.request.contextPath}/scholar/scholarList">장학 소개</a>
                            </li> 
                           <c:if test="${user eq 'employee'}"><!-- 관리자권한 -->
                           <li>
                            	<a href="${pageContext.request.contextPath}/scholar/addScholar">장학 추가</a>
                            </li>  
                          </c:if>                           
                        </ul>
                    </li>
                    
                   
                   <!-- 동아리 -->
                   
                   <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void(3)" aria-expanded="false">
                            <i class="icon-grid menu-icon"></i>
                            <span class="nav-text">동아리</span>
                        </a>
                        <ul aria-expanded="false">
                            <li>
                            	<a href="${pageContext.request.contextPath}/club/clubList">동아리 소개</a>
                            </li>                 
                            
                            <c:if test="${user eq 'employee'}"><!-- 관리자권한 -->
                           <li>
                            	<a href="${pageContext.request.contextPath}/club/addClub">동아리 추가</a>
                            </li>  
                          </c:if>
                            
                            <c:if test="${user eq 'student'}"><!-- 학생 권한 -->
                            <li>
                            	<a href="${pageContext.request.contextPath}/club/addStudentClub">동아리 가입</a>
                            </li>  
                            </c:if>                                    
                        </ul>
                    </li>
                    
                    
                    <!-- 공지 -->
                    
                    
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void(4)" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i>
                            <span class="nav-text">공지</span>
                        </a>
                        <ul aria-expanded="false">
                            <li>
                            	<a href="${pageContext.request.contextPath}/notice/noticeList" aria-expanded="false">공지사항</a>
                            </li>
                        </ul>
                    </li>

                    
                    
                    
                    
                    
                    
                    
                    
                    <!-- 커뮤니티 -->
                    
                    
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void(5)" aria-expanded="false">
                            <i class="icon-note menu-icon"></i>
                            <span class="nav-text">소통</span>
                        </a>
                        <ul aria-expanded="false">
                            <li>
                            	<a href="./form-basic.html">커뮤니티</a>
                            </li>
                        </ul>
                    </li>
                    
                    
                    
                    
                    <!-- FAQ -->
                    
                    
                    <li class="mega-menu mega-menu-sm">
                        <a href="${pageContext.request.contextPath}/faq/faqList" aria-expanded="false">
                            <i class="icon-screen-tablet menu-icon"></i>
                            <span class="nav-text">FAQ</span>
                        </a>
                    </li>




					<!-- QnA -->


                    <li class="mega-menu mega-menu-sm">
                        <a href="${pageContext.request.contextPath}/qna/qna" aria-expanded="false">
                            <i class="icon-grid menu-icon"></i>
                            <span class="nav-text">QnA</span>
                        </a>
                    </li>
                    
                    
                </ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->