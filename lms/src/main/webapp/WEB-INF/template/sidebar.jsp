 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 
 
        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                
                
                
                	<!-- 학생용 : 마이페이지 -->
                    
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-notebook menu-icon"></i><span class="nav-text">마이페이지</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./page-login.html">나의정보</a></li>
                            <li><a href="./page-register.html">전체출결현황</a></li>
                        </ul>
                    </li>
                    
                    
                    
                    
                    <!-- 스마트출석부 --> 
                    
                    
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-graph menu-icon"></i> <span class="nav-text">스마트출석부</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./chart-flot.html">시간표</a></li>
                            <li><a href="./chart-morris.html">강의출결</a></li>
                            <li><a href="./chart-chartjs.html">강의공지</a></li>
                        </ul>
                    </li>
                    
                    
                    
                    <!--  나의 강의실 >>>교수의 경우 수강승인된 강의중 본인이 맡은 강의 / 학생은 본인이 수강하는 -->
                    
                      <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-graph menu-icon"></i> <span class="nav-text">나의 강의실</span>
                        </a>
                       <!--  교수의 경우  -->
                        <c:if test="${user eq 'professor'}">
                         <ul aria-expanded="false">
                            <li><a href="./chart-flot.html">시간표</a></li>
                            <li><a href="./chart-morris.html">강의출결</a></li>
                            <li><a href="${pageContext.request.contextPath}/lecture/getLectureList?No=${No}">강의자료교수</a></li>
                            <li><a href="./chart-chartjs.html">시험</a></li>
                        </ul>
                       </c:if> 
                       
                        
                       <!--  학생의경우 -->
                        <c:if test="${user eq 'student'}">
                         <ul aria-expanded="false">
                            <li><a href="./chart-flot.html">시간표</a></li>
                            <li><a href="./chart-morris.html">강의출결</a></li>
                            <li><a href="./chart-chartjs.html">강의자료</a></li>
                            <li><a href="./chart-chartjs.html">시험</a></li>
                        </ul>
                       </c:if> 
                       
                    </li>
                    
                    
                    
                    
                    
                    <!-- 학과소개 -->
                    
                    
                    <li class="mega-menu mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">학과</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${pageContext.request.contextPath}/major/majorList">학과소개</a></li>
                        </ul>
                    </li>
                    
                    
                    
                    <!-- 장학 -->
                    
                    
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-badge menu-icon"></i><span class="nav-text">장학</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./form-basic.html">장학소개</a></li>
                            <li><a href="./form-validation.html">장학FAQ</a></li>
                        </ul>
                    </li>
                    
                    
                    
                    <!-- 공지 -->
                    
                    
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">공지</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="${pageContext.request.contextPath}/notice/noticeList" aria-expanded="false">공지사항</a></li>
                        </ul>
                    </li>

                    
                    
                    <!-- 커뮤니티 -->
                    
                    
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-note menu-icon"></i><span class="nav-text">소통</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./form-basic.html">커뮤니티</a></li>
                        </ul>
                    </li>
                    
                    
                    <!-- FAQ -->
                    
                    
                    <li>
                        <a href="/FAQ" aria-expanded="false">
                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">FAQ</span>
                        </a>
                    </li>


					<!-- QnA -->


                    <li>
                        <a href="/QnA" aria-expanded="false">
                            <i class="icon-grid menu-icon"></i><span class="nav-text">QnA</span>
                        </a>
                    </li>
                    
                    
                </ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->