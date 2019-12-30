<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file = "../common/header.jsp" %>

<script type="text/javascript" src="../resources/js/moment.min.js"></script>
<script type="text/javascript" src="../resources/js/daterangepicker.js"></script>
<link rel="stylesheet" href="../resources/css/daterangepicker.css">



<!--  -->
	<div id="page-content" class="inner-sidebar-right">
		<div id="page-content-sidebar">
			<a href="javascript:void(0)" class="btn btn-block btn-effect-ripple btn-primary visible-xs" data-toggle="collapse" data-target="#people-nav">People</a>
			<div id="people-nav" class="collapse navbar-collapse remove-padding">
				<div class="block-section">
					<h4 class="inner-sidebar-header"> 
					결재자
					</h4>
					<ul class="nav-users nav-users-online" id = "aList">
						
					</ul>
				</div>
			<div class="block-section">
				<h4 class="inner-sidebar-header">
				참조자
				</h4>
				<ul class="nav-users nav-users-away" id = "bList">
				
				</ul>
			</div>
				<div class="block-section">
					<h4 class="inner-sidebar-header">
						<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-default pull-right"><i class="fa fa-cog"></i></a>
					Offline
					</h4>
					<ul class="nav-users nav-users-offline">
						
					</ul>
				</div>
			</div>
		</div>
	
	
		<div class="row">
			<div class="col-lg-7">
			
				<div class="widget">
					<div class="widget-content widget-content-mini themed-background-dark text-light-op">
						<span class="pull-right text-muted"></span>
						채용계획서는 채용을 위한 사항을 계획하는 문서입니다.
					</div>
					<div class="widget-content"><!-- 결재내용 시작  -->
						<div class="block">
							<div class="block-title">
								<h2>General Elements</h2>
							</div>
							
							<form id="documentSub" method="post"  class="form-horizontal form-bordered" >
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-text-input">기안제목</label>
									<div class="col-md-6">
										<input type="text" id="title"  name="title" class="form-control" placeholder="채용계획서">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label">부서명</label>
									<div class="col-md-9">
										<p class="form-control-static">${meminfo.department_name }</p>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label">작성자명</label>
									<div class="col-md-9">
										<p class="form-control-static">${employee.name }</p>
										<input type="hidden" id="demployee_no" name="employee_no" value="${employee.employee_no }">
										<input type="hidden" id="ddepartment_id" name="department_id" value="${employee.department_id }">
										<input type="hidden" id="ddocument_no" name="document_no" value="81">
										<!-- <input type="hidden" id="dcontent2" name="dcontent2" value=""> -->
										<!-- <input type="hidden" id="dcontent3" name="dcontent3" value=""> -->
										<!-- <input type="hidden" id="dcontent4" name="dcontent4" value=""> -->
										<!-- <input type="hidden" id="dcontent5" name="dcontent5" value=""> -->
										<!-- <input type="hidden" id="dcontent6" name="dcontent6" value=""> -->
										<!-- <input type="hidden" id="dcontent7" name="dcontent7" value=""> -->
										<!-- <input type="hidden" id="dcontent8" name="dcontent8" value=""> -->
										<!-- <input type="hidden" id="dcontent9" name="dcontent9" value=""> -->
										<!-- <input type="hidden" id="dcontent10" name="dcontent10" value=""> -->
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-disabled">작성일</label>
									<div class="col-md-6">
										<!-- <input type="text" id="example-disabled" name="example-disabled" class="form-control" placeholder="Disabled" disabled=""> -->
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-text-input">채용 목적</label>
									<div class="col-md-6">
										<input type="text" id="dcontent2"  name="dcontent2" class="form-control" >
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-text-input">채용 인원 수</label>
									<div class="col-md-6">
										<input type="text" id="dcontent3"  name="dcontent3" class="form-control" >
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-textarea-input">담당 업무</label>
									<div class="col-md-9">
										<textarea id="dcontent" name="content" rows="7" class="form-control" ></textarea>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-select">고용 형태</label>
									<div class="col-md-6">
										<select id="dcontent4" name="dcontent4" class="form-control" size="1">
											<option value="정규직">정규직</option>
											<option value="계약직">계약직</option>
											<option value="계약직">계약직</option>
											<option value="임시직">임시직</option>
											<option value="인턴">인턴</option>
											<option value="병역특례">병역특례</option>
											<option value="교육생">교육생</option>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-text-input">근무 지역</label>
									<div class="col-md-6">
										<input type="text" id="dcontent5"  name="dcontent5" class="form-control" >
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-datepicker">모집 시작일</label>
									<div class="col-md-5">
										<input type="text" id="dcontent6" name="dcontent6" class="form-control">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-datepicker">모집 마감일</label>
									<div class="col-md-5">
										<input type="text" id="dcontent7" name="dcontent7" class="form-control">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-textarea-input">모집 요강</label>
									<div class="col-md-9">
										<textarea id="dcontent8" name="content8" rows="7" class="form-control" ></textarea>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-text-input">급여 조건</label>
									<div class="col-md-6">
										<input type="text" id="dcontent9"  name="dcontent9" class="form-control" >
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-select">학력 조건</label>
									<div class="col-md-6">
										<select id="dcontent10" name="dcontent10" class="form-control" size="1">
											<option value="학력 무관">학력 무관</option>
											<option value="고등학교 졸업">고등학교 졸업</option>
											<option value="전문대학교 졸업">전문대학교 졸업</option>
											<option value="대학교 졸업">대학교 졸업</option>
											<option value="대학원 졸업">대학원 졸업</option>
										</select>
									</div>
								</div>
								
								<div class="form-group form-actions">
									<div class="col-md-9 col-md-offset-3">
										<button id = "documentSav" type="button" class="btn btn-effect-ripple btn-primary">완료</button>
										<button type="reset" class="btn btn-effect-ripple btn-danger">취소</button>
									</div>
								</div>
							</form>
						</div>
						
					</div><!-- 결재 내용 끝  -->
					
				</div>
			
			</div>
			<div class="col-lg-5">
			
				<div class="widget">
					<div class="widget-content widget-content-mini border-bottom">
					<span class="pull-right text-muted">5 People</span>
					결재자 검색
					</div>
					
					<!-- search button  -->
					<div class="col-md-9">
						<div class="input-group">
							<input type="text" id="aSearch" name="aSearch" class="form-control" placeholder="결재자 검색">
							<span class="input-group-btn">
								<button type="button" class="btn btn-effect-ripple btn-primary" style="overflow: hidden; position: relative;"><span class="btn-ripple animate" style="height: 84px; width: 84px; top: -23px; left: -1.625px;"></span><i class="fa fa-search"></i> Search</button>
							</span>
								
						</div>
					</div>
					<!--search botton 끝  -->
				
					<div class="widget-content widget-content-full">
						<table class="table table-borderless table-striped table-vcenter">
							<tbody id = "aSearchList">
								
							</tbody>
						</table>
					</div>
				</div>
				
				<!-- 참조자  -->
				<div class="widget">
					<div class="widget-content widget-content-mini border-bottom">
					<span class="pull-right text-muted">5 People</span>
					참조자 검색
					</div>
					
					<!-- search button  -->
					<div class="col-md-9">
						<div class="input-group">
							<input type="text" id="bSearch" name="bSearch" class="form-control" placeholder="참조자 검색">
							<span class="input-group-btn">
								<button type="button" class="btn btn-effect-ripple btn-primary" style="overflow: hidden; position: relative;"><span class="btn-ripple animate" style="height: 84px; width: 84px; top: -23px; left: -1.625px;"></span><i class="fa fa-search"></i> Search</button>
							</span>
						</div>
					</div>
					<!--search botton 끝  -->
				
					<div class="widget-content widget-content-full">
						<table class="table table-borderless table-striped table-vcenter">
							<tbody id = "bSearchList">
								
							</tbody>
						</table>
					</div>
				</div>
			
			
			</div>
		</div>
	</div>

<script type="text/javascript" src="../resources/js/DocumentCommon.js"></script>
<script type="text/javascript" src="../resources/js/DCList.js"></script>
<script>
$(document).ready(function(e){
	
	
	
	  $('input[name="dcontent6"]').daterangepicker({
		    singleDatePicker: true,
		    showDropdowns: true
		  }, function(start, end, label) {
			  
		  });
		  
		  
		  $('input[name="dcontent6"]').on('apply.daterangepicker', function(ev, picker) {
		      $(this).val(picker.startDate.format('YY/MM/DD'));
		  });	

		  $('input[name="dcontent7"]').daterangepicker({
			    singleDatePicker: true,
			    showDropdowns: true
			  }, function(start, end, label) {
				  
			  });
			  
			  
			  $('input[name="dcontent7"]').on('apply.daterangepicker', function(ev, picker) {
			      $(this).val(picker.startDate.format('YY/MM/DD'));
			  });

	
	
	

	

	

	
});
</script>

</body>
</html>