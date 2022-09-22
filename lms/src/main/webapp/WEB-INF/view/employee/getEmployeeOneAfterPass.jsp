<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>


<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	font-family: Arial;
}

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
	<%@include file="/WEB-INF/template/header.jsp"%>

	<!-- sidebar.jsp -->
	<%@include file="/WEB-INF/template/sidebar.jsp"%>
	<!--**********************************
            Content body start
        ***********************************-->
	<div class="content-body">

		<div class="row page-titles mx-0">
			<div class="col p-md-0">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="javascript:void(0)">Dashboard</a></li>
					<li class="breadcrumb-item active"><a
						href="javascript:void(0)">Home</a></li>
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
								<img class="mr-2" src="images/avatar/11.png" width="80"
									height="80" alt="">


							</div>


							<div class="row mb-8">
								<div class="col-12 text-center">
									<button class="btn btn-danger px-5">사진첨부하기</button>
								</div>
							</div>

						</div>
					</div>
				</div>
				<div class="col-lg-8 col-xl-9">
					<div class="card">
						<div class="card-body">
							<form
								action="${pageContext.request.contextPath}/modifyEmployeePass"
								method="post" class="form-profile">
								<div class="form-group">

									<h4 class="card-title">정보 수정하기</h4>
									<div class="basic-form">

										<div class="form-row">
											<div class="form-group col-md-8">
												<div class="form-group">
													<label> 등급 </label> <input type="text" class="form-control"
														name="employeeActive" id="employeeActive"
														value="${employeeActive}">
												</div>
												<div class="form-group">
													<label> 사번 </label> <input type="text" class="form-control"
														name="employeeNo" id="employeeNo" value="${No}">
												</div>
												<div class="form-group">
													<label> 이름 </label> <input type="text" class="form-control"
														name="employeeName" id="employeeName" value="${Name}">
												</div>

												<div class="form-group">
													<label> 주민번호 </label> <input type="text"
														class="form-control" name="employeeRegiNo"
														id="employeeRegiNo" value="${employeeRegiNo}">
												</div>

												<div class="form-group">
													<label> 나이 </label> <input type="text" class="form-control"
														name="employeeAge" id="employeeAge" value="${employeeAge}">
												</div>

												<div class="form-group">
													<label> 성별 </label> <input type="text" class="form-control"
														name="employeeGender" id="employeeGender"
														value="${employeeGender}">
												</div>

												<div class="form-group">
													<label> 핸드폰 </label> <input type="text"
														class="form-control" name="employeeTelephone"
														id="employeeTelephone" value="${employeeTelephone}">
												</div>

												<div class="form-group">
													<label> 이메일 </label> <input type="text"
														class="form-control" name="employeeEmail"
														id="employeeEmail" value="${employeeEmail}">
												</div>

												<div class="form-group">
													<label> 주소 </label> <input type="text" class="form-control"
														name="employeeAddress" id="employeeAddress"
														value="${employeeAddress}">
												</div>

												<div class="form-group">
													<label> 상세주소 </label> <input type="text"
														class="form-control" name="employeeDetailAddress"
														id="employeeDetailAddress"
														value="${employeeDetailAddress}">
												</div>
												<div class="form-group">
													<button type="button" style="float: right;"
														id="employeeAddrBtn" class="btn btn-light">주소검색</button>
												</div>

												<div id="layer"
													style="display: none; position: fixed; overflow: hidden; z-index: 1; -webkit-overflow-scrolling: touch;">
													<img
														src="//t1.daumcdn.net/postcode/resource/images/close.png"
														id="btnCloseLayer"
														style="cursor: pointer; position: absolute; right: -3px; top: -3px; z-index: 1"
														onclick="closeDaumPostcode()" alt="닫기 버튼">
												</div>

											</div>
										</div>

									</div>
									<button type="submit" class="btn btn-primary px-3 ml-4">
										정보수정완료</button>
							</form>
							<button class="btn btn-primary px-3 ml-4" type="button"
								id="backStudentOnePage" name="backStudentOnePage">
								이전화면으로</button>
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
		$('#employeeAddrBtn').click(function() {
			sample2_execDaumPostcode();
		});
	</script>
	<script>
		$('#backStudentOnePage').click(function() {
			alert('이전화면으로 돌아갑니다!');
			history.back();
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

	<script src="plugins/common/common.min.js"></script>
	<script src="js/custom.min.js"></script>
	<script src="js/settings.js"></script>
	<script src="js/gleek.js"></script>
	<script src="js/styleSwitcher.js"></script>


</body>

</html>