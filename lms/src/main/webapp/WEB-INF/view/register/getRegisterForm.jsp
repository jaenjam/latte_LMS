<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- header.jsp -->

<c:import url="/WEB-INF/template/header.jsp"></c:import>

<!-- sidebar.jsp -->

<c:import url="/WEB-INF/template/sidebar.jsp"></c:import>

<script type="text/javascript" src="/js/jquery/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/js/register/Register.js"></script>


<!-- 구분 -->

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


                            <!--  과목 리스트 -->
                            <div class="form-group">
                                <!--  학점구분 이후 전공구분(자를 수 있다면) 이후 이름 출력 -->
                                <label> 학점 </label>
                                <select id="subjectcredit" name="subjectcredit" class="form-control">
                                    <option>==선택해주세요==</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                </select>
                                <!--  담길 폼 -->
                            </div>


                            <div class="form-group">
                                <label> 과목 </label>

                                <ul id="subjectList">
                                <!--  js로 다 넣어서 ul에 뿌릴거야 -->
                                </ul>



                            </div>


                            <!-- 버튼 -->
                            <button class="btn btn-primary" type="button" name="backPage" > 담기</button>
                            <button class="btn btn-primary" type="button" name="backPage"> 삭제</button>

                            <br>
                            <br>

                            <!--  나의 바구니  -->
                            <div class="form-group">
                                <label> 나의 수강바구니 </label>
                                <br>

                            </div>


                            <!--  하단 뒤로가기 -->
                            <div style="float:right">
                                <button class="btn btn-primary" type="button" name="backPage" id="backPage"> 뒤로가기
                                </button>
                            </div>


                        </div><!-- 맨 바깥 박스 end   --> 


                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--   #/ container -->
</div>
<!--**********************************
Content body end
**********************************-->


<!--  footer -->

<c:import url="/WEB-INF/template/footer.jsp"></c:import>
