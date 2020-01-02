<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="page-content" class="inner-sidebar-right">
	<div id="page-content-sidebar">
		<a href="javascript:void(0)"
			class="btn btn-block btn-effect-ripple btn-primary visible-xs"
			data-toggle="collapse" data-target="#people-nav">People</a>
		<div id="people-nav" class="collapse navbar-collapse remove-padding">
			<div class="block-section">
				<h4 class="inner-sidebar-header">전자결재 목록</h4>

			</div>


		</div>
	</div>


	<div class="row">
		<div class="col-lg-5">

			<div class="widget">
				<div
					class="widget-content widget-content-mini themed-background-dark text-light-op">
					<span class="pull-right text-muted"></span> PROFILE
				</div>
				<div class="widget-content">
					<!-- 결재내용 시작  -->
					<a href="/profile/profile" class="widget">

						<div class="widget">
							<div class="widget-image widget-image-sm">
								<img src="/resources/img/placeholders/photos/photo1@2x.jpg"
									alt="image">

								<div class="widget-image-content text-center">
									<div id="profileimg">
										<c:if test="${profilepic ==null}">
											<img
												src="/resources/img/placeholders/avatars/avatar13@2x.jpg"
												alt="avatar"
												class="img-circle img-thumbnail img-thumbnail-transparent img-thumbnail-avatar-2x push">
										</c:if>
										<c:if test="${profilepic !=null}">
											<img src='/profile/displayprofile?fileName=${profilepic}'
												alt="avatar"
												class="img-circle img-thumbnail img-thumbnail-transparent img-thumbnail-avatar-2x push">
										</c:if>
										<!-- 
                                            	
                                            	<img src="/resources/img/placeholders/avatars/avatar13@2x.jpg" alt="avatar" class="img-circle img-thumbnail img-thumbnail-transparent img-thumbnail-avatar-2x push">
                                             -->
									</div>
									<h2 class="widget-heading text-light">
										<strong> ${profile.employee_no }</strong>
									</h2>
									<h4 class="widget-heading text-light-op">
										<em> ${sessionScope.meminfo.name }</em>
									</h4>

								</div>
							</div>
							<div class="widget-content widget-content-full border-bottom">
								<div class="row text-center">
									<div class="col-xs-6 push-inner-top-bottom border-right">
										<h3 class="widget-heading">
											<i class="gi gi-heart text-danger push"></i> <br> <small><strong>${sessionScope.meminfo.department_name }</strong>
											</small>
										</h3>
									</div>
									<div class="col-xs-6 push-inner-top-bottom">
										<h3 class="widget-heading">
											<i class="gi gi-group themed-color-social push"></i> <br>
											<small><strong>${sessionScope.meminfo.position_name }</strong></small>
										</h3>
									</div>
								</div>
							</div>
							<div class="widget-content border-bottom">
								<h4>인사말</h4>
								<p>${profile.employee_greeting }</p>
							</div>

						</div>
					</a>
				</div>
				<!-- 결재 내용 끝  -->
			</div>
		</div>


		<div class="col-lg-7">
			<div class="widget">
				<div
					class="widget-content widget-content-mini border-bottom themed-background-dark text-light-op">
					<span class="pull-right text-muted">5 People</span> 공지사항 자리
				</div>
				<h1>하</h1>
				<h1>하</h1>
				<h1>하</h1>
				<h1>하</h1>
				<div class="widget-content widget-content-full"></div>
			</div>

			
         <!-- 참조자  -->
         <div class="widget">
            <div
               class="widget-content widget-content-mini border-bottom themed-background-dark text-light-op">
               <span class="pull-right text-muted">5 People</span> 유진이의 To Do
            </div>

            <div class="widget-content widget-content-full">
               <c:forEach var="todotype" items="${typelist }">
               <h1><i class="fa fa-book fa-fw icon-push"></i> <strong><a href="todolist?todo_type_no=${todotype.todo_type_no }">${todotype.todo_type_title }</strong></h1>
               </c:forEach>
            </div>
         </div>


      </div>
   </div>
</div>


</body>

</html>