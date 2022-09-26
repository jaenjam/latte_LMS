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

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">Home</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 col-xl-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="media align-items-center mb-4">
                                    <img class="mr-2" src="images/avatar/11.png" width="80" height="80" alt="">
                                   
                                
                                </div>
                           
                                
                                <div class="row mb-8">
                                    <div class="col-12 text-center">
                                        <button class="btn btn-danger px-5"> 사진첨부하기 </button>
                                    </div>
                                </div>

                            </div>
                        </div>  
                    </div>
                    <div class="col-lg-8 col-xl-9">
                        <div class="card">
                            <div class="card-body">
                                <form action="${pageContext.request.contextPath}/modifyStudentPass" class="form-profile">
                                    <div class="form-group">
                                      
                                     <h4 class="card-title"> 정보수정하기 </h4>
                                  <div class="basic-form">
	                                 
		             					<div class="form-row">
				             				<div class="form-group col-md-8">	
				             					<div class="form-group">
												<label> 이름: </label>
												<input type="text" class="form-control" name="studentName" id="studentName"
		                                           value="${Name}" readonly="readonly">
												</div>
												
												<div class="form-group">
												<label> 학번: </label>
												<input type="text" class="form-control" name="studentNo" id="studentNo"
		                                           value="${No}" readonly="readonly">
												</div>
												
												<!--  조건에 따라 비밀번호 전송값이 달라짐 -->
												<div class="form-group">
												<label> 비밀번호: </label>
												
												<input type="text" class="form-control" name="studentPassF" id="studentPassF">												
												<input type="hidden" class="form-control" name="studentPass" id="studentPass"
		                                           value="${studentPass}">
												</div>
												
												
												
												<div class="form-group">
												<label> 전공: </label>
													<input type="text" class="form-control" name="studentMajor" id="studentMajo"
			                                           value="${studentMajor}" readonly="readonly">
												</div>
												
												<div class="form-group">
												<label> 주민번호: </label>
													<input type="text" class="form-control" name="studentRegiNo" id="studentRegiNo"
			                                           value="${studentRegiNo}" readonly="readonly">
												</div>
												
												<div class="form-group">		
												<label> 나이: </label>
													<input type="text" class="form-control" name="studentAge" id="studentAge"
			                                           value="${studentAge}" readonly="readonly">
			                                           </div>
			                                           
			                                    <div class="form-group">       
												<label> 성별: </label>
													<input type="text" class="form-control" name="studentGender" id="studentGender"
			                                           value="${studentGender}" readonly="readonly">
			                                           <span> ※ 변경을 원한다면 행정실로 문의주세요! </span>
			                                    </div>      
												
												<div class="form-group">
												<label> 핸드폰: </label>
													<input type="text" class="form-control" name="studentTelephone" id="studentNo"
			                                           value="${studentTelephone}">
												</div>
												
												<div class="form-group">
												<label> 이메일: </label>
													<input type="text" class="form-control" name="studentEmail" id="studentEmail"
			                                           value="${studentEmail}">
												</div>
												
												<div class="form-group">
												<label> 주소: </label>
													<input type="text" class="form-control" name="studentAddress" id="studentAddress"
			                                           value="${studentAddress}">
												</div>
												
												<div class="form-group">
												<label> 상세주소: </label>
													<input type="text" class="form-control" name="studentDetailAddress" id="studentDetailAddress"
			                                           value="${studentDetailAddress}">
												</div>
												
												<div class="form-group">
												<label> 학적상태: </label>
													<input type="text" class="form-control" name="studentState" id="studentState"
			                                           value="${studentState}" readonly="readonly">	
				                                 </div>          							
											</div>
										</div>
										    
                                    </div>
                                      <button type="submit" class="btn btn-primary px-3 ml-4"> 정보수정완료 </button>                                                                   
                                </form>
                                	  <button class="btn btn-primary px-3 ml-4" type="button" id="backStudentOnePage" name="backStudentOnePage"> 이전화면으로 </button>   
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
        





    <!--**********************************
        Scripts
    ***********************************-->
<!--  비밀번호 입력 비교 함수 -->    
<script>
$.



</script>    
    
    
<script>
    
    $('#backStudentOnePage').click(function() {
    	alert('이전화면으로 돌아갑니다!');
    	history.back();
    });
    
    
</script> 
    
    
    
    
    <script src="plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>


</body>

</html>