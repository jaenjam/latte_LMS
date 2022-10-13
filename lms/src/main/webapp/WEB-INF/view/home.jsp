<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>




        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="container-fluid mt-3">
            
            <c:if test="${user ne 'employee'}">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
							<div class="card-body" style="text-align:center">
                                <div class="card-title">
                                    <h4>시간표</h4>
                                </div>
                                <br>
                                <div class="table-responsive">
                                    <table class="table table-bordered" style="table-layout: fixed">
                                        <thead>
                                            <tr>
                                            	<th width="20%">#</th>
                                                <th width="16%">MONDAY</th>
                                                <th width="16%">TUESDAY</th>
                                                <th width="16%">WEDNESDAY</th>
                                                <th width="16%">THURSDAY</th>
                                                <th width="16%">FRIDAY</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- 1교시 -->
	                                            <tr>
	                                                <th>1교시(9:00~9:50)</th>
	                                                
	                                                <!-- 월요일 -->
	                                                <!-- 월요일, 1교시 시작 -->
	                                                <c:if test="${Mon.day eq '월' && Mon.startTime eq 1}">
	                                                	<td rowspan="${Mon.endTime - Mon.startTime+1}" 
	                                                		style="background-color: #f6d6e5; color:black; text-align:center;">
	                                                		<div>${Mon.subjectName}</div>
	                                                		<div>${Mon.professorName} 교수님</div>
	                                                		<div>${Mon.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && (Mon.endTime < 1 || Mon.startTime > 1)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && Mon.endTime ne 1}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Mon.day ne '월'}">
	                                                	<td></td>
	                                                </c:if>

	                                                
	                                                
	                                                <!-- 화요일, 1교시 시작 -->
	                                                <c:if test="${Tue.day eq '화' && Tue.startTime eq 1}">
	                                                	<td rowspan="${Tue.endTime - Tue.startTime+1}" 
	                                                		style="background-color: #ffd6aa; color:black; text-align:center;">
	                                                		<div>${Tue.subjectName}</div>
	                                                		<div>${Tue.professorName} 교수님</div>
	                                                		<div>${Tue.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && (Tue.endTime < 1 || Tue.startTime > 1)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && Tue.endTime ne 1}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Tue.day ne '화'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 수요일, 1교시 시작 -->
	                                                <c:if test="${Wed.day eq '수' && Wed.startTime eq 1}">
	                                                	<td rowspan="${Wed.endTime - Wed.startTime+1}" 
	                                                		style="background-color: #fff284; color:black; text-align:center;">
	                                                		<div>${Wed.subjectName}</div>
	                                                		<div>${Wed.professorName} 교수님</div>
	                                                		<div>${Wed.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && (Wed.endTime < 1 || Wed.startTime > 1)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && Wed.endTime ne 1}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Wed.day ne '수'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 목요일, 1교시 시작 -->
	                                                <c:if test="${Thu.day eq '목' && Thu.startTime eq 1}">
	                                                	<td rowspan="${Thu.endTime - Thu.startTime+1}" 
	                                                		style="background-color: #b4e0ff; color:black; text-align:center;">
	                                                		<div>${Thu.subjectName}</div>
	                                                		<div>${Thu.professorName} 교수님</div>
	                                                		<div>${Thu.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && (Thu.endTime < 1 || Thu.startTime > 1)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && Thu.endTime ne 1}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Thu.day ne '목'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                
	                                                <!-- 금요일, 1교시 시작 -->
	                                                <c:if test="${Fri.day eq '금' && Fri.startTime eq 1}">
	                                                	<td rowspan="${Fri.endTime - t.startTime+1}" 
	                                                		style="background-color: #dadafc; color:black; text-align:center;">
	                                                		<div>${Fri.subjectName}</div>
	                                                		<div>${Fri.professorName} 교수님</div>
	                                                		<div>${Fri.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && (Fri.endTime < 1 || Fri.startTime > 1)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && Fri.endTime ne 1}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Fri.day ne '금'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                            </tr>
                                            <!-- 1교시 끝 -->
                                            
                                            
                                            <!-- 2교시 -->
	                                            <tr>
	                                                <th>2교시(10:00~10:50)</th>
	                                                
	                                                <!-- 월요일 -->
	                                                <c:if test="${Mon.day eq '월' && Mon.startTime eq 2}">
	                                                	<td rowspan="${Mon.endTime - Mon.startTime+1}" 
	                                                		style="background-color: #f6d6e5; color:black; text-align:center;">
	                                                		<div>${Mon.subjectName}</div>
	                                                		<div>${Mon.professorName} 교수님</div>
	                                                		<div>${Mon.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && (Mon.endTime < 2 || Mon.startTime > 2)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && Mon.endTime > 2}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Mon.day ne '월'}">
	                                                	<td></td>
	                                                </c:if>
	                                                

	                                                
	                                                
	                                                
	                                                <!-- 화요일, 2교시 시작 -->
	                                                <c:if test="${Tue.day eq '화' && Tue.startTime eq 2}">
	                                                	<td rowspan="${Tue.endTime - Tue.startTime+1}" 
	                                                		style="background-color: #ffd6aa; color:black; text-align:center;">
	                                                		<div>${Tue.subjectName}</div>
	                                                		<div>${Tue.professorName} 교수님</div>
	                                                		<div>${Tue.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && (Tue.endTime < 2 || Tue.startTime > 2)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && Tue.endTime ne 2}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Tue.day ne '화'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                
	                                                <!-- 수요일, 2교시 시작 -->
	                                                <c:if test="${Wed.day eq '수' && Wed.startTime eq 2}">
	                                                	<td rowspan="${Wed.endTime - Wed.startTime+1}" 
	                                                		style="background-color: #fff284; color:black; text-align:center;">
	                                                		<div>${Wed.subjectName}</div>
	                                                		<div>${Wed.professorName} 교수님</div>
	                                                		<div>${Wed.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && (Wed.endTime < 2 || Wed.startTime > 2)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && Wed.endTime ne 2}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Wed.day ne '수'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 목요일, 2교시 시작 -->
	                                                <c:if test="${Thu.day eq '목' && Thu.startTime eq 2}">
	                                                	<td rowspan="${Thu.endTime - Thu.startTime+1}" 
	                                                		style="background-color: #b4e0ff; color:black; text-align:center;">
	                                                		<div>${Thu.subjectName}</div>
	                                                		<div>${Thu.professorName} 교수님</div>
	                                                		<div>${Thu.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && (Thu.endTime < 2 || Thu.startTime > 2)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && Thu.endTime ne 2}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Thu.day ne '목'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 금요일, 2교시 시작 -->
	                                                <c:if test="${Fri.day eq '금' && Fri.startTime eq 2}">
	                                                	<td rowspan="${Fri.endTime - t.startTime+1}" 
	                                                		style="background-color: #dadafc; color:black; text-align:center;">
	                                                		<div>${Fri.subjectName}</div>
	                                                		<div>${Fri.professorName} 교수님</div>
	                                                		<div>${Fri.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && (Fri.endTime < 2 || Fri.startTime > 2)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && Fri.endTime ne 2}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Fri.day ne '금'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                            </tr>
                                            <!-- 2교시 끝 -->
                                            
                                            
                                            <!-- 3교시 -->
	                                            <tr>
	                                                <th>3교시(11:00~11:50)</th>
	                                                
	                                                <!-- 월요일 -->
	                                                <c:if test="${Mon.day eq '월' && Mon.startTime eq 3}">
	                                                	<td rowspan="${Mon.endTime - Mon.startTime+1}" 
	                                                		style="background-color: #f6d6e5; color:black; text-align:center">
	                                                		<div>${Mon.subjectName}</div>
	                                                		<div>${Mon.professorName} 교수님</div>
	                                                		<div>${Mon.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && (Mon.endTime < 3 || Mon.startTime > 3)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && Mon.endTime > 3}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Mon.day ne '월'}">
	                                                	<td></td>
	                                                </c:if>
	                                                

	                                                
	                                                <!-- 화요일, 3교시 시작 -->
	                                                <c:if test="${Tue.day eq '화' && Tue.startTime eq 3}">
	                                                	<td rowspan="${Tue.endTime - Tue.startTime+1}" 
	                                                		style="background-color: #ffd6aa; color:black; text-align:center;">
	                                                		<div>${Tue.subjectName}</div>
	                                                		<div>${Tue.professorName} 교수님</div>
	                                                		<div>${Tue.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && (Tue.endTime < 3 || Tue.startTime > 3)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && Tue.endTime ne 3}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Tue.day ne '화'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                
	                                                <!-- 수요일, 3교시 시작 -->
	                                                <c:if test="${Wed.day eq '수' && Wed.startTime eq 3}">
	                                                	<td rowspan="${Wed.endTime - Wed.startTime+1}" 
	                                                		style="background-color: #fff284; color:black; text-align:center;">
	                                                		<div>${Wed.subjectName}</div>
	                                                		<div>${Wed.professorName} 교수님</div>
	                                                		<div>${Wed.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && (Wed.endTime < 3 || Wed.startTime > 3)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && Wed.endTime ne 3}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Wed.day ne '수'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                
	                                                <!-- 목요일, 3교시 시작 -->
	                                                <c:if test="${Thu.day eq '목' && Thu.startTime eq 3}">
	                                                	<td rowspan="${Thu.endTime - Thu.startTime+1}" 
	                                                		style="background-color: #b4e0ff; color:black; text-align:center;">
	                                                		<div>${Thu.subjectName}</div>
	                                                		<div>${Thu.professorName} 교수님</div>
	                                                		<div>${Thu.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && (Thu.endTime < 3 || Thu.startTime > 3)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && Thu.endTime ne 3}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Thu.day ne '목'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                
	                                                <!-- 금요일, 3교시 시작 -->
	                                                <c:if test="${Fri.day eq '금' && Fri.startTime eq 3}">
	                                                	<td rowspan="${Fri.endTime - t.startTime+1}" 
	                                                		style="background-color: #dadafc; color:black; text-align:center;">
	                                                		<div>${Fri.subjectName}</div>
	                                                		<div>${Fri.professorName} 교수님</div>
	                                                		<div>${Fri.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && (Fri.endTime < 3 || Fri.startTime > 3)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && Fri.endTime ne 3}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Fri.day ne '금'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                            </tr>
                                            <!-- 3교시 끝 -->
                                            
                                            
                                            <!-- 4교시 -->
	                                            <tr>
	                                                <th>4교시(12:00~12:50)</th>
	                                                
	                                                <!-- 월요일 -->
	                                                <!-- 월요일, 시작시간 4교시 -->
	                                                <c:if test="${Mon.day eq '월' && Mon.startTime eq 4}">
	                                                	<td rowspan="${Mon.endTime - Mon.startTime+1}" 
	                                                		style="background-color: #f6d6e5; color:black; text-align:center">
	                                                		<div>${Mon.subjectName}</div>
	                                                		<div>${Mon.professorName} 교수님</div>
	                                                		<div>${Mon.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <!-- 월요일, 시작시간이 4교시가 아니거나 끝나는시간이 4보다 작을때 -->
	                                                <c:if test="${Mon.day eq '월' &&  (Mon.endTime < 4 || Mon.startTime > 4)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && Mon.endTime > 4}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Mon.day ne '월'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                <!-- 화요일, 4교시 시작 -->
	                                                <c:if test="${Tue.day eq '화' && Tue.startTime eq 4}">
	                                                	<td rowspan="${Tue.endTime - Tue.startTime+1}" 
	                                                		style="background-color: #ffd6aa; color:black; text-align:center;">
	                                                		<div>${Tue.subjectName}</div>
	                                                		<div>${Tue.professorName} 교수님</div>
	                                                		<div>${Tue.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && (Tue.endTime < 4 || Tue.startTime > 4)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && Tue.endTime ne 4}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Tue.day ne '화'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 수요일, 4교시 시작 -->
	                                                <c:if test="${Wed.day eq '수' && Wed.startTime eq 4}">
	                                                	<td rowspan="${Wed.endTime - Wed.startTime+1}" 
	                                                		style="background-color: #fff284; color:black; text-align:center;">
	                                                		<div>${Wed.subjectName}</div>
	                                                		<div>${Wed.professorName} 교수님</div>
	                                                		<div>${Wed.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && (Wed.endTime < 4 || Wed.startTime > 4)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && Wed.endTime ne 4}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Wed.day ne '수'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                
	                                                <!-- 목요일, 4교시 시작 -->
	                                                <c:if test="${Thu.day eq '목' && Thu.startTime eq 4}">
	                                                	<td rowspan="${Thu.endTime - Thu.startTime+1}" 
	                                                		style="background-color: #b4e0ff; color:black; text-align:center;">
	                                                		<div>${Thu.subjectName}</div>
	                                                		<div>${Thu.professorName} 교수님</div>
	                                                		<div>${Thu.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && (Thu.endTime < 4 || Thu.startTime > 4)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && Thu.endTime ne 4}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Thu.day ne '목'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 금요일, 4교시 시작 -->
	                                                <c:if test="${Fri.day eq '금' && Fri.startTime eq 4}">
	                                                	<td rowspan="${Fri.endTime - t.startTime+1}" 
	                                                		style="background-color: #dadafc; color:black; text-align:center;">
	                                                		<div>${Fri.subjectName}</div>
	                                                		<div>${Fri.professorName} 교수님</div>
	                                                		<div>${Fri.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && (Fri.endTime < 4 || Fri.startTime > 4)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && Fri.endTime ne 4}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Fri.day ne '금'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                            </tr>
                                            <!-- 4교시 끝 -->
                                            
                                            
                                            <!-- 5교시 -->
	                                            <tr>
	                                                <th>5교시(13:00~13:50)</th>
	                                                
	                                                
	                                                <!-- 월요일 -->
	                                                <c:if test="${Mon.day eq '월' && Mon.startTime eq 5}">
	                                                	<td rowspan="${Mon.endTime - Mon.startTime+1}" 
	                                                		style="background-color: #f6d6e5; color:black; text-align:center">
	                                                		<div>${Mon.subjectName}</div>
	                                                		<div>${Mon.professorName} 교수님</div>
	                                                		<div>${Mon.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && (Mon.endTime < 5 || Mon.startTime > 5)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && Mon.endTime > 5}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Mon.day ne '월'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 화요일, 5교시 시작 -->
	                                                <c:if test="${Tue.day eq '화' && Tue.startTime eq 5}">
	                                                	<td rowspan="${Tue.endTime - Tue.startTime+1}" 
	                                                		style="background-color: #ffd6aa; color:black; text-align:center;">
	                                                		<div>${Tue.subjectName}</div>
	                                                		<div>${Tue.professorName} 교수님</div>
	                                                		<div>${Tue.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && (Tue.endTime < 5 || Tue.startTime > 5)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && Tue.endTime ne 5}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Tue.day ne '화'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 수요일, 5교시 시작 -->
	                                                <c:if test="${Wed.day eq '수' && Wed.startTime eq 5}">
	                                                	<td rowspan="${Wed.endTime - Wed.startTime+1}" 
	                                                		style="background-color: #fff284; color:black; text-align:center;">
	                                                		<div>${Wed.subjectName}</div>
	                                                		<div>${Wed.professorName} 교수님</div>
	                                                		<div>${Wed.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && (Wed.endTime < 5 || Wed.startTime > 5)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && Wed.endTime ne 5}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Wed.day ne '수'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                
	                                                <!-- 목요일, 5교시 시작 -->
	                                                <c:if test="${Thu.day eq '목' && Thu.startTime eq 5}">
	                                                	<td rowspan="${Thu.endTime - Thu.startTime+1}" 
	                                                		style="background-color: #b4e0ff; color:black; text-align:center;">
	                                                		<div>${Thu.subjectName}</div>
	                                                		<div>${Thu.professorName} 교수님</div>
	                                                		<div>${Thu.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && (Thu.endTime < 5 || Thu.startTime > 5)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && Thu.endTime ne 5}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Thu.day ne '목'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 금요일, 5교시 시작 -->
	                                                <c:if test="${Fri.day eq '금' && Fri.startTime eq 5}">
	                                                	<td rowspan="${Fri.endTime - t.startTime+1}" 
	                                                		style="background-color: #dadafc; color:black; text-align:center;">
	                                                		<div>${Fri.subjectName}</div>
	                                                		<div>${Fri.professorName} 교수님</div>
	                                                		<div>${Fri.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && (Fri.endTime < 5 || Fri.startTime > 5)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && Fri.endTime ne 5}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Fri.day ne '금'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                            </tr>
                                            <!-- 5교시 끝 -->
                                            
                                            
                                            <!-- 6교시 -->
	                                            <tr>
	                                                <th>6교시(14:00~14:50)</th>
	                                                
	                                                <!-- 월요일 -->
	                                                <c:if test="${Mon.day eq '월' && Mon.startTime eq 6}">
	                                                	<td rowspan="${Mon.endTime - Mon.startTime+1}" 
	                                                		style="background-color: #f6d6e5; color:black; text-align:center">
	                                                		<div>${Mon.subjectName}</div>
	                                                		<div>${Mon.professorName} 교수님</div>
	                                                		<div>${Mon.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && (Mon.endTime < 6 || Mon.startTime > 6)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && Mon.endTime > 6}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Mon.day ne '월'}">
	                                                	<td></td>
	                                                </c:if>
	                                                

	                                                
	                                                <!-- 화요일, 6교시 시작 -->
	                                                <c:if test="${Tue.day eq '화' && Tue.startTime eq 6}">
	                                                	<td rowspan="${Tue.endTime - Tue.startTime+1}" 
	                                                		style="background-color: #ffd6aa; color:black; text-align:center;">
	                                                		<div>${Tue.subjectName}</div>
	                                                		<div>${Tue.professorName} 교수님</div>
	                                                		<div>${Tue.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && (Tue.endTime < 6 || Tue.startTime > 6)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && Tue.endTime ne 6}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Tue.day ne '화'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 수요일, 6교시 시작 -->
	                                                <c:if test="${Wed.day eq '수' && Wed.startTime eq 6}">
	                                                	<td rowspan="${Wed.endTime - Wed.startTime+1}" 
	                                                		style="background-color: #fff284; color:black; text-align:center;">
	                                                		<div>${Wed.subjectName}</div>
	                                                		<div>${Wed.professorName} 교수님</div>
	                                                		<div>${Wed.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && (Wed.endTime < 6 || Wed.startTime > 6)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && Wed.endTime ne 6}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Wed.day ne '수'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                
	                                                <!-- 목요일, 6교시 시작 -->
	                                                <c:if test="${Thu.day eq '목' && Thu.startTime eq 6}">
	                                                	<td rowspan="${Thu.endTime - Thu.startTime+1}" 
	                                                		style="background-color: #b4e0ff; color:black; text-align:center;">
	                                                		<div>${Thu.subjectName}</div>
	                                                		<div>${Thu.professorName} 교수님</div>
	                                                		<div>${Thu.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && (Thu.endTime < 6 || Thu.startTime > 6)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && Thu.endTime ne 6}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Thu.day ne '목'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 금요일, 6교시 시작 -->
	                                                <c:if test="${Fri.day eq '금' && Fri.startTime eq 6}">
	                                                	<td rowspan="${Fri.endTime - t.startTime+1}" 
	                                                		style="background-color: #dadafc; color:black; text-align:center;">
	                                                		<div>${Fri.subjectName}</div>
	                                                		<div>${Fri.professorName} 교수님</div>
	                                                		<div>${Fri.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && (Fri.endTime < 6 || Fri.startTime > 6)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && Fri.endTime ne 6}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Fri.day ne '금'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                            </tr>
                                            <!-- 6교시 끝 -->
                                            
                                            
                                            <!-- 7교시 -->
	                                            <tr>
	                                                <th>7교시(15:00~15:50)</th>
	                                                
	                                                <!-- 월요일 -->
	                                                <c:if test="${Mon.day eq '월' && Mon.startTime eq 7}">
	                                                	<td rowspan="${Mon.endTime - Mon.startTime+1}" 
	                                                		style="background-color: #f6d6e5; color:black; text-align:center">
	                                                		<div>${Mon.subjectName}</div>
	                                                		<div>${Mon.professorName} 교수님</div>
	                                                		<div>${Mon.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && (Mon.endTime < 7 || Mon.startTime > 7)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && Mon.endTime > 7}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Mon.day ne '월'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                <!-- 화요일, 7교시 시작 -->
	                                                <c:if test="${Tue.day eq '화' && Tue.startTime eq 7}">
	                                                	<td rowspan="${Tue.endTime - Tue.startTime+1}" 
	                                                		style="background-color: #ffd6aa; color:black; text-align:center;">
	                                                		<div>${Tue.subjectName}</div>
	                                                		<div>${Tue.professorName} 교수님</div>
	                                                		<div>${Tue.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && (Tue.endTime < 7 || Tue.startTime > 7)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && Tue.endTime ne 7}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Tue.day ne '화'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 수요일, 7교시 시작 -->
	                                                <c:if test="${Wed.day eq '수' && Wed.startTime eq 7}">
	                                                	<td rowspan="${Wed.endTime - Wed.startTime+1}" 
	                                                		style="background-color: #fff284; color:black; text-align:center;">
	                                                		<div>${Wed.subjectName}</div>
	                                                		<div>${Wed.professorName} 교수님</div>
	                                                		<div>${Wed.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && (Wed.endTime < 7 || Wed.startTime > 7)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && Wed.endTime ne 7}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Wed.day ne '수'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 목요일, 7교시 시작 -->
	                                                <c:if test="${Thu.day eq '목' && Thu.startTime eq 7}">
	                                                	<td rowspan="${Thu.endTime - Thu.startTime+1}" 
	                                                		style="background-color: #b4e0ff; color:black; text-align:center;">
	                                                		<div>${Thu.subjectName}</div>
	                                                		<div>${Thu.professorName} 교수님</div>
	                                                		<div>${Thu.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && (Thu.endTime < 7 || Thu.startTime > 7)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && Thu.endTime ne 7}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Thu.day ne '목'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 금요일, 7교시 시작 -->
	                                                <c:if test="${Fri.day eq '금' && Fri.startTime eq 7}">
	                                                	<td rowspan="${Fri.endTime - t.startTime+1}" 
	                                                		style="background-color: #dadafc; color:black; text-align:center;">
	                                                		<div>${Fri.subjectName}</div>
	                                                		<div>${Fri.professorName} 교수님</div>
	                                                		<div>${Fri.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && (Fri.endTime < 7 || Fri.startTime > 7)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && Fri.endTime ne 7}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Fri.day ne '금'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                            </tr>
                                            <!-- 7교시 끝 -->
                                            
                                            
                                            <!-- 8교시 -->
	                                            <tr>
	                                                <th>8교시(16:00~16:50)</th>
	                                                
	                                                <!-- 월요일 -->
	                                                <c:if test="${Mon.day eq '월' && Mon.startTime eq 8}">
	                                                	<td rowspan="${Mon.endTime - Mon.startTime+1}" 
	                                                		style="background-color: #f6d6e5; color:black; text-align:center">
	                                                		<div>${Mon.subjectName}</div>
	                                                		<div>${Mon.professorName} 교수님</div>
	                                                		<div>${Mon.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && (Mon.endTime < 8 || Mon.startTime > 8)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && Mon.endTime > 8}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Mon.day ne '월'}">
	                                                	<td></td>
	                                                </c:if>	                                                

	                                                
	                                                
	                                                <!-- 화요일, 8교시 시작 -->
	                                                <c:if test="${Tue.day eq '화' && Tue.startTime eq 8}">
	                                                	<td rowspan="${Tue.endTime - Tue.startTime+1}" 
	                                                		style="background-color: #ffd6aa; color:black; text-align:center;">
	                                                		<div>${Tue.subjectName}</div>
	                                                		<div>${Tue.professorName} 교수님</div>
	                                                		<div>${Tue.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && (Tue.endTime < 8 || Tue.startTime > 8)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && Tue.endTime ne 8}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Tue.day ne '화'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 수요일, 8교시 시작 -->
	                                                <c:if test="${Wed.day eq '수' && Wed.startTime eq 8}">
	                                                	<td rowspan="${Wed.endTime - Wed.startTime+1}" 
	                                                		style="background-color: #fff284; color:black; text-align:center;">
	                                                		<div>${Wed.subjectName}</div>
	                                                		<div>${Wed.professorName} 교수님</div>
	                                                		<div>${Wed.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && (Wed.endTime < 8 || Wed.startTime > 8)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && Wed.endTime ne 8}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Wed.day ne '수'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 목요일, 8교시 시작 -->
	                                                <c:if test="${Thu.day eq '목' && Thu.startTime eq 8}">
	                                                	<td rowspan="${Thu.endTime - Thu.startTime+1}" 
	                                                		style="background-color: #b4e0ff; color:black; text-align:center;">
	                                                		<div>${Thu.subjectName}</div>
	                                                		<div>${Thu.professorName} 교수님</div>
	                                                		<div>${Thu.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && (Thu.endTime < 8 || Thu.startTime > 8)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && Thu.endTime ne 8}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Thu.day ne '목'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 금요일, 8교시 시작 -->
	                                                <c:if test="${Fri.day eq '금' && Fri.startTime eq 8}">
	                                                	<td rowspan="${Fri.endTime - t.startTime+1}" 
	                                                		style="background-color: #dadafc; color:black; text-align:center;">
	                                                		<div>${Fri.subjectName}</div>
	                                                		<div>${Fri.professorName} 교수님</div>
	                                                		<div>${Fri.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && (Fri.endTime < 8 || Fri.startTime > 8)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && Fri.endTime ne 8}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Fri.day ne '금'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                            </tr>
                                            <!-- 8교시 끝 -->
                                            
                                            
                                            <!-- 9교시 -->
	                                            <tr>
	                                                <th>9교시(17:00~17:50)</th>
	                                                
	                                                <!-- 월요일 -->
	                                                <c:if test="${Mon.day eq '월' && Mon.startTime eq 9}">
	                                                	<td rowspan="${Mon.endTime - Mon.startTime+1}" 
	                                                		style="background-color: #f6d6e5; color:black; text-align:center">
	                                                		<div>${Mon.subjectName}</div>
	                                                		<div>${Mon.professorName} 교수님</div>
	                                                		<div>${Mon.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && (Mon.endTime < 9 || Mon.startTime > 9)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && Mon.endTime > 9}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Mon.day ne '월'}">
	                                                	<td></td>
	                                                </c:if>	                                                

	                                                

	                                                <!-- 화요일, 9교시 시작 -->
	                                                <c:if test="${Tue.day eq '화' && Tue.startTime eq 9}">
	                                                	<td rowspan="${Tue.endTime - Tue.startTime+1}" 
	                                                		style="background-color: #ffd6aa; color:black; text-align:center;">
	                                                		<div>${Tue.subjectName}</div>
	                                                		<div>${Tue.professorName} 교수님</div>
	                                                		<div>${Tue.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && (Tue.endTime < 9 || Tue.startTime > 9)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && Tue.endTime ne 9}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Tue.day ne '화'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 수요일, 9교시 시작 -->
	                                                <c:if test="${Wed.day eq '수' && Wed.startTime eq 9}">
	                                                	<td rowspan="${Wed.endTime - Wed.startTime+1}" 
	                                                		style="background-color: #fff284; color:black; text-align:center;">
	                                                		<div>${Wed.subjectName}</div>
	                                                		<div>${Wed.professorName} 교수님</div>
	                                                		<div>${Wed.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && (Wed.endTime < 9 || Wed.startTime > 9)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && Wed.endTime ne 9}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Wed.day ne '수'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 목요일, 9교시 시작 -->
	                                                <c:if test="${Thu.day eq '목' && Thu.startTime eq 9}">
	                                                	<td rowspan="${Thu.endTime - Thu.startTime+1}" 
	                                                		style="background-color: #b4e0ff; color:black; text-align:center;">
	                                                		<div>${Thu.subjectName}</div>
	                                                		<div>${Thu.professorName} 교수님</div>
	                                                		<div>${Thu.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && (Thu.endTime < 9 || Thu.startTime > 9)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && Thu.endTime ne 9}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Thu.day ne '목'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                
	                                                <!-- 금요일, 9교시 시작 -->
	                                                <c:if test="${Fri.day eq '금' && Fri.startTime eq 9}">
	                                                	<td rowspan="${Fri.endTime - t.startTime+1}" 
	                                                		style="background-color: #dadafc; color:black; text-align:center;">
	                                                		<div>${Fri.subjectName}</div>
	                                                		<div>${Fri.professorName} 교수님</div>
	                                                		<div>${Fri.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && (Fri.endTime < 9 || Fri.startTime > 9)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && Fri.endTime ne 9}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Fri.day ne '금'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                            </tr>
                                            <!-- 9교시 끝 -->
                                            
                                            
                                            <!-- 10교시 -->
	                                            <tr>
	                                                <th>10교시(18:00~18:50)</th>
	                                                
	                                                <!-- 월요일 -->
	                                                <c:if test="${Mon.day eq '월' && Mon.startTime eq 10}">
	                                                	<td rowspan="${Mon.endTime - Mon.startTime+1}" 
	                                                		style="background-color: #f6d6e5; color:black; text-align:center">
	                                                		<div>${Mon.subjectName}</div>
	                                                		<div>${Mon.professorName} 교수님</div>
	                                                		<div>${Mon.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && (Mon.endTime < 10 || Mon.startTime > 10)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Mon.day eq '월' && Mon.endTime > 10}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Mon.day ne '월'}">
	                                                	<td></td>
	                                                </c:if>	                                                


	                                                
	                                                <!-- 화요일, 10교시 시작 -->
	                                                <c:if test="${Tue.day eq '화' && Tue.startTime eq 10}">
	                                                	<td rowspan="${Tue.endTime - Tue.startTime+1}" 
	                                                		style="background-color: #ffd6aa; color:black; text-align:center;">
	                                                		<div>${Tue.subjectName}</div>
	                                                		<div>${Tue.professorName} 교수님</div>
	                                                		<div>${Tue.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && (Tue.endTime < 10 || Tue.startTime > 10)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Tue.day eq '화' && Tue.endTime ne 10}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Tue.day ne '화'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 수요일, 10교시 시작 -->
	                                                <c:if test="${Wed.day eq '수' && Wed.startTime eq 10}">
	                                                	<td rowspan="${Wed.endTime - Wed.startTime+1}" 
	                                                		style="background-color: #fff284; color:black; text-align:center;">
	                                                		<div>${Wed.subjectName}</div>
	                                                		<div>${Wed.professorName} 교수님</div>
	                                                		<div>${Wed.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && (Wed.endTime < 10 || Wed.startTime > 10)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Wed.day eq '수' && Wed.endTime ne 10}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Wed.day ne '수'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                <!-- 목요일, 10교시 시작 -->
	                                                <c:if test="${Thu.day eq '목' && Thu.startTime eq 10}">
	                                                	<td rowspan="${Thu.endTime - Thu.startTime+1}" 
	                                                		style="background-color: #b4e0ff; color:black; text-align:center;">
	                                                		<div>${Thu.subjectName}</div>
	                                                		<div>${Thu.professorName} 교수님</div>
	                                                		<div>${Thu.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && (Thu.endTime < 10 || Thu.startTime > 10)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Thu.day eq '목' && Thu.endTime ne 10}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Thu.day ne '목'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                                
	                                                
	                                                <!-- 금요일, 10교시 시작 -->
	                                                <c:if test="${Fri.day eq '금' && Fri.startTime eq 10}">
	                                                	<td rowspan="${Fri.endTime - t.startTime+1}" 
	                                                		style="background-color: #dadafc; color:black; text-align:center;">
	                                                		<div>${Fri.subjectName}</div>
	                                                		<div>${Fri.professorName} 교수님</div>
	                                                		<div>${Fri.subjectRoom}</div>
	                                                	</td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && (Fri.endTime < 10 || Fri.startTime > 10)}">
	                                                	<td></td>
	                                                </c:if>
	                                                <c:if test="${Fri.day eq '금' && Fri.endTime ne 10}">
	                                                
	                                                </c:if>
	                                                <c:if test="${Fri.day ne '금'}">
	                                                	<td></td>
	                                                </c:if>
	                                                
	                                                
	                                            </tr>
                                            <!-- 10교시 끝 -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>                        
                    </div>
                </div>
            </c:if>
                <div class="row">
                        <div class="col-lg-6 col-md-12">
                            <div class="card">
                            <div class="card-body" style="min-height:450px;">
                                <h4 class="card-title">공지사항</h4>
                                <div class="table-responsive">
                                    <table class="table header-border table-hover verticle-middle">
                                        <thead>
                                            <tr>
                                                <th scope="col">공지제목</th>
                                                <th scope="col">작성일</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<c:forEach var="n" items="${noticeListTop}">
                                            <tr>
                                                <td>
                                                	<a href="${pageContext.request.contextPath}/notice/noticeOne?noticeNo=${n.noticeNo}">
                                                		${n.noticeTitle}
                                                	</a>
                                                </td>
                                                <td>${n.createDate}</td>
                                            </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            </div>
                            
                        </div>    
                        <div class="col-lg-3 col-md-6">
                            <div class="card card-widget">
                            	<c:if test="${user eq 'student'}">
	                                <div class="card-body" style="min-height:450px;">
	                                    <h5 class="text-muted">수업진행률</h5>
	                                    <h2 class="mt-4">5680명</h2>
	                                    <span>Total Revenue</span>
	                                    <div class="mt-4">
	                                        <h4>30</h4>
	                                        <h6>Online Order <span class="pull-right">30%</span></h6>
	                                        <div class="progress mb-3" style="height: 7px">
	                                            <div class="progress-bar bg-primary" style="width: 30%;" role="progressbar"><span class="sr-only">30% Order</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="mt-4">
	                                        <h4>50</h4>
	                                        <h6 class="m-t-10 text-muted">Offline Order <span class="pull-right">80%</span></h6>
	                                        <div class="progress mb-3" style="height: 7px">
	                                            <div class="progress-bar bg-success" style="width: 80%;" role="progressbar"><span class="sr-only">50% Order</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="mt-4">
	                                        <h4>20</h4>
	                                        <h6 class="m-t-10 text-muted">Cash On Develery <span class="pull-right">20%</span></h6>
	                                        <div class="progress mb-3" style="height: 7px">
	                                            <div class="progress-bar bg-warning" style="width: 20%;" role="progressbar"><span class="sr-only">20% Order</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
                                </c:if>
                                
                            	<c:if test="${user eq 'professor'}">
	                                <div class="card-body" style="min-height:450px;">
	                                    <h5 class="text-muted">강좌결석률</h5>
	                                    <h2 class="mt-4">5680명</h2>
	                                    <span>Total Revenue</span>
	                                    <div class="mt-4">
	                                        <h4>30</h4>
	                                        <h6>Online Order <span class="pull-right">30%</span></h6>
	                                        <div class="progress mb-3" style="height: 7px">
	                                            <div class="progress-bar bg-primary" style="width: 30%;" role="progressbar"><span class="sr-only">30% Order</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="mt-4">
	                                        <h4>50</h4>
	                                        <h6 class="m-t-10 text-muted">Offline Order <span class="pull-right">50%</span></h6>
	                                        <div class="progress mb-3" style="height: 7px">
	                                            <div class="progress-bar bg-success" style="width: 50%;" role="progressbar"><span class="sr-only">50% Order</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="mt-4">
	                                        <h4>20</h4>
	                                        <h6 class="m-t-10 text-muted">Cash On Develery <span class="pull-right">20%</span></h6>
	                                        <div class="progress mb-3" style="height: 7px">
	                                            <div class="progress-bar bg-warning" style="width: 20%;" role="progressbar"><span class="sr-only">20% Order</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
                                </c:if>
                                
                            	<c:if test="${user eq 'employee'}">
	                                <div class="card-body" style="min-height:450px;">
	                                    <h5 class="text-muted">전체 학생,직원 수</h5>
	                                    <h2 class="mt-4">총 ${total}명</h2>
	                                    <span>직원수, 교수, 학생</span>
	                                    <div class="mt-4">
	                                        <h4>${employeeCount}명</h4>
	                                        <h6>직원수<span class="pull-right">${employeeCount}%</span></h6>
	                                        <div class="progress mb-3" style="height: 7px">
	                                            <div class="progress-bar bg-primary" style="width: ${employeePer}%;" role="progressbar"><span class="sr-only">30% Order</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="mt-4">
	                                        <h4>${professorCount}명</h4>
	                                        <h6 class="m-t-10 text-muted">교수수<span class="pull-right">${professorPer}%</span></h6>
	                                        <div class="progress mb-3" style="height: 7px">
	                                            <div class="progress-bar bg-success" style="width: ${professorPer}%;" role="progressbar"><span class="sr-only">50% Order</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                    <div class="mt-4">
	                                        <h4>${studentCount}명</h4>
	                                        <h6 class="m-t-10 text-muted">학생수<span class="pull-right">${studentPer}%</span></h6>
	                                        <div class="progress mb-3" style="height: 7px">
	                                            <div class="progress-bar bg-warning" style="width: ${studentPer}%;" role="progressbar"><span class="sr-only">20% Order</span>
	                                            </div>
	                                        </div>
	                                    </div>
	                                </div>
                                </c:if>
                            </div>
                            
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="card">
                                <div class="card-body px-0" style="min-height:450px;">
                                    <h4 class="card-title px-4 mb-3">Todo</h4>
                                    <div class="todo-list">
                                        <div class="tdl-holder">
                                            <div class="tdl-content">
                                                <ul id="todo_list">
                                                    <li><label><input type="checkbox"><i></i><span>라떼LMS 예쁘게 봐주세요!</span><a href='#' class="ti-trash"></a></label></li>
                                                    <li><label><input type="checkbox" checked><i></i><span>약속!</span><a href='#' class="ti-trash"></a></label></li>
                                                </ul>
                                            </div>
                                            <div class="px-4">
                                                <input type="text" class="tdl-new form-control" placeholder="이곳에 Todo 작성하기">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                
                <div class="row">
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="./images/users/8.jpg" class="rounded-circle" alt="">
                                    <h5 class="mt-3 mb-1">이재은</h5>
                                    <p class="m-0">JAEEUN LEE</p>
                                    <!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="./images/users/5.jpg" class="rounded-circle" alt="">
                                    <h5 class="mt-3 mb-1">김희원</h5>
                                    <p class="m-0">HEEWON KIM</p>
                                    <!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="./images/users/7.jpg" class="rounded-circle" alt="">
                                    <h5 class="mt-3 mb-1">정지영</h5>
                                    <p class="m-0">GIYOUNG JUNG</p>
                                    <!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="text-center">
                                    <img src="./images/users/1.jpg" class="rounded-circle" alt="">
                                    <h5 class="mt-3 mb-1">추서정</h5>
                                    <p class="m-0">SEOJEONG COUU</p>
                                    <!-- <a href="javascript:void()" class="btn btn-sm btn-warning">Send Message</a> -->
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