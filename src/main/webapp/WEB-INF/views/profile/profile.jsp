<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.uploadResult {
  width:100%;
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color: black;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
}

</style>
</head>
<body>
<%@ include file = "../common/header.jsp" %>


<!-- 
<script type="text/javascript" src="/resources/js/pages/profilepicupdate.js"></script> -->
<!-- Page content -->
                    <div id="page-content">
                        <!-- User Profile Row -->
                        <div class="row">
                            <div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3">
                                <div class="widget">
                                    <div class="widget-image widget-image-sm">
                                        <img src="/resources/img/placeholders/photos/photo1@2x.jpg" alt="image">
                                    
                                        <div class="widget-image-content text-center">
                                        	<div id="profileimg">
                                        	<c:if test="${profilepic ==null}"><img src="/resources/img/placeholders/avatars/avatar13@2x.jpg" alt="avatar" class="img-circle img-thumbnail img-thumbnail-transparent img-thumbnail-avatar-2x push">
                                            </c:if>
                                            <c:if test="${profilepic !=null}"><img src='/profile/displayprofile?fileName=${profilepic}' alt="avatar" class="img-circle img-thumbnail img-thumbnail-transparent img-thumbnail-avatar-2x push">
                                            	</c:if>
                                        		<!-- 
                                            	
                                            	<img src="/resources/img/placeholders/avatars/avatar13@2x.jpg" alt="avatar" class="img-circle img-thumbnail img-thumbnail-transparent img-thumbnail-avatar-2x push">
                                             --></div>
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
                                         <div class="widget-content push-ineer-top-bottom">
                                      <div class="pull-left">
                                            <a href="/mail/mailform?to=${sessionScope.employee.e_mail }" class="btn btn-default" data-toggle="tooltip" title="E-mail"><i class="fa fa-envelope"></i></a>
                                            </div>
                                            <div class="pull-right">
                                        	 <form action="/profile/uploadprofilepic" method="post" enctype="multipart/form-data" class="form-inline">
                                        	 <div class="form-group">
												<input type='file' class="btn-block" name='uploadFile' class="btn btn-default">
												</div><div class="form-group">
												<button id='uploadBtn' class="btn btn-primary" name='uploadBtn'>수정</button>
											</div>	
											</form>
											</div>
											<div id="uploadResult" class="pull-right"></div>
                                        	 <a href="/profile/profilemodifyform.do" class="btn btn-primary">회원 정보 수정</a>
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