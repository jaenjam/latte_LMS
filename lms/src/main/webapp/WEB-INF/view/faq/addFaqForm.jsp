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
                        <li class="breadcrumb-item"><a href="javascript:void(0)">(FAQ)자주묻는질문</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">FAQ 추가</a></li>
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
                                    <form class="form-valide" action="${pageContext.request.contextPath}/addFaq" method="post">
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="faqTitle">자주묻는질문<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-8">
                                                <input type="text" class="form-control" id="faqTitle" name="faqTitle" placeholder="자주묻는질문을 입력해주세요">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="faqContent">자주묻는질문답변<span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-8">
                                                <textarea class="form-control" id="faqContent" name="faqContent" rows="5" placeholder="자주묻는질문답변을 입력해주세요"></textarea>
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