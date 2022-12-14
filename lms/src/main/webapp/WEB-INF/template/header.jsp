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
<link rel="icon" type="image/png" sizes="16x16" href="${pageContext.request.contextPath}/images/head.png">
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
				</div><!-- ????????? ?????? ?????? -->
				
				<div class="header-left">
					<div class="input-group icons">
						<div class="input-group-prepend">
						</div>
						<div class="drop-down animated flipInX d-md-none">
							<form action="#">
								<input type="text" class="form-control" placeholder="Search">
							</form>
						</div>
					</div>
				</div>
				
				<div class="header-right">
					<ul class="clearfix">
					
						
						<!-- ????????? ???????????? -->
						<li class="icons dropdown d-none d-md-flex">
							<p>${Name} (${No}) ??? ???????????????</p>
						</li>


						<li class="icons dropdown">
						
						<!-- header ????????? -->
						<c:if test="${user eq 'professor'}">
								<div class="user-img c-pointer position-relative"
									data-toggle="dropdown">
									<span class="activity active"></span>
									<!-- ?????? ???????????? -->
									
										<c:if test="${empty professorImg}">
										<!-- ?????? ??????????????? images ???????????? ?????? ????????? ?????? ????????? -->
										<img src="${pageContext.request.contextPath}/images/userprofile/image.jpg"
											height="40" width="40" alt="">
										</c:if>
										
									<!-- ?????? ????????? professorImg ?????? ??? ???????????? ??? ?????? ???????????? -->
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
									<!-- ?????? -->
									
										<c:if test="${empty employeeImg}">
										<!-- ?????? ??????????????? images ???????????? ?????? ????????? ?????? ????????? -->
										<img src="${pageContext.request.contextPath}/images/userprofile/image.jpg"
											height="40" width="40" alt="">
										</c:if>
										
									<!-- ?????? ????????? studentImg ?????? ??? ???????????? ??? ?????? ???????????? -->
									<c:forEach var="I" items="${employeeImg}">
										<c:if test="${I.filename ne null}">
											<img src="${pageContext.request.contextPath}/images/userprofile/${I.filename}${I.contentType}"
												height="40" width="40" alt="">
										</c:if>
									</c:forEach>
									
								</div>
							</c:if>
							
						<!-- header ???????????? -->	
							<c:if test="${user eq 'student'}">
								<div class="user-img c-pointer position-relative"
									data-toggle="dropdown">
									<span class="activity active"></span>
									<!-- ?????? -->
									
										<c:if test="${empty studentImg}">
										<!-- ?????? ??????????????? images ???????????? ?????? ????????? ?????? ????????? -->
										<img src="${pageContext.request.contextPath}/images/userprofile/image.jpg"
											height="40" width="40" alt="">
										</c:if>
										
									<!-- ?????? ????????? studentImg ?????? ??? ???????????? ??? ?????? ???????????? -->
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
													class="icon-user"></i> <span>???????????????</span> </a></li>
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
													class="icon-user"></i> <span>???????????????</span> </a></li>
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
													class="icon-user"></i> <span>???????????????</span> </a></li>
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
		<!--**********************************
            Header end ti-comment-alt
        ***********************************-->