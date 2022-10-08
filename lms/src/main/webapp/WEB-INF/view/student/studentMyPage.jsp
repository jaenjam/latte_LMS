<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			                                <h4 class="card-title">나의정보</h4>
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
			                                    
			                                    </div>
			                                    <div id="navpills-2" class="tab-pane">
			                                    
			                                    </div>
			                                    <div id="navpills-3" class="tab-pane">
			                                    
			                                    </div>
			                                    <div id="navpills-4" class="tab-pane">
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
</div>
<!--**********************************
            Content body end
        ***********************************-->
<!-- footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>