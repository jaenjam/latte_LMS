<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html class="h-100" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>latte_LMS</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../../assets/images/favicon.png">
    <!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
    <link href="css/style.css" rel="stylesheet">
    
</head>

<body class="h-100">
    
    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    



    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                            
                            	<h2 class="text-center">로그인</h2>
								<br>
								
                                <!-- Nav tabs -->
                                <div class="default-tab">
                                    <ul class="nav nav-tabs mb-3" role="tablist">
                                        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#student">Student</a>
                                        </li>
                                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#professor">Professor</a>
                                        </li>
                                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#employee">Employee</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                    
                                    
                                    <!-- Student Form -->
                                    
                                        <div class="tab-pane fade show active" id="studnet" role="tabpanel">
                                            <div class="p-t-15">
	                                            <form class="mt-5 mb-5 login-input" action="${pageContext.request.contextPath}/StudentForm" method="post">
				                                    <div class="form-group">
				                                        <input type="text" class="form-control" name="studentNo" id="studentNo" placeholder="Id" value="300001">
				                                    </div>
				                                    <div class="form-group">
				                                        <input type="password" class="form-control" name="studentPass" id="studentPass" placeholder="Password" value="1234">
				                                    </div>
				                                    <button class="btn login-form__btn submit w-100" type="submit" id="loginBtn">Sign In</button>
				                                </form>
				                                
			                                	<p class="mt-5 login-form__footer">Dont have account? <a href="${pageContext.request.contextPath}/addStudent" class="text-primary">Sign Up</a> now</p>
                                            </div>
                                        </div>
                                        
                                        <!-- Professor Form -->
                                        
                                        <div class="tab-pane fade" id="professor">
                                            <div class="p-t-15">
	                                            <form class="mt-5 mb-5 login-input" action="${pageContext.request.contextPath}/ProfessorForm" method="post">
				                                    <div class="form-group">
				                                        <input type="text" class="form-control" name="professorNo" id="professorNo" placeholder="Id" value="100001">
				                                    </div>
				                                    <div class="form-group">
				                                        <input type="password" class="form-control" name="professorPass" id="professorPass" placeholder="Password" value="1234">
				                                    </div>
				                                    <button class="btn login-form__btn submit w-100" type="submit" id="loginBtn">Sign In</button>
				                                </form>
				                                
			                                	<p class="mt-5 login-form__footer">Dont have account? <a href="${pageContext.request.contextPath}/addProfessor" class="text-primary">Sign Up</a> now</p>
			                                </div>
                                        </div>
                                        
                                        <!-- Employee Form -->
                                        
                                        <div class="tab-pane fade" id="employee">
                                            <div class="p-t-15">
	                                            <form class="mt-5 mb-5 login-input" action="${pageContext.request.contextPath}/EmployeeForm" method="post">
				                                    <div class="form-group">
				                                        <input type="text" class="form-control" name="employeeNo" id="employeeNo" placeholder="Id" value="200001">
				                                    </div>
				                                    <div class="form-group">
				                                        <input type="password" class="form-control" name="employeePass" id="employeePass" placeholder="Password" value="1234">
				                                    </div>
				                                    <button class="btn login-form__btn submit w-100" type="submit" id="loginBtn">Sign In</button>
				                                </form>
				                                
			                                	<p class="mt-5 login-form__footer">Dont have account? <a href="${pageContext.request.contextPath}/addEmployee" class="text-primary">Sign Up</a> now</p>
			                                </div>
			                            </div>
			                            
                                        </div>
                                    </div>
                                </div>
                            
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>
</body>
</html>