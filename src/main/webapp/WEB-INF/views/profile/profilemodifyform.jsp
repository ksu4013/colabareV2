<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<%@ include file = "../common/header.jsp" %>
<script type="text/javascript" src="/resources/js/pages/profilemodify.js">
</script>
<title>Insert title here</title>

</head>
<body>
	<!-- Page content -->
                    <div id="page-content">
                        <!-- Validation Header -->
                        <div class="content-header">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="header-section">
                                        <h1>프로필 수정</h1>
                                    </div>
                                </div>
                                <div class="col-sm-6 hidden-xs">
                                    <div class="header-section">
                                        <ul class="breadcrumb breadcrumb-top">
                                            <li>프로필</li>
                                            <li>프로필 수정</li>
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
                                        <h2>Profile Modify Form</h2>
                                    </div>
                                    <!-- END Form Validation Title -->

                                    <!-- Form Validation Form -->
                                    
                                    <form id="greetingform" method="post" class="form-horizontal form-bordered">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="val-username">인사말 <span class="text-danger">*</span></label>
                                            <div class="col-md-6">
                                                <textarea rows=12 cols=63 name="employee_greeting" id="employee_greeting" class="form-control" value="${profile.employee_greeting }"></textarea>
                                            </div>
                                        </div>

                                        <div class="form-group form-actions">
                                            <div class="col-md-8 col-md-offset-3">
                                               <input type="button" value="인사말 수정" id="greetingbtn" class="btn btn-primary">
                                                <!-- <button type="reset" class="btn btn-effect-ripple btn-danger">Reset</button> -->
                                            </div>
                                        </div>
                                    </form>
                                    <hr><br>
                                    <form id="passform" method="post" class="form-horizontal form-bordered">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="val-username">비밀번호<span class="text-danger">*</span></label>
                                            <div class="col-md-6">
                                                <input type="password" name="password" id="password" class="form-control">
                                            </div>
                                        </div>
                                        <div class="form-group form-actions">
                                            <div class="col-md-8 col-md-offset-3">
                                               <input type="button" value="비밀번호 변경" id="passbtn" class="btn btn-primary">
                                                <!-- <button type="reset" class="btn btn-effect-ripple btn-danger">Reset</button> -->
                                            </div>
                                        </div>
                                    </form>
                                    <hr><br>
                                    <form id="modifyform" method="post" class="form-horizontal form-bordered">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="val-username">관리자에게 수정요청 보내기 <span class="text-danger">*</span></label>
                                            <div class="col-md-6">
                                                <textarea rows=12 cols=63 name="modify_info" id="modify_info" class="form-control" value="${profile.employee_greeting }"></textarea>
                                            </div>
                                        </div>

                                        <div class="form-group form-actions">
                                            <div class="col-md-8 col-md-offset-3">
                                               <input type="button" value="보내기" id="modifybtn" class="btn btn-primary">
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