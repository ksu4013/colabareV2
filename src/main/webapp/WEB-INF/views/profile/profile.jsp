<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../common/header.jsp" %>

<!-- Page content -->
                    <div id="page-content">
                        <!-- User Profile Row -->
                        <div class="row">
                            <div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3">
                                <div class="widget">
                                    <div class="widget-image widget-image-sm">
                                        <img src="/resources/img/placeholders/photos/photo1@2x.jpg" alt="image">
                                        <div class="widget-image-content text-center">
                                            <img src="/resources/img/placeholders/avatars/avatar13@2x.jpg" alt="avatar" class="img-circle img-thumbnail img-thumbnail-transparent img-thumbnail-avatar-2x push">
                                            <h2 class="widget-heading text-light"><strong> ${profile.employee_no }</strong></h2>
                                            <h4 class="widget-heading text-light-op"><em> ${sessionScope.meminfo.name }</em></h4>
                                        </div>
                                    </div>
                                    <div class="widget-content widget-content-full border-bottom">
                                        <div class="row text-center">
                                            <div class="col-xs-6 push-inner-top-bottom border-right">
                                                <h3 class="widget-heading"><i class="gi gi-heart text-danger push"></i> <br><small><strong>${sessionScope.meminfo.department_name }</strong> </small></h3>
                                            </div>
                                            <div class="col-xs-6 push-inner-top-bottom">
                                                <h3 class="widget-heading"><i class="gi gi-group themed-color-social push"></i> <br><small><strong>${sessionScope.meminfo.position_name }</strong></small></h3>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="widget-content border-bottom">
                                        <h4>인사말</h4>
                                        <p>${profile.employee_greeting }</p>
                                    </div>
                                    <div class="widget-content">
                                        <h4>Social</h4>
                                        <div class="btn-group">
                                            <a href="/mail/mailform.do" class="btn btn-default" data-toggle="tooltip" title="E-mail"><i class="fa fa-message fa-fw"></i></a>
                                            <a href="javascript:void(0)" class="btn btn-default" data-toggle="tooltip" title="Twitter"><i class="fa fa-twitter fa-fw"></i></a>
                                            <a href="javascript:void(0)" class="btn btn-default" data-toggle="tooltip" title="Google Plus"><i class="fa fa-google-plus fa-fw"></i></a>
                                            <a href="javascript:void(0)" class="btn btn-default" data-toggle="tooltip" title="Pinterest"><i class="fa fa-pinterest fa-fw"></i></a>
                                            <a href="javascript:void(0)" class="btn btn-default" data-toggle="tooltip" title="Dribbble"><i class="fa fa-dribbble fa-fw"></i></a>
                                        	 <a href="/profile/profilemodifyform.do" class="btn btn-default"><button>수정하기</button></a>
                                        </div>
                                       
                                    </div>
                                </div>
                            </div>
                            

                        </div>
                        <!-- END User Profile Row -->
                    </div>
                    <!-- END Page Content -->
    
	
</body>
</html>