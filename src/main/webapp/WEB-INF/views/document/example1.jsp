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
							<form action="page_forms_components.php" method="post" enctype="multipart/form-data" class="form-horizontal form-bordered" onsubmit="return false;">
								<div class="form-group">
									<label class="col-md-3 control-label">Static</label>
									<div class="col-md-9">
										<p class="form-control-static">This is static text</p>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-text-input">Text</label>
									<div class="col-md-6">
										<input type="text" id="example-text-input" name="example-text-input" class="form-control" placeholder="Text">
										<span class="help-block">This is a help text</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-email">Email</label>
									<div class="col-md-6">
										<input type="email" id="example-email" name="example-email" class="form-control" placeholder="Email">
									</div>
								</div>
									<div class="form-group">
										<label class="col-md-3 control-label" for="example-password">Password</label>
										<div class="col-md-6">
											<input type="password" id="example-password" name="example-password" class="form-control" placeholder="Password">
										</div>
									</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-disabled">Disabled</label>
									<div class="col-md-6">
										<input type="text" id="example-disabled" name="example-disabled" class="form-control" placeholder="Disabled" disabled="">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-textarea-input">Textarea</label>
									<div class="col-md-9">
										<textarea id="example-textarea-input" name="example-textarea-input" rows="7" class="form-control" placeholder="Description.."></textarea>
									</div>
								</div>
								<div class="form-group">
								<label class="col-md-3 control-label" for="example-select">Select</label>
									<div class="col-md-6">
										<select id="example-select" name="example-select" class="form-control" size="1">
											<option value="0">Please select</option>
											<option value="1">HTML</option>
											<option value="2">CSS</option>
											<option value="3">Javascript</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-multiple-select">Multiple</label>
									<div class="col-md-6">
										<select id="example-multiple-select" name="example-multiple-select" class="form-control" size="5" multiple="">
											<option value="1">Option #1</option>
											<option value="2">Option #2</option>
											<option value="3">Option #3</option>
											<option value="4">Option #4</option>
											<option value="5">Option #5</option>
											<option value="6">Option #6</option>
											<option value="7">Option #7</option>
											<option value="8">Option #8</option>
											<option value="9">Option #9</option>
											<option value="10">Option #10</option>
										</select>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">Radios</label>
										<div class="col-md-9">
											<div class="radio">
												<label for="example-radio1">
													<input type="radio" id="example-radio1" name="example-radios" value="option1"> HTML
												</label>
											</div>
											<div class="radio">
												<label for="example-radio2">
													<input type="radio" id="example-radio2" name="example-radios" value="option2"> CSS
												</label>
											</div>
											<div class="radio">
												<label for="example-radio3">
													<input type="radio" id="example-radio3" name="example-radios" value="option3"> Javascript
												</label>
											</div>
										</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">Inline Radios</label>
									<div class="col-md-9">
										<label class="radio-inline" for="example-inline-radio1">
											<input type="radio" id="example-inline-radio1" name="example-inline-radios" value="option1"> HTML
										</label>
										<label class="radio-inline" for="example-inline-radio2">
											<input type="radio" id="example-inline-radio2" name="example-inline-radios" value="option2"> CSS
										</label>
										<label class="radio-inline" for="example-inline-radio3">
											<input type="radio" id="example-inline-radio3" name="example-inline-radios" value="option3"> Javascript
										</label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">Checkboxes</label>
									<div class="col-md-9">
										<div class="checkbox">
											<label for="example-checkbox1">
												<input type="checkbox" id="example-checkbox1" name="example-checkbox1" value="option1"> HTML
											</label>
										</div>
										<div class="checkbox">
											<label for="example-checkbox2">
												<input type="checkbox" id="example-checkbox2" name="example-checkbox2" value="option2"> CSS
											</label>
										</div>
										<div class="checkbox">
											<label for="example-checkbox3">
												<input type="checkbox" id="example-checkbox3" name="example-checkbox3" value="option3"> Javascript
											</label>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label">Inline Checkboxes</label>
									<div class="col-md-9">
										<label class="checkbox-inline" for="example-inline-checkbox1">
											<input type="checkbox" id="example-inline-checkbox1" name="example-inline-checkbox1" value="option1"> HTML
										</label>
										<label class="checkbox-inline" for="example-inline-checkbox2">
											<input type="checkbox" id="example-inline-checkbox2" name="example-inline-checkbox2" value="option2"> CSS
										</label>
										<label class="checkbox-inline" for="example-inline-checkbox3">
											<input type="checkbox" id="example-inline-checkbox3" name="example-inline-checkbox3" value="option3"> Javascript
										</label>
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-file-input">File</label>
									<div class="col-md-9">
										<input type="file" id="example-file-input" name="example-file-input">
									</div>
								</div>
								<div class="form-group">
									<label class="col-md-3 control-label" for="example-file-multiple-input">Multiple File</label>
									<div class="col-md-9">
										<input type="file" id="example-file-multiple-input" name="example-file-multiple-input" multiple="">
									</div>
								</div>
								<div class="form-group form-actions">
									<div class="col-md-9 col-md-offset-3">
										<button type="submit" class="btn btn-effect-ripple btn-primary" style="overflow: hidden; position: relative;">Submit</button>
										<button type="reset" class="btn btn-effect-ripple btn-danger" style="overflow: hidden; position: relative;">Reset</button>
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
							<span class="input-group-btn">
								<button type="button" class="btn btn-effect-ripple btn-primary" style="overflow: hidden; position: relative;"><span class="btn-ripple animate" style="height: 84px; width: 84px; top: -23px; left: -1.625px;"></span><i class="fa fa-search"></i> Search</button>
							</span>
							<input type="text" id="example-input1-group2" name="example-input1-group2" class="form-control" placeholder="Username">
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
							<input type="text" id="example-input1-group2" name="example-input1-group2" class="form-control" placeholder="Username">
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







</body>
</html>