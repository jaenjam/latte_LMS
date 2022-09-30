<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>


<style>
	.btn {
		float:right;
		line-height: 18px;
	}
</style>


        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">QnA</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">질문추가</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-validation">
                                    <form class="form-valide" action="${pageContext.request.contextPath}/addQuestion" method="post">
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="studentNo">작성자<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-8">
                                            	<input type="hidden" class="form-control" id="studentNo" name="studentNo" value="${No}">
                                                <input type="text" class="form-control" id="studentName" name="studentName" value="${Name}" readonly="readonly">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="questionTitle">질문제목<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-8">
                                                <input type="text" class="form-control" id="questionTitle" name="questionTitle" placeholder="질문제목을 입력해주세요">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="questionContent">질문내용<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-8">
                                                <textarea class="form-control" id="questionContent" name="questionContent" rows="5" placeholder="질문내용을 입력해주세요"></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="questionActive">공개여부설정<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-8">
                                                
		                                                	<select class="custom-select" id="questionActive" name="questionActive">
		                                                		<option value="전체공개" selected>전체공개</option>
		                                                		<option value="비공개">비공개</option>
		                                                	</select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <div class="col-lg-8 ml-auto">
                                                <button type="submit" class="btn btn-primary">추가</button>
                                            </div>
                                        </div>
                                    </form>
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