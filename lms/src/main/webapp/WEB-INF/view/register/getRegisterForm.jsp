<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

      <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">마이페이지</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">수강신청</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-body">
                            <div class="row">
                            	<div class="col-sm-9">
                            	
                               		<h4 class="card-title"> 수강신청 </h4>
                                </div>
                             
                            </div>
                                <br>
                                
                                
                                <div class="table-responsive"> <!--  흰 박스 안에 넣기  -->
		                              ${approveSubjectList}
		                          
		                             
		                				<!--  과목 리스트 -->	
		                				<div class="form-group">
		                					<!--  학점구분 이후 전공구분(자를 수 있다면) 이후 이름 출력 -->
			                					<label> 학점 </label>
			                						<select id="credit" name="credit" class="form-control" onchange="typeFn();">
					                					<option>==선택해주세요==</option>
					                					<option value="3">3</option>
    													<option value="4">4</option>
				              						</select>
		                					<!--  담길 폼 -->
		                				</div>
		                
		                				<div class="form-group">
		                						<label> 과목 </label>
		                							<select name="subjectName" class="form-control">
		                								<option>==선택해주세요==</option>
			                							<c:forEach var="as" items="${approveSubjectList}">
							                					<option value="${as.subjectName}"> ${as.subjectName} </option>
							                			</c:forEach>
		                							</select>
		                                </div>
		                                    
		                                    
		                                    <!--  하단 뒤로가기 -->
		                                    <div style="float:right">
		                                     	<button class="btn btn-primary" type="button" name="backPage" id="backPage"> 뒤로가기 </button>
		                                	</div>
                                	
                                </div><!--  박스 end -->
                                
                                
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


<script>
function typeFn() {
	// 학점 안누르면 작동 안한다?
	$("#credit").attr("disabled", true);
	
	var subjectCredit = $('#credit').val();
	console.log("입력된 credit :" + subjectcredit);	
	
	// 입력된 크레딧값이랑 쿼리..? 뭔 아작스 통신 걸려서 맞으면 그 값이 보여
	if($("select[name=subjectName]").val() == credit) {
		$("#subjectName").show();
		
		
		
		
		
	}
}

</script>


</body>
</html>