<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>



        <!--**********************************
            Content body start
        ***********************************-->
		<div class="content-body" style="min-height: 876px;">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">나의강의실</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">시간표</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
							<div class="card-body">
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
                    <!-- /# column -->
                </div>
            </div>
            <!-- #/ container -->
        </div>


<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>