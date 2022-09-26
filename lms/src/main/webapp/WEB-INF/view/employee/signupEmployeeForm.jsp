<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html class="h-100" lang="kor">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>latte_LMS</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="../../assets/images/favicon.png">
<!-- <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous"> -->
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>

<body class="h-100" data-theme-version="light" data-layout="vertical"
	data-nav-headerbg="color_1" data-headerbg="color_1"
	data-sidebar-style="mini" data-sibebarbg="color_1"
	data-sidebar-position="static" data-header-position="static"
	data-container="wide" direction="ltr">

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader" style="display: none;">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10"></circle>
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
								<a class="text-center"
									href="${pageContext.request.contextPath}/employee/signupEmployeeForm">
									<h4>관리자 회원가입</h4>
								</a>

								<div class="card-body">
									<div class="basic-form">
										<form
											action="${pageContext.request.contextPath}/employee/signupEmployeeForm"
											method="post" id="addEmployee">
											<div class="form-row">
												<div class="form-group col-md-6">
													<label>사번</label> <input type="text" class="form-control"
														name="employeeNo" id="employeeNo"> <span
														class="employeeNo_re1"> 사번을 입력해주세요 </span> <span
														class="employeeNo_re2"> 사용가능한 사번입니다 </span> <span
														class="employeeNo_re3"> 해당 사번이 이미 존재합니다 </span>

												</div>
												<div class="form-group col-md-6">
													<label>비밀번호</label> <input type="password"
														class="form-control" name="employeePass" id="employeePass">
													<span class="employeePass_re1"> 비밀번호를 입력해주세요 </span>
												</div>
											</div>
											<div class="form-group">
												<label>이름</label> <input type="text" class="form-control"
													name="employeeName" id="employeeName"> <span
													class="employeeName_re1"> 이름을 입력해주세요 </span>

											</div>



											<div class="form-group">
												<label>주민번호</label> <input type="text" class="form-control"
													name="employeeRegiNo" id="employeeRegiNo">
													<span
													class="employeeRegiNo_re1"> 주민번호를 입력해주세요 </span>
											</div>

											<div class="form-group">
												<label>나이</label> <input type="text" class="form-control"
													name="employeeAge" id="employeeAge">
											</div>

											<div class="form-group">
												<label>성별</label><br> <input type="radio"
													name="employeeGender" value="남자"> 남자 <input
													type="radio" name="employeeGender" value="여자"> 여자 <span
													class="employeeGender_re1"> 성별을 선택해주세요 </span>

											</div>

											<div class="form-group">
												<label>전화번호</label> <input type="text" class="form-control"
													name="employeeTelephone" id="employeeTelephone"> <span
													class="employeeTelephone_re1"> 전화번호를 입력해주세요 </span>

											</div>

											<div class="form-group">
												<label>이메일</label> <input type="text" class="form-control"
													name="employeeEmail" id="employeeEmail"> <span
													class="employeeEmail_re1"> 이메일을 입력해주세요 </span> <span
													class="employeeEmail_re2"> 이메일 형식을 확인해주세요 </span> <span
													class="employeeEmail_re3"> 사용가능한 이메일입니다 </span>

											</div>
											<div class="form-group">
												<label>주소</label> <input type="text" class="form-control"
													name="employeeAddress" id="employeeAddress"> <span
													class="employeeAddress_re1"> 주소를 입력해주세요 </span>

											</div>
											<div class="row">
												<div class="col-sm-9">
													<div class="form-group">
														<label>상세주소</label> <input type="text"
															class="form-control" name="employeeDetailAddress"
															id="employeeDetailAddress">
															
															<span
													class="employeeDetailAddress_re1"> 상세주소를 입력해주세요 </span>
													</div>
												</div>

												<div class="col-sm-2">
													<div class="form-group">
														<button type="button" style="margin-top: 33px;"
															id="employeeAddrBtn" class="btn btn-light">주소검색</button>
													</div>
												</div>
											</div>
											<div class="form-group">
												<button type="button" class="btn btn-dark"
													id="addEmployeeBtn">회원가입</button>
											</div>
										</form>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="layer"
		style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
		<img src="//t1.daumcdn.net/postcode/resource/images/close.png"
			id="btnCloseLayer"
			style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
			onclick="closeDaumPostcode()" alt="닫기 버튼">
	</div>

	<!--**********************************
        Scripts
    ***********************************-->

	<script>
		$('#employeeAddrBtn').click(function() {
			sample2_execDaumPostcode();
		});
	</script>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		var element_layer = document.getElementById('layer'); //jquery 코드로 변경하면 $('#layer')...

		function closeDaumPostcode() {
			// iframe을 넣은 element를 안보이게 한다.
			element_layer.style.display = 'none';
		}

		function sample2_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								//  document.getElementById("sample2_extraAddress").value = extraAddr;

							} else {
								//  document.getElementById("sample2_extraAddress").value = '';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							// document.getElementById('sample2_postcode').value = data.zonecode;
							// document.getElementById("sample2_address").value = addr;

							// 나중에 제이ㅜ커리 쓸거면 $('#memberAddr').val(data.zonecode +' ' + memberAddr);
							// 우리거에도 너헝보기
							// document.getElementById('memberAddr').value = data.zonecode +' ' + memberAddr;
							document.getElementById('employeeAddress').value = data.zonecode
									+ ' ' + addr;

							// 커서를 상세주소 필드로 이동한다.
							// document.getElementById("sample2_detailAddress").focus();

							// iframe을 넣은 element를 안보이게 한다.
							// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
							element_layer.style.display = 'none';
						},
						width : '100%',
						height : '100%',
						maxSuggestItems : 5
					}).embed(element_layer);

			// iframe을 넣은 element를 보이게 한다.
			element_layer.style.display = 'block';

			// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
			initLayerPosition();
		}

		// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
		// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
		// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
		function initLayerPosition() { // 팝업창 어떻게 띄울건지-----------------------------------------------------------
			var width = 300; //우편번호서비스가 들어갈 element의 width
			var height = 400; //우편번호서비스가 들어갈 element의 height
			var borderWidth = 5; //샘플에서 사용하는 border의 두께

			// 위에서 선언한 값들을 실제 element에 넣는다.
			element_layer.style.width = width + 'px';
			element_layer.style.height = height + 'px';
			element_layer.style.border = borderWidth + 'px solid';
			// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
			element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width) / 2 - borderWidth)
					+ 'px';
			element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height) / 2 - borderWidth)
					+ 'px';
		}
	</script>

	
	<script>
		// 입력 이메일 유효성검사
		function mailcheckLt(employeeEmail) {
			var emailform = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;

			return emailform.test(employeeEmail);

		}

		// 유효성 검사 통과유무 변수
		var employeeNoCk = false; // 사번
		var employeePassCk = false; // 비밀번호
		var employeeNameCk = false; // 이름
		var employeeRegiNoCk = false; // 주민
		var employeeGenderCk = false; // 성별
		var employeeTelephoneCk = false; // 핸드폰
		var employeeEmailCk = false; // 이메일
		var employeeAddressCk = false; // 주소
		var employeeDetailAddressCk = false; // 상세주소

		$(document)
				.ready(
						function() {

							// 회원가입 버튼(회원가입 기능 작동)
							$("#addEmployeeBtn")
									.click(
											function() {

												// 입력란변수
												var employeeNo = $('#employeeNo')
														.val();
												var employeePass = $(
														'#employeePass').val();
												var employeeName = $(
														'#employeeName').val();
												var employeeRegiNo = $(
														'#employeeRegiNo').val();
												var employeeAge = $(
														'#employeeAge').val();
												var employeeGender = $(
														"input[name='employeeGender']:checked")
														.val();

												var employeeTelephone = $(
														'#employeeTelephone')
														.val();
												var employeeEmail = $(
														'#employeeEmail').val();
												var employeeAddress = $(
														'#employeeAddress')
														.val();
												var employeeDetailAddress = $(
														'#employeeDetailAddress')
														.val();

												// 사번 유효성검사
												if (employeeNo == "") { // 아무것도 입력안하면
													$('.employeeNo_re1').css(
															'display', 'block');
													$('#employeeNo').focus();
													employeeNoCk = false;
													return;
												} else {
													$('.employeeNo_re1').css(
															'display', 'none');
													employeeNoCk = true;
												}

												// 비밀번호 유효성검사
												if (employeePass == "") { // 아무것도 입력안하면
													$('.employeePass_re1').css(
															'display', 'block');
													$('#employeePass').focus();
													console
															.log("$('#employeePass').val();")
													employeePassCk = false;
													return;
												} else {
													$('.employeePass_re1').css(
															'display', 'none');
													employeePassCk = true;
												}
												

												// 이름 유효성검사
												console.log(employeeName)
												if (employeeName == "") { // 아무것도 입력안하면
													$('#employeeName_re1').css(
															'display', 'block');
													$('#employeePass').focus();
													employeeNameCk = false;
													return;
												} else {
													$('#employeeName_re1').css(
															'display', 'none');
													employeeNameCk = true;
												}

												// 주민번호 유효성 검사
												if (employeeRegiNo == "") { // 아무것도 입력안하면
													$('#employeeRegiNo_re1')
															.css('display',
																	'block');
													$('#employeeRegiNo').focus();
													employeeRegiNoCk = false;
													return;
												} else {
													$('#employeeRegiNo_re1')
															.css('display',
																	'none');
													employeeRegiNoCk = true;
												}

												// 성별 유효성검사
												if (employeeGender == "") { // 아무것도 입력안하면
													$('#employeeGender_re1')
															.css('display',
																	'block');
													$('#employeeGender').focus();
													employeeGenderCk = false;
													return;
												} else {
													$('#employeeGender_re1')
															.css('display',
																	'none');
													employeeGenderCk = true;
												}

												// 핸드폰 유효성검사
												if (employeeTelephone == "") { // 아무것도 입력안하면
													$('#employeeTelephone_re1')
															.css('display',
																	'block');
													$('#employeeTelephone')
															.focus();
													employeeTelephoneCk = false;
													return;
												} else {
													$('#employeeTelephone_re1')
															.css('display',
																	'none');
													employeeTelephoneCk = true;
												}

												// 이메일 유효성검사
												if (employeeEmail == "") { // 아무것도 입력안하면
													$('.employeeEmail_re1').css(
															'display', 'block');
													$('.employeeEmail_re2').css(
															'display', 'none');
													$('.employeeEmail_re3').css(
															'display', 'none');

													$('#employeeEmail').focus();
													employeeEmailCk = false;
													return;
												} else if (!mailcheckLt(employeeEmail)) {
													$('.employeeEmail_re1').css(
															'display', 'none');
													$('.employeeEmail_re2').css(
															'display', 'block');
													$('.employeeEmail_re3').css(
															'display', 'none');
													return;

												} else {
													$('.employeeEmail_re1').css(
															'display', 'none');
													$('.employeeEmail_re2').css(
															'display', 'none');
													$('.employeeEmail_re3').css(
															'display', 'block');
													employeeEmailCk = true;
												}

												// 주소 유효성검사
												if (employeeAddress == "") { // 아무것도 입력안하면
													$('#employeeAddress_re1')
															.css('display',
																	'block');
													$('#employeeAddress')
															.focus();
													employeeAddressCk = false;
													return;
												} else {
													$('#employeeAddress_re1')
															.css('display',
																	'none');
													employeeAddressCk = true;
												}

												// 상세주소 유효성검사
												if (employeeDetailAddress == "") { // 아무것도 입력안하면
													$(
															'#employeeDetailAddress_re1')
															.css('display',
																	'block');
													$('#employeeDetailAddress')
															.focus();
													employeeDetailAddressCk = false;
													return;
												} else {
													$(
															'#employeeDetailAddress_re1')
															.css('display',
																	'none');
													employeeDetailAddressCk = true;
												}

												// 최종유효성검사
												if (employeeNoCk
														&& employeePassCk
														&& employeeNameCk
														&& employeeRegiNoCk
														&& employeeGenderCk
														&& employeeTelephoneCk
														&& employeeEmailCk
														&& employeeAddressCk
														&& employeeDetailAddressCk) {

													console.log("1")
													$('#addEmployee')
															.submit();
												} else {

													console.log("2")
												}

												return false;

											});

						});

		// 도큐먼트 끝

		// 아이디 중복검사
		$('#employeeNo').on("propertychange change keyup paste input",
				function() {

					console.log("keyup 테스트");

					var employeeNo = $('#employeeNo').val();
					var data = {
							employeeNo : employeeNo
					}

					$.ajax({
						type : "post",
						url : "/employeeNoChk",
						data : data,
						success : function(result) {
							if (result == "fail") {
								$('.employeeNo_re1').css('display', 'none');
								$('.employeeNo_re2').css('display', 'none');
								$('.employeeNo_re3').css('display', 'block');
							} else {
								$('.employeeNo_re1').css('display', 'none');
								$('.employeeNo_re2').css('display', 'block');
								$('.employeeNo_re3').css('display', 'none');
							}
							console.log("성공 여부" + result);
						} // success 종료

					}); // ajax 종료	

				});

		// 나이 게산
		$('#employeeRegiNo').on("focusout", function() {
			console.log("keyup 나이 테스트");

			const today = new Date();

			var birthDate = $("#employeeRegiNo").val().substring(0, 2);
			console.log(birthDate)

			//02
			if (birthDate.substring(0, 1) == 0) {
				birthDate = "20" + birthDate;
			} else {
				// 9*
				birthDate = "19" + birthDate;
			}
			birthDate = new Date(birthDate);

			let age = today.getFullYear() - birthDate.getFullYear() + 1;

			console.log(age)
			$("#employeeAge").val(age)
		});
	</script>
	
	
	
	
	
	

	<script
		src="${pageContext.request.contextPath}/plugins/common/common.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/custom.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/settings.js"></script>
	<script src="${pageContext.request.contextPath}/js/gleek.js"></script>
	<script src="${pageContext.request.contextPath}/js/styleSwitcher.js"></script>


</body>
</html>