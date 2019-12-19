<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file = "../common/header.jsp" %>
<script type="text/javascript" src="/resources/js/pages/modmemform.js"></script>
</head>
<body>
<!-- Page content -->
                    <div id="page-content">
                        <!-- Validation Header -->
                        <div class="content-header">
                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="header-section">
                                        <h1>Form Validation</h1>
                                    </div>
                                </div>
                                <div class="col-sm-6 hidden-xs">
                                    <div class="header-section">
                                        <ul class="breadcrumb breadcrumb-top">
                                            <li>User Interface</li>
                                            <li>Forms</li>
                                            <li><a href="">Validation</a></li>
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
                                        <h2>사원 수정</h2>
                                    </div>
                                    <!-- END Form Validation Title -->

                                    <!-- Form Validation Form -->
                                    <form id="modifymemform" method="post" class="form-horizontal form-bordered">
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="val-username"><strong>사원번호:${employee.employee_no }</strong><span class="text-danger">*</span></label>
                                            <input type="hidden" id="employee_id" value="${employee.employee_no }"> 
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="val-username">이름 <span class="text-danger">*</span></label>
                                            <div class="col-md-6">
                                                <input type="text" name="name" id="name" class="form-control" value="${employee.name }">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-3 control-label" for="val-skill">부서명 <span class="text-danger">*</span></label>
                                            <div class="col-md-6">
                                                <select name="department_id" id="department_id"class="form-control">
													<c:forEach var="department" items="${departments }">
														<c:if test="${department.department_id eq employee.department_id }">
															<option value="${department.department_id }" selected disabled hidden>${department.department_name }</option>
														</c:if>	
													</c:forEach>
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
														<c:if test="${position.position_id eq employee.position_id }">
															<option value="${position.position_id }" selected disabled hidden>${position.position_name }</option>
														</c:if>	
													</c:forEach>
                                                    <c:forEach var="position" items="${positions }">
    													<option value=${position.position_id }>${position.position_name }</option>
    												</c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                         <div class="form-group">
                                            <label class="col-md-3 control-label" for="val-skill">관리자여부 <span class="text-danger">*</span></label>
                                            <div class="col-md-6">
                                            	<c:if test="${employee.master eq 'n' }">
													<option value="n" selected disabled hidden>관리자아님</option>
												</c:if>
                                                <select name="master" id="master" class="form-control">
                                                    <option value="y"> 관리자 </option>
    												<option value="n"> 관리자아님 </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                        <label class="col-md-3 control-label" for="val-skill">권한 설정 <span class="text-danger">*</span></label>
                                            <div class="col-md-6">
                                            	공지사항
                                        		<c:choose> 
													<c:when test="${security.notice_cud eq 'y'}">
														<input type="checkbox" id="auth" checked="checked" value="notice" >
													</c:when>
													<c:otherwise>
														<input type="checkbox" id="auth"  value="notice" >
													</c:otherwise>
												</c:choose> &nbsp; &nbsp; &nbsp; 
												회의록
												<c:choose>
													<c:when test="${security.meeting_cud eq 'y'}">
														<input type="checkbox" id="auth" checked="checked" value="meeting" >
													</c:when>
													<c:otherwise>
														<input type="checkbox" id="auth" value="meeting" >
													</c:otherwise>
												</c:choose> &nbsp; &nbsp; &nbsp; 
												자료실
												<c:choose>
													<c:when test="${security.reference_cud eq 'y'}">
														<input type="checkbox" id="auth" checked="checked" value="reference" >
													</c:when>
													<c:otherwise>
														<input type="checkbox" id="auth" value="reference" >
													</c:otherwise>
												</c:choose> &nbsp; &nbsp; &nbsp; 
												프로젝트방 생성
												<c:choose>
													<c:when test="${security.project_c eq 'y'}">
														<input type="checkbox" id="auth" checked="checked" value="project" >
													</c:when>
													<c:otherwise>
														<input type="checkbox" id="auth" value="project" >
													</c:otherwise>
												</c:choose>
											</div>
                                        </div>		
                                        <div class="form-group form-actions">
                                            <div class="col-md-8 col-md-offset-3">
                                               <input type="button" value="회원  수정" id="modifymembtn">
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

	<form id="empmodifyform" method="post">
	<h4>사원번호 : ${employee.employee_no }</h4>
	<h4>사원이름 : ${employee.name }</h4>
	<input type="hidden" id="employee_id" value="${employee.employee_no }">
	이름 : <input type="text" name="name" id="name" value="${employee.name }">
	부서명 : <select name="department_id" id="department_id">
	<c:forEach var="department" items="${departments }">
		<c:if test="${department.department_id eq employee.department_id }">
			<option value="${department.department_id }" selected disabled hidden>${department.department_name }</option>
		</c:if>	
	</c:forEach>
				 
	<c:forEach var="department" items="${departments }">
    	<option value=${department.department_id }>${department.department_name }</option>
    </c:forEach>
  	</select><br><br>
		직급명 : <select name="position_id" id="position_id" >
	<c:forEach var="position" items="${positions }">
		<c:if test="${position.position_id eq employee.position_id }">
			<option value="${position.position_id }" selected disabled hidden>${position.position_name }</option>
		</c:if>	
	</c:forEach>
					<c:forEach var="position" items="${positions }">
    					<option value=${position.position_id }>${position.position_name }</option>
    				</c:forEach>
  				</select> &nbsp; &nbsp; &nbsp; 
		관리자 여부 :<select name="master" id="master" >
		<c:if test="${employee.master eq 'n' }">
			<option value="n" selected disabled hidden>관리자아님</option>
		</c:if>	
    				<option value="y"> 관리자 </option>
    				<option value="n"> 관리자아님 </option>                
    			</select> <br><br>
	권한 설정 : 공지사항<c:choose>
		<c:when test="${security.notice_cud eq 'y'}">
			<input type="checkbox" id="auth" checked="checked" value="notice" >
		</c:when>
		<c:otherwise>
			<input type="checkbox" id="auth"  value="notice" >
		</c:otherwise>
		</c:choose> &nbsp; &nbsp; &nbsp; 
		회의록
		<c:choose>
		<c:when test="${security.meeting_cud eq 'y'}">
			<input type="checkbox" id="auth" checked="checked" value="meeting" >
		</c:when>
		<c:otherwise>
			<input type="checkbox" id="auth" value="meeting" >
		</c:otherwise>
		</c:choose> &nbsp; &nbsp; &nbsp; 
		자료실
		<c:choose>
		<c:when test="${security.reference_cud eq 'y'}">
			<input type="checkbox" id="auth" checked="checked" value="reference" >
		</c:when>
		<c:otherwise>
			<input type="checkbox" id="auth" value="reference" >
		</c:otherwise>
		</c:choose> &nbsp; &nbsp; &nbsp; 
		프로젝트방 생성
		<c:choose>
		<c:when test="${security.project_c eq 'y'}">
			회의록<input type="checkbox" id="auth" checked="checked" value="project" >
		</c:when>
		<c:otherwise>
			회의록<input type="checkbox" id="auth" value="project" >
		</c:otherwise>
		</c:choose>
		
	<br><br>
	<input type="button" value="회원 수정" id="modifymembtn"></form>
	<br><br><br><br><br>
	
	<button onclick="location.href='/colabare/master/listPage.do'">이전으로</button>

</body>
</html>