<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file="../common/header.jsp"%>
<script type="text/javascript" src="/resources/js/pages/modifymem.js"></script>
</head>
<body>

	<!-- Tickets Block -->
	<div class="block">
		<!-- Tickets Title -->
		<div class="block-title">
			<div class="block full"></div>
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
					<!-- Contacts Header -->
					<div class="content-header">
						<div class="row">
							<div class="col-sm-6">
								<div class="header-section">
									<h1>Contacts</h1>
								</div>
							</div>
							<div class="col-sm-6 hidden-xs">
								<div class="header-section">
									<ul class="breadcrumb breadcrumb-top">
										<li>Extra Pages</li>
										<li><a href="">Contacts</a></li>
									</ul>
								</div>
							</div>
						</div>
						<div class="text-center border-top push-inner-top-bottom">
							<div id=employeepage class="text-center">
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
							<div>
								<form id='actionForm' action="/contact/contactlist" method='get'>
									<div class="col-md-3">
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
										</select>
									</div>
									<input type='hidden' id='pageNum' name='pageNum'
										value='${pageMaker.cri.pageNum }'> <input type='text'
										id='keyword' name='keyword' value='${pageMaker.cri.keyword }'>
									<button>Search</button>
								</form>
							</div>
						</div>
						<!-- END Contacts Header -->

						<!-- Contacts Content -->

						<div class="row">
							<c:forEach var="em" items="${employeelist }">
								<div class="col-sm-6 col-md-4 col-lg-3">
									<a onclick="showModal('${em.employee_no}')"
										data-target="#modal-add-contact" class="widget"
										data-toggle="modal">
										<div class="widget-content text-right clearfix">
											<c:if test="${em.profile_pic ==null}">
												<img
													src="/resources/img/placeholders/avatars/avatar13@2x.jpg"
													alt="avatar"
													class="img-circle img-thumbnail img-thumbnail-avatar pull-left">
											</c:if>
											<c:if test="${em.profile_pic !=null}">
												<img
													src='/profile/displayprofile?fileName=${em.profile_pic}'
													alt="avatar"
													class="img-circle img-thumbnail img-thumbnail-avatar pull-left">
											</c:if>
											<h3 class="widget-heading h4">
												<strong>${em.name }</strong>
											</h3>
											<span class="text-muted">${em.department_name } /
												${em.position_name}</span>
										</div>
									</a>
								</div>
							</c:forEach>

						</div>
						<!-- END Contacts Content -->
						<%-- <div class="block full">
						<div class="block-title">
							<h2>사원 목록</h2>
						</div>

						<div class="table-responsive">
							<table id="example-datatable"
								class="table table-striped table-bordered table-vcenter">
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
												href="/master/deletemem.do?employee_no='${em.employee_no }"
												data-toggle="tooltip" title="Delete User"
												class="btn btn-effect-ripple btn-xs btn-danger"><i
													class="fa fa-times"></i></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>


						<div id=employeepage class="text-center">
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
						<div>
							<form id='actionForm' action="/master/listmember" method='get'>
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
								</select> <input type='hidden' id='pageNum' name='pageNum'
									value='${pageMaker.cri.pageNum }'> <input type='text'
									id='keyword' name='keyword' value='${pageMaker.cri.keyword }'>
								<button>Search</button>
							</form>
						</div> --%>
					</div>
				</div>
			</div>
			<!-- END Tickets List -->

			<!-- Ticket View -->
			<div class="tab-pane" id="tickets-single">
				<div class="alert alert-success animation-fadeInQuick">
					<strong>수정 요청 목록</strong>
				</div>
				<a href="javascript:void(0)"
					class="btn btn-xs btn-default pull-right"><i
					class="fa fa-check"></i> Flag as Closed</a> <a
					href="javascript:void(0)" class="btn btn-xs btn-danger"><i
					class="fa fa-flag"></i> Flag as Urgent</a> <a href="javascript:void(0)"
					class="btn btn-xs btn-warning"><i class="fa fa-flag"></i> Flag
					as Invalid</a>
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
	<!-- Add Contact Modal -->
	<div id="modal-add-contact" class="modal fade" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h3 class="modal-title"><div id="contactmodalhead"></div>
						
					</h3>
				</div>
				<div class="modal-body" id="contactmodal" name="contactmodal">



				</div>
			</div>
		</div>
	</div>
	<!-- END Add Contact Modal -->
	<!-- END Page Content -->
</body>
<script type="text/javascript">
	$(document).ready(function() {
		var actionForm = $("#actionForm");

		$(".paginate_button a").on("click", function(e) {

			e.preventDefault();

			console.log('click');

			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
	});
	
	function showModal(value) {
	$.ajax({
		url : '/contact/modal',
		type : 'post',
		datatype:'json',
		data : {"employee_no":value},
		success : function(em){
			
			$('#contactmodal').empty();
			$('#contactmodalhead').empty();
			var head='<i class="fa fa-plus"></i><strong>'+em.name+'</strong>';
			$('#contactmodalhead').append(head);

			var html='<div class="widget"><div class="widget-image widget-image-sm"> <img src="/resources/img/placeholders/photos/photo1@2x.jpg" alt="image">';
	        html+='<div class="widget-image-content text-center"><div id=profileimg>';
	        if(em.profile_pic==null){
	        	html+='<img src="/resources/img/placeholders/avatars/avatar13@2x.jpg" alt="avatar" class="img-circle img-thumbnail img-thumbnail-transparent img-thumbnail-avatar-2x push">';
	        }else{
	        	html+='<img src="/profile/displayprofile?fileName='+em.profile_pic+'" alt="avatar" class="img-circle img-thumbnail img-thumbnail-transparent img-thumbnail-avatar-2x push">'; 
	        } 
	        html+='</div><h2 class="widget-heading text-light"><strong> '+em.employee_no+'</strong></h2><h4 class="widget-heading text-light-op"><em> '+em.name+'</em></h4>';
	        html+='</div></div><div class="widget-content widget-content-full border-bottom"><div class="row text-center"><div class="col-xs-6 push-inner-top-bottom border-right">';       
	        html+='<h3 class="widget-heading"><i class="gi gi-heart text-danger push"></i> <br><small><strong>'+em.department_name +'</strong> </small></h3></div>';
	        html+='<div class="col-xs-6 push-inner-top-bottom"><h3 class="widget-heading"><i class="gi gi-group themed-color-social push"></i> <br><small><strong>'+em.position_name+'</strong></small></h3>';
	        html+='</div></div></div><div class="widget-content border-bottom"><h4>인사말</h4> <p>'+em.employee_greeting+'</p></div>';    
	        html+='<div class="widget-content"><h4>Social</h4><div class="btn-group"> <a href="/mail/mailform?to='+em.e_mail+'" class="btn btn-default" data-toggle="tooltip" title="E-mail"><i class="fa fa-message fa-fw"></i></a>';
	        html+='</div></div></div>';
	        
			
			
			$('#contactmodal').append(html);	
			}
		});

		$('#modal-add-contact').html();

		}
</script>

</html>