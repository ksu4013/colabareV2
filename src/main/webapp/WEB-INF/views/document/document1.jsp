<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file = "../common/header.jsp" %>





<!--  -->
	<div id="page-content" class="inner-sidebar-right">
		<div id="page-content-sidebar">
			<a href="javascript:void(0)" class="btn btn-block btn-effect-ripple btn-primary visible-xs" data-toggle="collapse" data-target="#people-nav">People</a>
			<div id="people-nav" class="collapse navbar-collapse remove-padding">
				<div class="block-section">
					<h4 class="inner-sidebar-header"> 
					<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-default pull-right"><i class="fa fa-cog"></i></a>
					결재자
					</h4>
					<ul class="nav-users nav-users-online">
						<li>
							<a href="javascript:void(0)">
							<img src="img/placeholders/avatars/avatar6.jpg" alt="image" class="nav-users-avatar">
							<span class="label label-success nav-users-indicator">5</span><!-- 알림메시지 갯수  -->
							<span class="nav-users-heading">Olivia Rogers</span>
							<span class="text-muted">Graphic Designer</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0)">
							<img src="img/placeholders/avatars/avatar5.jpg" alt="image" class="nav-users-avatar">
							<span class="label label-success nav-users-indicator">3</span>
							<span class="nav-users-heading">Joe Jones</span>
							<span class="text-muted">Web Designer</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0)">
							<img src="img/placeholders/avatars/avatar12.jpg" alt="image" class="nav-users-avatar">
							<span class="label label-success nav-users-indicator">2</span>
							<span class="nav-users-heading">Nancy Cruz</span>
							<span class="text-muted">Writer</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0)">
							<img src="img/placeholders/avatars/avatar4.jpg" alt="image" class="nav-users-avatar">
							<span class="nav-users-heading">Ethan Hayes</span>
							<span class="text-muted">Web Developer</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0)">
							<img src="img/placeholders/avatars/avatar10.jpg" alt="image" class="nav-users-avatar">
							<span class="nav-users-heading">Julie Bennett</span>
							<span class="text-muted">Photographer</span>
							</a>
						</li>
					</ul>
				</div>
			<div class="block-section">
				<h4 class="inner-sidebar-header">
				<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-default pull-right"><i class="fa fa-cog"></i></a>
				참조자
				</h4>
				<ul class="nav-users nav-users-away">
					<li>
						<a href="javascript:void(0)">
						<img src="img/placeholders/avatars/avatar14.jpg" alt="image" class="nav-users-avatar">
						<span class="nav-users-heading">Harold Green</span>
						<span class="text-muted">Product Manager</span>
						</a>
					</li>
					<li>
						<a href="javascript:void(0)">
						<img src="img/placeholders/avatars/avatar15.jpg" alt="image" class="nav-users-avatar">
						<span class="nav-users-heading">Alan George</span>
						<span class="text-muted">Freelancer</span>
						</a>
					</li>
				</ul>
			</div>
				<div class="block-section">
					<h4 class="inner-sidebar-header">
						<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-default pull-right"><i class="fa fa-cog"></i></a>
					Offline
					</h4>
					<ul class="nav-users nav-users-offline">
						<li>
							<a href="javascript:void(0)">
							<img src="img/placeholders/avatars/avatar7.jpg" alt="image" class="nav-users-avatar">
							<span class="nav-users-heading">Nathan Moore</span>
							<span class="text-muted">UX Designer</span>
							</a>
						</li>
						<li>
							<a href="javascript:void(0)">
								<img src="img/placeholders/avatars/avatar16.jpg" alt="image" class="nav-users-avatar">
								<span class="nav-users-heading">Jason Gomez</span>
								<span class="text-muted">CEO</span>
							</a>
						</li>
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
							
							<form id="documentSub" action="/document/insertApproval" method="post"  class="form-horizontal form-bordered" >
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-text-input">기안제목</label>
									<div class="col-md-6">
										<input type="text"  name="title" class="form-control" >
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
										<input type="hidden" name="employee_no" value="${employee.employee_no }">
										<input type="hidden" name="department_id" value="${employee.department_id }">
										<input type="hidden" name="content2" value="왜 안 되는데?">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-disabled">작성일</label>
									<div class="col-md-6">
										<!-- <input type="text" id="example-disabled" name="example-disabled" class="form-control" placeholder="Disabled" disabled=""> -->
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-textarea-input">내용</label>
									<div class="col-md-9">
										<textarea id="example-textarea-input" name="content" rows="7" class="form-control" placeholder="1. 귀사의 무궁한 발전을 기원합니다.

