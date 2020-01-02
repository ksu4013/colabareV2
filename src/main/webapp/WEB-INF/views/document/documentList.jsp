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
                        <h1>전자결재</h1>
                    </div>
                </div>
            </div>
        </div>
        <!-- END Blank Header -->

        <!-- Get Started Block -->
        <div class="block full">
            <!-- Get Started Title -->
            <div class="block-title">
                <h2>문서목록</h2>
            </div>
            <!-- END Get Started Title -->
            
            
           <!-- Table Styles Block -->
        <div class="block">
			<!-- <button id='regBtn' type="button" class="btn btn-effect-ripple btn-primary" style="overflow: hidden; position: right;">
					<span class="btn-ripple animate" style="height: 75px; width: 75px; top: -29.5px; left: -14.5px;"></span>글쓰기
			</button> --><br><br>
            <!-- Table Styles Content -->
            <div class="table-responsive">
                <table id="general-table" class="table table-striped table-bordered table-vcenter table-hover">
					<thead>
						<tr>
							<th style="width: 80px;" class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></th>
							<th>문서 이름</th>
							<th style="width: 120px;" class="text-center"><i class="fa fa-flash"></i></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong><a href="/document/document1">일반 기안서</a></strong></td>
							<td class="text-center">
							<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
							<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong><a href="/document/document2">명함신청서</strong></td>
							<td class="text-center">
							<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
							<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong><a href="/document/document3">퇴직신청서</strong></td>
							<td class="text-center">
							<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
							<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong><a href="/document/document4">품질보고서</strong></td>
							<td class="text-center">
							<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
							<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong><a href="/document/document5">교통비지출신청서</strong></td>
							<td class="text-center">
							<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
							<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong><a href="/document/document6">경조비지급신청서</strong></td>
							<td class="text-center">
							<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
							<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong><a href="/document/document7">사직신청서</strong></td>
							<td class="text-center">
							<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
							<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong><a href="/document/document8">결근사유서</strong></td>
							<td class="text-center">
							<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
							<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong><a href="/document/document9">프로젝트 업무보고</strong></td>
							<td class="text-center">
								<a href="javascript:void(0)" data-toggle="tooltip" title="Edit User" class="btn btn-effect-ripple btn-sm btn-success"><i class="fa fa-pencil"></i></a>
								<a href="javascript:void(0)" data-toggle="tooltip" title="Delete User" class="btn btn-effect-ripple btn-sm btn-danger"><i class="fa fa-times"></i></a>
							</td>
						</tr>
						<tr>
							<td class="text-center"><label class="csscheckbox csscheckbox-primary"><input type="checkbox"><span></span></label></td>
							<td><strong><a href="/document/document10">채용계획서</strong></td>
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
            
            
            
            
        </div>
        <!-- END Get Started Block -->
    </div>
    <!-- END Page Content -->
</body>
</html>