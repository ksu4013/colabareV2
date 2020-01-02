<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file = "../common/header.jsp" %>





<!--  -->
	<div id="page-content" class="inner-sidebar-right">
	
		<div id="page-content-sidebar">
			<div class="form-group form-actions">
				<div class="col-md-9 col-md-offset-3">
					<button id="passDoc"   type="button" class="btn btn-effect-ripple btn-primary">결재</button>
					<button id="rejectDoc" type="button" class="btn btn-effect-ripple btn-danger">반려</button>
				</div>
			</div>
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
				
			</div>
		</div>
	
	
		<div class="row">
			<div class="col-lg-7">
			
				<div class="widget">
					<div class="widget-content widget-content-mini themed-background-dark text-light-op">
						<span class="pull-right text-muted"></span>
						일반적인 기안서를 작성하기 위하여 사용하는 양식입니다.
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
										<p class="form-control">${detailReceive.title }</p>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label">부서명</label>
									<div class="col-md-9">
										<p class="form-control-static">${detailReceive.department_name }</p>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label">작성자명</label>
									<div class="col-md-9">
										<p class="form-control-static">${detailReceive.name }</p>
										<input type="hidden" id="demployee_no" name="employee_no" value="${employee.employee_no }">
										<input type="hidden" id="ddepartment_id" name="department_id" value="${employee.department_id }">
										<input type="hidden" id="ddocument_no" name="document_no" value="22">
										<input type="hidden" id="dcontent2" name="dcontent2" value="">
										<input type="hidden" id="dcontent3" name="dcontent3" value="">
										<input type="hidden" id="dcontent4" name="dcontent4" value="">
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
										<p class="form-control">${detailReceive.write_date }</p>
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-textarea-input">내용</label>
									<div class="col-md-9">
										<textarea id="dcontent" name="content" rows="7" class="form-control" disabled="disabled" >${detailReceive.content }</textarea>
									</div>
								</div>
							</form>
						</div>
						
					</div><!-- 결재 내용 끝  -->
					
				</div>
			
			</div>
			
			</div>
		</div>

<script type="text/javascript" src="../resources/js/detailDocumentCommon.js"></script>
<script type="text/javascript" src="../resources/js/DCList.js"></script>
<script>
$(document).ready(function(e){

	var approval_no = ${detailReceive.approval_no };
	var employee_no = ${employee.employee_no};
	approverList(approval_no, employee_no);
	approvalVList(approval_no);
	
	$("#rejectDoc").on("click",function(){
		
		var rejectD = {employee_no : employee_no, approval_no : approval_no };
		
		DCService.reject(rejectD, function(result){
			alert("반려 완료");
			location.href = "/document/approvalList?employee_no="+ ${employee.employee_no};

		});
		
	});
	
	$("#passDoc").on("click", function(){
		
		var passD = {employee_no : employee_no, approval_no : approval_no };
		
		DCService.pass(passD, function(result){
			alert("결재 완료");
			location.href = "/document/approvalList?employee_no="+ ${employee.employee_no};
		});
	
	});
	
});
</script>

</body>
</html>