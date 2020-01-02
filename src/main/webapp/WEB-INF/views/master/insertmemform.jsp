<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Member Form</title>

<%@ include file = "../common/header.jsp" %>
<script type="text/javascript" src="/resources/js/pages/insertmem.js"></script>

</head>
<body>
 <!-- Page content -->
                    <div id="page-content">
                        <!-- Validation Header -->
                        <div class="content-header">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="header-section">
                                        <h1>사원 추가</h1>
                                    </div>
                                </div>
                                <div class="col-sm-6 hidden-xs">
                                    <div class="header-section">
                                        <ul class="breadcrumb breadcrumb-top">
                                            
                                            <li>Master</li>
                                            <li>Insert Member</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END Validation Header -->

                        <!-- Form Validation Content -->
                        <div class="row">
                            <div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3">
                                <!-- Form Validation Block -->
                                <div class="block">
                                    <!-- Form Validation Title -->
                                    <div class="block-title">
                                        <h2>Insert Member Form</h2>
                                    </div>
                                    <!-- END Form Validation Title -->

                                    <!-- Form Validation Form -->
                                    <form id="insertmemform" method="post" class="form-horizontal form-bordered">
                                    <div class="form-group">
                                            <label class="col-md-3 control-label" for="val-username">아이디 <span class="text-danger">*</span></label>
                                            <div class="col-md-6">
                                                <input type="text" name="userid" id="userid" class="form-control" placeholder="아이디를 입력해주세요">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="val-username">비밀번호 <span class="text-danger">*</span></label>
                                            <div class="col-md-6">
                                                <input type="password" name="userpw" id="userpw" class="form-control" placeholder="비밀번호를 입력해주세요">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="val-username">사원번호 <span class="text-danger">*</span></label>
                                            <div class="col-md-6">
                                                <input type="text" name="employee_no" id="employee_no" class="form-control" placeholder="사원번호를 입력해주세요">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="val-username">이름 <span class="text-danger">*</span></label>
                                            <div class="col-md-6">
                                                <input type="text" name="name" id="name" class="form-control" placeholder="사원 이름을 입력해주세요">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="val-email">Email <span class="text-danger">*</span></label>
                                            <div class="col-md-6">
                                                <input type="text" id="e_mail" name="e_mail" class="form-control" placeholder="Enter your valid email..">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="val-skill">부서명 <span class="text-danger">*</span></label>
                                            <div class="col-md-6">
                                                <select name="department_id" id="department_id"class="form-control">
													<c:forEach var="department" items="${departments }">
    													<option value=${department.department_id }>${department.department_name }</option>
    												</c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="val-skill">직급명 <span class="text-danger">*</span></label>
                                            <div class="col-md-6">
                                                <select name="position_id" id="position_id" class="form-control">
                                                    <c:forEach var="position" items="${positions }">
    													<option value=${position.position_id }>${position.position_name }</option>
    												</c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                            <label class="col-md-3 control-label" for="val-skill">관리자여부 <span class="text-danger">*</span></label>
                                            <div class="col-md-6">
                                                <select name="master" id="master" class="form-control">
                                                    <option value="y"> 관리자 </option>
    												<option value="n"> 관리자아님 </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group form-actions">
                                            <div class="col-md-8 col-md-offset-3">
                                               <input type="button" class="pull-right btn btn-primary" value="회원 추가" id="insertmembtn">
                                                <!-- <button type="reset" class="btn btn-effect-ripple btn-danger">Reset</button> -->
                                            </div>
                                        </div>
                                    </form>
                                    <!-- END Form Validation Form -->

                                    <!-- Terms Modal -->
                                    <div id="modal-terms" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h3 class="modal-title text-center"><strong>Terms and Conditions</strong></h3>
                                                </div>
                                                <div class="modal-body">
                                                    <h4 class="page-header">1. <strong>General</strong></h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultrices, justo vel imperdiet gravida, urna ligula hendrerit nibh, ac cursus nibh sapien in purus. Mauris tincidunt tincidunt turpis in porta. Integer fermentum tincidunt auctor.</p>
                                                    <h4 class="page-header">2. <strong>Account</strong></h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultrices, justo vel imperdiet gravida, urna ligula hendrerit nibh, ac cursus nibh sapien in purus. Mauris tincidunt tincidunt turpis in porta. Integer fermentum tincidunt auctor.</p>
                                                    <h4 class="page-header">3. <strong>Service</strong></h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultrices, justo vel imperdiet gravida, urna ligula hendrerit nibh, ac cursus nibh sapien in purus. Mauris tincidunt tincidunt turpis in porta. Integer fermentum tincidunt auctor.</p>
                                                    <h4 class="page-header">4. <strong>Payments</strong></h4>
                                                    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultrices, justo vel imperdiet gravida, urna ligula hendrerit nibh, ac cursus nibh sapien in purus. Mauris tincidunt tincidunt turpis in porta. Integer fermentum tincidunt auctor.</p>
                                                </div>
                                                <div class="modal-footer">
                                                    <div class="text-center">
                                                        <button type="button" class="btn btn-effect-ripple btn-primary" data-dismiss="modal">I've read them!</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- END Terms Modal -->
                                </div>
                                <!-- END Form Validation Block -->
                            </div>
                        </div>
                        <!-- END Form Validation Content -->
                    </div>
                    <!-- END Page Content -->


	
	
		
</body>
</html>