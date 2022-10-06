<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<style>
.btn-primary {
	width: 180px;
	height: 60px;
	margin-top: 23px;
	font-size: 20px
}
</style>

<!--**********************************
            Content body start
        ***********************************-->
<div class="content-body">

	<div class="container-fluid mt-3">

		<div class="row">
			<div class="col-lg-12">
				<div class="row">
					<div class="col-12">
						<div class="card">
							<div class="card-body">
			                                <h4 class="card-title">게임이론</h4>
			                                <br>
			                                <ul class="nav nav-pills mb-3">
			                                    <li class="nav-item"><a href="#navpills-1" class="nav-link active show" data-toggle="tab" aria-expanded="false">과목과제</a>
			                                    </li>
			                                    <li class="nav-item"><a href="#navpills-2" class="nav-link" data-toggle="tab" aria-expanded="false">강의</a>
			                                    </li>
			                                    <li class="nav-item"><a href="#navpills-3" class="nav-link" data-toggle="tab" aria-expanded="true">시험추가</a>
			                                    </li>
			                                    <li class="nav-item"><a href="#navpills-4" class="nav-link" data-toggle="tab" aria-expanded="true">출석체크</a>
			                                    </li>
			                                </ul>
			                                <div class="tab-content br-n pn">
			                                    <div id="navpills-1" class="tab-pane active show">
			                                        <div>
														<a href="${pageContext.request.contextPath}/lecture/getLectureList?subjectApproveNo=${MyRegister.subjectApproveNo}">
															<h4 class="mb-1">과목 과제</h4>
														</a>
														<p>${myRegisterListStu}</p>
														<h3 class="m-0">$ 12,555</h3>
														<div>${MyRegister}</div>
			                                        </div>
			                                    </div>
			                                    <div id="navpills-2" class="tab-pane">
													<div>
														<h4 class="mb-0">${MyRegister.subjectName}</h4>
														<p>교수: ${MyRegister.professorName} / 강의실:
															${MyRegister.subjectRoom} / 학점: ${MyRegister.subjectCredit} /
															요일: ${MyRegister.day}</p>
													</div>
			                                    </div>
			                                    <div id="navpills-3" class="tab-pane">
			                                        <div>
														<form action="${pageContext.request.contextPath}/test/addTestForm">
															<button type="submit" class="btn btn-primary">시험추가</button>
														</form>
			                                        </div>
			                                    </div>
			                                    <div id="navpills-4" class="tab-pane">
			                                        <div>
			                                        	<div class="table-responsive">
						                                    <table class="table table-bordered">
						                                        <thead>
						                                            <tr>
						                                                <th>#</th>
						                                                <th>Name</th>
						                                                <th>Status</th>
						                                                <th>Date</th>
						                                                <th>Price</th>
						                                            </tr>
						                                        </thead>
						                                        <tbody>
						                                            <tr>
						                                                <th>1</th>
						                                                <td>Kolor Tea Shirt For Man</td>
						                                                <td><span class="badge badge-primary px-2">Sale</span>
						                                                </td>
						                                                <td>January 22</td>
						                                                <td class="color-primary">$21.56</td>
						                                            </tr>
						                                        </tbody>
						                                    </table>
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

	<!-- #/ container -->
</div>
<!--**********************************
            Content body end
        ***********************************-->
<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>