2. 본사에서는 "></textarea>
									</div>
								</div>
								<div class="form-group form-actions">
									<div class="col-md-9 col-md-offset-3">
										<button id = "documentSav" type="button" class="btn btn-effect-ripple btn-primary">완료</button>
										<button type="reset" class="btn btn-effect-ripple btn-danger">취소</button>
										<button id = "approvalSav" type="button" class="btn btn-effect-ripple btn-primary">저장</button>
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
							<input type="text" id="example-input1-group2" name="example-input1-group2" class="form-control" placeholder="Username">
							<span class="input-group-btn">
								<button type="button" class="btn btn-effect-ripple btn-primary" style="overflow: hidden; position: relative;"><span class="btn-ripple animate" style="height: 84px; width: 84px; top: -23px; left: -1.625px;"></span><i class="fa fa-search"></i> Search</button>
							</span>
								
						</div>
					</div>
					<!--search botton 끝  -->
				
					<div class="widget-content widget-content-full">
						<table class="table table-borderless table-striped table-vcenter">
							<tbody>
								<tr>
									<td class="text-center" style="width: 100px;">
										<img src="img/placeholders/avatars/avatar13.jpg" alt="User Image" class="img-circle">
									</td>
									<td>
										<a href="javascript:void(0)">Sarah Hart</a><br>
										<a href="javascript:void(0)" class="text-muted"><small>5 common friends</small></a>
									</td>
									<td class="text-center" style="width: 80px;">
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-primary" data-toggle="tooltip" title="Friend Request"><i class="fa fa-plus"></i></a>
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-danger" data-toggle="tooltip" title="Follow"><i class="fa fa-share"></i></a>
									</td>
								</tr>
								<tr>
									<td class="text-center">
										<img src="img/placeholders/avatars/avatar5.jpg" alt="User Image" class="img-circle">
									</td>
									<td>
										<a href="javascript:void(0)">Mark Aguilar</a><br>
										<a href="javascript:void(0)" class="text-muted"><small>2 common friends</small></a>
									</td>
									<td class="text-center">
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-primary" data-toggle="tooltip" title="Friend Request"><i class="fa fa-plus"></i></a>
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-danger" data-toggle="tooltip" title="Follow"><i class="fa fa-share"></i></a>
									</td>
								</tr>
								<tr>
									<td class="text-center">
										<img src="img/placeholders/avatars/avatar12.jpg" alt="User Image" class="img-circle">
									</td>
									<td>
										<a href="javascript:void(0)">Karen Jackson</a><br>
										<a href="javascript:void(0)" class="text-muted"><small>3 common friends</small></a>
									</td>
									<td class="text-center">
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-primary" data-toggle="tooltip" title="Friend Request"><i class="fa fa-plus"></i></a>
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-danger" data-toggle="tooltip" title="Follow"><i class="fa fa-share"></i></a>
									</td>
								</tr>
								<tr>
									<td class="text-center">
										<img src="img/placeholders/avatars/avatar1.jpg" alt="User Image" class="img-circle">
									</td>
									<td>
										<a href="javascript:void(0)">Russell Larson</a><br>
										<a href="javascript:void(0)" class="text-muted"><small>5 common friends</small></a>
									</td>
									<td class="text-center">
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-primary" data-toggle="tooltip" title="Friend Request"><i class="fa fa-plus"></i></a>
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-danger" data-toggle="tooltip" title="Follow"><i class="fa fa-share"></i></a>
									</td>
								</tr>
								<tr>
									<td class="text-center">
										<img src="img/placeholders/avatars/avatar15.jpg" alt="User Image" class="img-circle">
									</td>
									<td>
										<a href="javascript:void(0)">Howard Adams</a><br>
										<a href="javascript:void(0)" class="text-muted"><small>5 common friends</small></a>
									</td>
									<td class="text-center">
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-primary" data-toggle="tooltip" title="Friend Request"><i class="fa fa-plus"></i></a>
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-danger" data-toggle="tooltip" title="Follow"><i class="fa fa-share"></i></a>
									</td>
								</tr>
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
							<span class="input-group-btn">
								<button type="button" class="btn btn-effect-ripple btn-primary" style="overflow: hidden; position: relative;"><span class="btn-ripple animate" style="height: 84px; width: 84px; top: -23px; left: -1.625px;"></span><i class="fa fa-search"></i> Search</button>
							</span>
							<!-- <input type="text" id="example-input1-group2" name="example-input1-group2" class="form-control" placeholder="Username"> -->
						</div>
					</div>
					<!--search botton 끝  -->
				
					<div class="widget-content widget-content-full">
						<table class="table table-borderless table-striped table-vcenter">
							<tbody>
								<tr>
									<td class="text-center" style="width: 100px;">
										<img src="img/placeholders/avatars/avatar13.jpg" alt="User Image" class="img-circle">
									</td>
									<td>
										<a href="javascript:void(0)">Sarah Hart</a><br>
										<a href="javascript:void(0)" class="text-muted"><small>5 common friends</small></a>
									</td>
									<td class="text-center" style="width: 80px;">
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-primary" data-toggle="tooltip" title="Friend Request"><i class="fa fa-plus"></i></a>
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-danger" data-toggle="tooltip" title="Follow"><i class="fa fa-share"></i></a>
									</td>
								</tr>
								<tr>
									<td class="text-center">
										<img src="img/placeholders/avatars/avatar5.jpg" alt="User Image" class="img-circle">
									</td>
									<td>
										<a href="javascript:void(0)">Mark Aguilar</a><br>
										<a href="javascript:void(0)" class="text-muted"><small>2 common friends</small></a>
									</td>
									<td class="text-center">
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-primary" data-toggle="tooltip" title="Friend Request"><i class="fa fa-plus"></i></a>
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-danger" data-toggle="tooltip" title="Follow"><i class="fa fa-share"></i></a>
									</td>
								</tr>
								<tr>
									<td class="text-center">
										<img src="img/placeholders/avatars/avatar12.jpg" alt="User Image" class="img-circle">
									</td>
									<td>
										<a href="javascript:void(0)">Karen Jackson</a><br>
										<a href="javascript:void(0)" class="text-muted"><small>3 common friends</small></a>
									</td>
									<td class="text-center">
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-primary" data-toggle="tooltip" title="Friend Request"><i class="fa fa-plus"></i></a>
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-danger" data-toggle="tooltip" title="Follow"><i class="fa fa-share"></i></a>
									</td>
								</tr>
								<tr>
									<td class="text-center">
										<img src="img/placeholders/avatars/avatar1.jpg" alt="User Image" class="img-circle">
									</td>
									<td>
										<a href="javascript:void(0)">Russell Larson</a><br>
										<a href="javascript:void(0)" class="text-muted"><small>5 common friends</small></a>
									</td>
									<td class="text-center">
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-primary" data-toggle="tooltip" title="Friend Request"><i class="fa fa-plus"></i></a>
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-danger" data-toggle="tooltip" title="Follow"><i class="fa fa-share"></i></a>
									</td>
								</tr>
								<tr>
									<td class="text-center">
										<img src="img/placeholders/avatars/avatar15.jpg" alt="User Image" class="img-circle">
									</td>
									<td>
										<a href="javascript:void(0)">Howard Adams</a><br>
										<a href="javascript:void(0)" class="text-muted"><small>5 common friends</small></a>
									</td>
									<td class="text-center">
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-primary" data-toggle="tooltip" title="Friend Request"><i class="fa fa-plus"></i></a>
										<a href="javascript:void(0)" class="btn btn-effect-ripple btn-xs btn-danger" data-toggle="tooltip" title="Follow"><i class="fa fa-share"></i></a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			
			
			</div>
		</div>
	</div>

