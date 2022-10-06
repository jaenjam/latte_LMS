<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="kor">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>latte_LMS</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="images/favicon.png">
<!-- Pignose Calender -->
<link
	href="${pageContext.request.contextPath}/plugins/pg-calendar/css/pignose.calendar.min.css"
	rel="stylesheet">
<!-- Chartist -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/chartist/css/chartist.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
<!-- Custom Stylesheet -->
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
</head>

<style>

.nav-header .brand-logo a {
    padding: 0.8rem 1.7rem;
    display: block;
}


</style>

<body>

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10" />
            </svg>
		</div>
	</div>
	<!--*******************
        Preloader end
    ********************-->

	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">

		<!--**********************************
            Nav header start
        ***********************************-->
		<div class="nav-header">
			<div class="brand-logo">
				<a href="${pageContext.request.contextPath}/home?No=${No}"> <b
					class="logo-abbr"><img
						src="${pageContext.request.contextPath}/images/logo_cut.png" alt="">
				</b> <span class="logo-compact"><img
						src="${pageContext.request.contextPath}/images/logo-compact.png"
						alt=""></span> <span class="brand-title"> <img
						src="${pageContext.request.contextPath}/images/logo5.png"
						alt="">
				</span>
				</a>
			</div>
		</div>
		<!--**********************************
            Nav header end
        ***********************************-->

		<!--**********************************
            Header start
        ***********************************-->
		<div class="header">
			<div class="header-content clearfix">

				<div class="nav-control">
					<div class="hamburger">
						<span class="toggle-icon"><i class="icon-menu"></i></span>
					</div>
				</div><!-- 클릭시 메뉴 반응 -->
				
			
				<div class="header-right">
					<ul class="clearfix">
						<li class="icons dropdown">
							<div class="drop-down animated fadeIn dropdown-menu">
								<div
									class="dropdown-content-heading d-flex justify-content-between">
									
								</div>
							
							</div></li>
					
						
						<!-- 접속한 사람이름 -->
						<li class="icons dropdown d-none d-md-flex">
							<p>${Name} (${No}) 님 환영합니다</p>
						</li>


						<li class="icons dropdown">
						
						<!-- header 교수진 -->
						<c:if test="${user eq 'professor'}">
								<div class="user-img c-pointer position-relative"
									data-toggle="dropdown">
									<span class="activity active"></span>
									<!-- 여기 사진부분 -->
									
										<c:if test="${empty professorImg}">
										<!-- 값이 비어있을때 images 폴더안에 있는 기본값 뜨게 만들기 -->
										<img src="${pageContext.request.contextPath}/images/userprofile/image.jpg"
											height="40" width="40" alt="">
										</c:if>
										
									<!-- 값이 있으면 professorImg 셀렉 값 찾아와서 내 사진 보여주기 -->
									<c:forEach var="I" items="${professorImg}">
										<c:if test="${I.filename ne null}">
											<img src="${pageContext.request.contextPath}/images/userprofile/${I.filename}${I.contentType}"
												height="40" width="40" alt="">
										</c:if>
									</c:forEach>
									
								</div>
							</c:if>
							
							<c:if test="${user eq 'employee'}">
								<div class="user-img c-pointer position-relative"
									data-toggle="dropdown">
									<span class="activity active"></span>
									<!-- 사진 -->
									
										<c:if test="${empty employeeImg}">
										<!-- 값이 비어있을때 images 폴더안에 있는 기본값 뜨게 만들기 -->
										<img src="${pageContext.request.contextPath}/images/userprofile/image.jpg"
											height="40" width="40" alt="">
										</c:if>
										
									<!-- 값이 있으면 studentImg 셀렉 값 찾아와서 내 사진 보여주기 -->
									<c:forEach var="I" items="${employeeImg}">
										<c:if test="${I.filename ne null}">
											<img src="${pageContext.request.contextPath}/images/userprofile/${I.filename}${I.contentType}"
												height="40" width="40" alt="">
										</c:if>
									</c:forEach>
									
								</div>
							</c:if>
							
						<!-- header 학생사진 -->	
							<c:if test="${user eq 'student'}">
								<div class="user-img c-pointer position-relative"
									data-toggle="dropdown">
									<span class="activity active"></span>
									<!-- 사진 -->
									
										<c:if test="${empty studentImg}">
										<!-- 값이 비어있을때 images 폴더안에 있는 기본값 뜨게 만들기 -->
										<img src="${pageContext.request.contextPath}/images/userprofile/image.jpg"
											height="40" width="40" alt="">
										</c:if>
										
									<!-- 값이 있으면 studentImg 셀렉 값 찾아와서 내 사진 보여주기 -->
									<c:forEach var="I" items="${studentImg}">
										<c:if test="${I.filename ne null}">
											<img src="${pageContext.request.contextPath}/images/userprofile/${I.filename}${I.contentType}"
												height="40" width="40" alt="">
										</c:if>
									</c:forEach>
									
								</div>
							</c:if>





							<div
								class="drop-down dropdown-profile animated fadeIn dropdown-menu">
								<c:if test="${user eq 'employee'}">
									<div class="dropdown-content-body">
										<ul>
											<li><a
												href="${pageContext.request.contextPath}/getEmployeeOne?employeeNo=${No}"><i
													class="icon-user"></i> <span>마이페이지</span> </a></li>
											<hr class="my-2">
											<li><a href="/loginForm"><i class="icon-key"></i> <span>Logout</span></a></li>
										</ul>
									</div>
								</c:if>

								<c:if test="${user eq 'student'}">
									<div class="dropdown-content-body">
										<ul>
											<li><a
												href="${pageContext.request.contextPath}/getStudentOne?studentNo=${No}"><i
													class="icon-user"></i> <span>마이페이지</span> </a></li>
											<hr class="my-2">
											<li><a href="/loginForm"><i class="icon-key"></i> <span>Logout</span></a></li>
										</ul>
									</div>
								</c:if>

								<c:if test="${user eq 'professor'}">
									<div class="dropdown-content-body">
										<ul>
											<li><a
												href="${pageContext.request.contextPath}/getProfessorOne?professorNo=${No}"><i
													class="icon-user"></i> <span>마이페이지</span> </a></li>
											<hr class="my-2">
											<li><a href="/loginForm"><i class="icon-key"></i> <span>Logout</span></a></li>
										</ul>
									</div>
								</c:if>


							</div></li>
					</ul>
				</div>
			</div>
		</div>
		</div>
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->