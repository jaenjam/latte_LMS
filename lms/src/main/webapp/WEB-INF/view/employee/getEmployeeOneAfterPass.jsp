<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>


<html>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial;}

/* Style the tab */
.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
  font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
  background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
  background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
</style>
</head>
<body>

<!-- header.jsp -->
<%@include file = "/WEB-INF/template/header.jsp"%>

<!-- sidebar.jsp -->
<%@include file = "/WEB-INF/template/sidebar.jsp"%>
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
                                <form action="${pageContext.request.contextPath}/modifyEmployeePass" method="post" class="form-profile">
                                    <div class="form-group">
                                    
                                    <h4 class="card-title"> 정보 수정하기 </h4>
                                  <div class="basic-form">
                                      
                                     <div class="form-row">
				             				<div class="form-group col-md-8">	
				             				<div class="form-group">
												<label> 등급 </label>
													<input type="text" class="form-control" name="employeeActive" id="employeeActive"
			                                           value="${employeeActive}">	
				                                 </div>     
				             					<div class="form-group">
				       							<label> 사번 </label>
												<input type="text" class="form-control" name="employeeNo" id="employeeNo"
		                                           value="${No}">
												</div>
												<div class="form-group">
												<label> 이름 </label>
												<input type="text" class="form-control" name="employeeName" id="employeeName"
		                                           value="${Name}">
												</div>

												<div class="form-group">
												<label> 주민번호 </label>
													<input type="text" class="form-control" name="employeeRegiNo" id="employeeRegiNo"
			                                           value="${employeeRegiNo}">
												</div>
												
												<div class="form-group">		
												<label> 나이 </label>
													<input type="text" class="form-control" name="employeeAge" id="employeeAge"
			                                           value="${employeeAge}">
			                                           </div>
			                                           
			                                    <div class="form-group">       
												<label> 성별 </label>
													<input type="text" class="form-control" name="employeeGender" id="employeeGender"
			                                           value="${employeeGender}">
			                                    </div>      
												
												<div class="form-group">
												<label> 핸드폰 </label>
													<input type="text" class="form-control" name="employeeTelephone" id="employeeTelephone"
			                                           value="${employeeTelephone}">
												</div>
												
												<div class="form-group">
												<label> 이메일 </label>
													<input type="text" class="form-control" name="employeeEmail" id="employeeEmail"
			                                           value="${employeeEmail}">
												</div>
												
												<div class="form-group">
												<label> 주소 </label>
													<input type="text" class="form-control" name="employeeAddress" id="employeeAddress"
			                                           value="${employeeAddress}">
												</div>
												
												<div class="form-group">
												<label> 상세주소 </label>
													<input type="text" class="form-control" name="employeeDetailAddress" id="employeeDetailAddress"
			                                           value="${employeeDetailAddress}">
												</div>
												<div class="form-group">
												<button type="button" style="float: right;"
													id="employeeAddrBtn" class="btn btn-light">주소검색</button>
											</div>
											
											<div id="layer"
		style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
			id="btnCloseLayer"
			style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
			onclick="closeDaumPostcode()" alt="닫기 버튼">
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