<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
          
          
          
          
          <div class="widget-content"><!-- 결재내용 시작  -->
						<div class="block">
							<div class="block-title">
								<h2>General Elements</h2>
							</div>
							
							<form id="documentSub" action="/document/insertApproval" method="post"  class="form-horizontal form-bordered" >
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-text-input">기안제목</label>
									<div class="col-md-6">
										<input type="text"  name="title" class="form-control" >
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
										<input type="hidden" name="employee_no" value="${employee.employee_no }">
										<input type="hidden" name="department_id" value="${employee.department_id }">
										
										
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-disabled">작성일</label>
									<div class="col-md-6">
										<!-- <input type="text" id="example-disabled" name="example-disabled" class="form-control" placeholder="Disabled" disabled=""> -->
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-textarea-input">내용</label>
									<div class="col-md-9">
										<textarea id="example-textarea-input" name="content" rows="7" class="form-control" placeholder="1. 귀사의 무궁한 발전을 기원합니다.

2. 본사에서는 "></textarea>
									</div>
								</div>
								<div class="form-group form-actions">
									<div class="col-md-9 col-md-offset-3">
										<button id = "documentSav" type="button" class="btn btn-effect-ripple btn-primary">완료</button>
										<button type="reset" class="btn btn-effect-ripple btn-danger">취소</button>
										<button id = "approvalSav" type="button" class="btn btn-effect-ripple btn-primary">저장</button>
									</div>
								</div>
							</form>
						</div>
						
					</div>
          
          
          
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">이대로 진행하시겠습니까?</h4>
            </div>
            
            <div class="modal-body">
            
              
      
            </div>
            
            
            
	  		<div class="modal-footer">
		        <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
		        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
		        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
		        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
		    </div>     
		    
		    
		    
		    
		         
      	</div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->


<script>
$(document).ready(function(e){
	
	var documentSub = $("#documentSub");
	
	$("#documentSav").on("click", function(e){
		e.preventDefault();
		
		console.log("document clicked");
		
		documentSub.submit();
	});
	
	
	// 모달 
	var modal = $(".modal");
	
	$("#modalCloseBtn").on("click", function(e){
    	
    	modal.modal('hide');
    });
	
	$("#approvalSav").on("click", function(e){
		modal.modal('show');
	});
	
	 // 댓글 삽입
    $("button[data-oper='insert']").on("click", function(e){
    	var content = $('#content').val();

    	
    	var reply = {
    					board_no : board_no,
    					employee_no : employee_no,
    					content : content };
    	
    	MBReplyService.add(reply, function(result){
    		alert(result);
    		$('#content').val('');
    		showList(-1);
    	});
    					
    	
    });
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
});
</script>


</body>
</html>