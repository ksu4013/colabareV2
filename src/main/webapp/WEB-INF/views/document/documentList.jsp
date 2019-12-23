<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file = "../common/header.jsp" %>


                    
                    
	
    <!-- Page content -->
    <div id="page-content">
        <!-- Blank Header -->
        <div class="content-header">
            <div class="row">
                <div class="col-sm-6">
                    <div class="header-section">
                        <h1>Page Title</h1>
                    </div>
                </div>
                <div class="col-sm-6 hidden-xs">
                    <div class="header-section">
                        <ul class="breadcrumb breadcrumb-top">
                            <li>Extra Pages</li>
                            <li><a href="">Blank</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- END Blank Header -->

        <!-- Get Started Block -->
        <div class="block full">
            <!-- Get Started Title -->
            <div class="block-title">
                <h2>Block Title</h2>
            </div>
            <!-- END Get Started Title -->
            
            
           <!-- Table Styles Block -->
        <div class="block">
			<button id='regBtn' type="button" class="btn btn-effect-ripple btn-primary" style="overflow: hidden; position: right;">
					<span class="btn-ripple animate" style="height: 75px; width: 75px; top: -29.5px; left: -14.5px;"></span>글쓰기
			</button><br><br>
            <!-- Table Styles Content -->
            <div class="table-responsive">
               
                <table id="general-table" class="table table-striped table-bordered table-vcenter table-hover">
					<thead>
						<tr>
							<th style="width: 80px;" class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></th>
							<th>Name</th>
							<th>Email</th>
							<th style="width: 320px;">Progress</th>
							<th style="width: 120px;" class="text-center"><i class="fa fa-flash"></i></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong><a href="/document/example1">인클루드 가자</a></strong></td>
							<td>gabriel.morris@example.com</td>
							<td>
							<div class="progress progress-mini active remove-margin">
							<div class="progress-bar progress-bar-striped progress-bar-danger" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%"></div>
							</div>
							</td>
							<td class="text-center">
							<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
							<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong>Ellis Thompson</strong></td>
							<td>ellis.thompson@example.com</td>
							<td>
							<div class="progress progress-mini active remove-margin">
							<div class="progress-bar progress-bar-striped progress-bar-info" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%"></div>
							</div>
							</td>
							<td class="text-center">
							<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
							<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong>Reece Bell</strong></td>
							<td>reece.bell@example.com</td>
							<td>
							<div class="progress progress-mini active remove-margin">
							<div class="progress-bar progress-bar-striped progress-bar-success" role="progressbar" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100" style="width: 95%"></div>
							</div>
							</td>
							<td class="text-center">
							<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
							<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong>Scarlett Reid</strong></td>
							<td>user4@example.com</td>
							<td>
							<div class="progress progress-mini active remove-margin">
							<div class="progress-bar progress-bar-striped progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%"></div>
							</div>
							</td>
							<td class="text-center">
							<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
							<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong>Alfie Harrison</strong></td>
							<td>alfie.harrison@example.com</td>
							<td>
							<div class="progress progress-mini active remove-margin">
							<div class="progress-bar progress-bar-striped progress-bar-danger" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%"></div>
							</div>
							</td>
							<td class="text-center">
							<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
							<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong>Finley Hunt</strong></td>
							<td>finley.hunt@example.com</td>
							<td>
							<div class="progress progress-mini active remove-margin">
							<div class="progress-bar progress-bar-striped progress-bar-warning" role="progressbar" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100" style="width: 55%"></div>
							</div>
							</td>
							<td class="text-center">
							<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
							<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong>Oliver Watson</strong></td>
							<td>oliver.watson@example.com</td>
							<td>
							<div class="progress progress-mini active remove-margin">
							<div class="progress-bar progress-bar-striped progress-bar-info" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%"></div>
							</div>
							</td>
							<td class="text-center">
							<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
							<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong>Maddison Reid</strong></td>
							<td>maddison.reid@example.com</td>
							<td>
							<div class="progress progress-mini active remove-margin">
							<div class="progress-bar progress-bar-striped progress-bar-success" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
							</div>
							</td>
							<td class="text-center">
							<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
							<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong>Katie Ward</strong></td>
							<td>katie.ward@example.com</td>
							<td>
							<div class="progress progress-mini active remove-margin">
							<div class="progress-bar progress-bar-striped progress-bar-success" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%"></div>
							</div>
							</td>
							<td class="text-center">
								<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
								<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong>Aidan Powell</strong></td>
							<td>aidan.powell@example.com</td>
							<td>
							<div class="progress progress-mini active remove-margin">
							<div class="progress-bar progress-bar-striped progress-bar-warning" role="progressbar" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100" style="width: 50%"></div>
							</div>
							</td>
							<td class="text-center">
							<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
							<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
					</tbody>
				</table>
            </div>
            <!-- END Table Styles Content -->
        </div>
        <!-- END Table Styles Block -->
            
            
            
            
            

            <!-- Get Started Content -->
            Start your creative project!
            <!-- END Get Started Content -->
        </div>
        <!-- END Get Started Block -->
    </div>
    <!-- END Page Content -->
</body>
</html>