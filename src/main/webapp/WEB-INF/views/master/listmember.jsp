<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<%@ include file="../common/header.jsp"%> 
<script type="text/javascript" src="/resources/js/pages/modifymem.js"></script>
</head>
<body>
	
		<!-- Tickets Block -->
		<div class="block">
			<!-- Tickets Title -->
			<div class="block-title">
				<div class="block full">
					
				</div>
				<ul class="nav nav-tabs" data-toggle="tabs">
					<li class="active"><a href="#tickets-list">Employee List</a></li>
					<li><a href="#tickets-single">Modify Request</a></li>
				</ul>
			</div>
			<!-- END Tickets Title -->

			<!-- Tabs Content -->
			<div class="tab-content">
				<!-- Tickets List -->
				<div class="tab-pane active" id="tickets-list">
					<div id="page-content">
						<div class="block full">
							<div class="block-title">
								<h2>사원 목록</h2>
							</div>
							<Div>
							
							</Div>
							 <div class="table-responsive">
								<table id="example-datatable"
									class="table table-striped table-bordered table-vcenter">
									<div class="pull-right">
									<button id="savefile" name="savefile" class="btn btn-effect-ripple btn-danger">저장하기</button>
									</div>
									<thead>
										<tr>
											<th class="text-center" style="width: 180px;">사원번호</th>
											<th class="text-center" style="width: 120px;">이름</th>
											<th class="text-center" style="width: 120px;">부서</th>
											<th class="text-center" style="width: 120px;">직급</th>
											<th class="text-center">E-Mail</th>
											<th class="text-center" style="width: 120px;">관리자</th>
											<th class="text-center" style="width: 75px;"><i
												class="fa fa-flash"></i></th>
										</tr>
									</thead>
									<tbody id="employeelist">
										<c:forEach var="em" items="${employeelist }">
											<tr id="${em.employee_no}">
												<td class="text-center">${em.employee_no }</td>
												<td class="text-center">${em.name }</td>
												<td><span class="label label-danger">${em.department_name }</span></td>
												<td><span class="label label-danger">${em.position_name }</span></td>
												<td class="text-center">${em.e_mail }</td>
												<td class="text-center">${em.master }</td>
												<td><a
													href="/master/modifymemform.do?employee_no=${em.employee_no }"
													data-toggle="tooltip" title="Edit User"
													class="btn btn-effect-ripple btn-xs btn-success"><i
														class="fa fa-pencil"></i></a> <a
													href="/master/deletemem.do?employee_no=${em.employee_no }"
													data-toggle="tooltip" title="Delete User"
													class="btn btn-effect-ripple btn-xs btn-danger"><i
														class="fa fa-times"></i></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div id="employeepage" class="text-center border-top">
								<ul class="pagination">
									<c:if test="${pageMaker.prev}">
										<li class="paginate_button previous"><a
											href="${pageMaker.startPage -1}">Previous</a></li>
									</c:if>

									<c:forEach var="num" begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}">
										<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
											<a href="${num}">${num}</a>
										</li>
									</c:forEach>

									<c:if test="${pageMaker.next}">
										<li class="paginate_button next"><a
											href="${pageMaker.endPage +1 }">Next</a></li>
									</c:if>
								</ul>
							</div>
							<div class="text-center border-top push-inner-top-bottom">
							<div id="formdiv" class="text-center">
								<form id='actionForm' action="/master/listmember" method='get' class="form-inline">
								<div class="form-group">
									<select name="department_info" id="department_info"
										class="form-control">
										<c:forEach var="department" items="${departments }">
											<c:if test="${department.department_id eq department_id }">
												<option value="${department.department_id }">${department.department_name }</option>
											</c:if>
										</c:forEach>
										<option value=""
											<c:out value="${pageMaker.cri.keyword == null?'selected':''}"/>>전체보기</option>
										<c:forEach var="department" items="${departments }">
											<option value="${department.department_id }"
												<c:out value="${pageMaker.cri.keyword == department.department_id?'selected':''}"/>>${department.department_name }</option>

										</c:forEach>
									</select> </div>
									  <div class="form-group"><input type='text'
										id='keyword' name='keyword' value='${pageMaker.cri.keyword }'>
									<button class="btn btn-primary">Search</button></div>
									<input type='hidden' id='pageNum' name='pageNum'
										value='${pageMaker.cri.pageNum }'>
								</form>
							</div>
							</div>
						</div>
					</div>
				</div>
				<!-- END Tickets List -->

				<!-- Ticket View -->
				<div class="tab-pane" id="tickets-single">
					<div class="alert alert-success animation-fadeInQuick">
						<strong>수정 요청 목록</strong>
					</div>
					
					<hr>
					<ul class="media-list media-feed push" id="requestlist">
						<!-- Ticket -->

						<!-- END Replies -->
					</ul>
				</div>
				<!-- END Ticket View -->
			</div>
			<!-- END Tabs Content -->
		</div>
		<!-- END Tickets Block -->

	<!-- END Page Content -->
</body>


</html>