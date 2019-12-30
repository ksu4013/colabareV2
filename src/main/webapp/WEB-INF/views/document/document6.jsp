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
						경조비 지급을 요청하기 위하여 사용하는 양식입니다.
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
										<input type="text" id="title"  name="title" class="form-control" >
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
										<input type="hidden" id="ddocument_no" name="document_no" value="63">
										<!-- <input type="hidden" id="dcontent2" name="dcontent2" value=""> -->
										<!-- <input type="hidden" id="dcontent3" name="dcontent3" value=""> -->
										<!-- <input type="hidden" id="dcontent4" name="dcontent4" value=""> -->
										<input type="hidden" id="dcontent5" name="dcontent5" value="">
										<input type="hidden" id="dcontent6" name="dcontent6" value="">
										<input type="hidden" id="dcontent7" name="dcontent7" value="">
										<input type="hidden" id="dcontent8" name="dcontent8" value="">
										<input type="hidden" id="dcontent9" name="dcontent9" value="">
										<input type="hidden" id="dcontent10" name="dcontent10" value="">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-disabled">작성일</label>
									<div class="col-md-6">
										<!-- <input type="text" id="example-disabled" name="example-disabled" class="form-control" placeholder="Disabled" disabled=""> -->
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-select">경조 종류</label>
									<div class="col-md-6">
										<select id="dcontent2" name="dcontent2" class="form-control" size="1">
											<option value="본인 결혼">본인 결혼</option>
											<option value="부모 상">부모 상</option>
											<option value="배우자 상">배우자 상</option>
											<option value="자녀 상">자녀 상</option>
										</select>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-text-input">경조 내용</label>
									<div class="col-md-6">
										<input type="text" id="dcontent3"  name="dcontent3" class="form-control" >
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-datepicker">경조 일시</label>
									<div class="col-md-5">
										<input type="text" id="dcontent4" name="dcontent4" class="form-control">
									</div>
								</div>
								
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-textarea-input">내용</label>
									<div class="col-md-9">
										<textarea id="dcontent" name="content" rows="7" class="form-control" placeholder=""></textarea>
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
	
	  $('input[name="dcontent4"]').daterangepicker({
		    singleDatePicker: true,
		    showDropdowns: true
		  }, function(start, end, label) {
			  
		  });
		  
		  
		  $('input[name="dcontent4"]').on('apply.daterangepicker', function(ev, picker) {
		      $(this).val(picker.startDate.format('YY/MM/DD'));
		  });
		
	


	
	
	

	

	

	
});
</script>
<script>











// 참조자 검색결과 리스트
function bSearchList(data){
	
	var output = '';
		
	$.each(data, function(index, list){	
		output += "<tr>";
		output += "<td class='text-center' style='width: 100px;'>";
		output += "<img src='img/placeholders/avatars/avatar13.jpg' alt='User Image' class='img-circle'>";
		output += "</td><td>";
		output += "<a href='javascript:void(0)'>"+ list.name + "</a><br>";
		output += "</td>";
		output += "<td class='text-center' style='width: 80px;'>";
		output += "<button type='button' id='moveB' value='"+list.employee_no+"'  class='btn btn-effect-ripple btn-xs btn-primary' data-toggle='tooltip' title='참조자로 추가하기'><i class='fa fa-plus'></i></button>";
		output += "<a href='javascript:void(0)' class='btn btn-effect-ripple btn-xs btn-danger' data-toggle='tooltip' title='Follow'><i class='fa fa-share'></i></a>";
		output += "</td>";
		output += "</tr>";
		
	$("#bSearchList").fadeIn();
	$("#bSearchList").html(output);
	});

}

</script>
</body>
</html>