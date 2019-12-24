<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>TYPE LIST</h1>
	<a href="typeinsertform">쓰기</a>

	<table border="1">
		<tr>
			<td>유형번호</td>
			<td>유형제목</td>
			<td>유형내용</td>
			<td></td>
			<td></td>
			<td></td>

		</tr>


		<c:forEach var="todotype" items="${typelist }">
			<tr>
				<td>${todotype.todo_type_no }</td>
				<td>${todotype.todo_type_title}</td>
				<td>${todotype.todo_type_contents}</td>
				<td><a
					href="typeupdateform?todo_type_no=${todotype.todo_type_no }">수정하기</a></td>
				<%-- <td><a href="typeupdateform?todo_type_no=${todotype.todo_type_no }">수정하기</a></td> --%>
				<%-- <td><button id="delTypeBtn" onclick="del(${todotype.todo_type_no})">삭제</button></td> --%>
				<td><a href="deleteType?todo_type_no=${todotype.todo_type_no }">삭제하기</a></td>
				<td><a href="todolist?todo_type_no=${todotype.todo_type_no }">TODO
						LIST</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
<script type="text/javascript">
	$(document.ready(function() {

		function del(todo_type_no) {
			location.href = 'deleteType?todo_type_no=' + todo_type_no;
		}

		$("#newTypeBtn").on("click", function() {

			self.location = "todo/typeinsertform";

		});

	}));
</script>
</html>

<style>
element.style {
	
}

@media ( min-width : 768px) .navbar-collapse.collapse {
	display
	
	
	:
	
	 
	
	block
	
	 
	
	!
	important
	
	
	;
	height
	
	
	:
	
	 
	
	auto
	
	 
	
	!
	important
	
	
	;
	padding-bottom
	
	
	:
	
	 
	
	0;
	overflow
	
	
	:
	
	 
	
	visible
	
	 
	
	!
	important
	
	
	;
}

.remove-padding {
	padding: 0 !important;
}

.form-control, .form-control:focus, .has-error .form-control:focus,
	.has-success .form-control:focus, .has-warning .form-control:focus,
	.modal-content, .navbar-collapse, .navbar-form, .panel, .progress,
	.progress-bar {
	-webkit-box-shadow: none;
	box-shadow: none;
}

@media ( min-width : 768px) .navbar-collapse {
	width
	
	
	:
	
	 
	
	auto
	
	
	;
	border-top
	
	
	:
	
	 
	
	0;
	-webkit-box-shadow
	
	
	:
	
	 
	
	none
	
	
	;
	box-shadow
	
	
	:
	
	 
	
	none
	
	
	;
}

.navbar-collapse {
	overflow-x: visible;
	padding-right: 15px;
	padding-left: 15px;
	border-top: 1px solid transparent;
	-webkit-box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1);
	box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.1);
	-webkit-overflow-scrolling: touch;
}

.collapse {
	display: none;
}

* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

user agent stylesheet
div {
	display: block;
}

.h1, .h2, .h3, .h4, .h5, .h6, body, h1, h2, h3, h4, h5, h6 {
	font-family: Lato, "Helvetica Neue", Helvetica, Arial, sans-serif;
}

.navbar-default .navbar-nav>li>a, body {
	color: #454e59;
}

body {
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
	font-size: 14px;
	line-height: 1.42857143;
	color: #333;
	background-color: #fff;
}

html {
	font-size: 10px;
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

html {
	font-family: sans-serif;
	-ms-text-size-adjust: 100%;
	-webkit-text-size-adjust: 100%;
}

user agent stylesheet
html {
	color: -internal-root-color;
}

.clearfix:before, .clearfix:after, .dl-horizontal dd:before,
	.dl-horizontal dd:after, .container:before, .container:after,
	.container-fluid:before, .container-fluid:after, .row:before, .row:after,
	.form-horizontal .form-group:before, .form-horizontal .form-group:after,
	.btn-toolbar:before, .btn-toolbar:after, .btn-group-vertical>.btn-group:before,
	.btn-group-vertical>.btn-group:after, .nav:before, .nav:after, .navbar:before,
	.navbar:after, .navbar-header:before, .navbar-header:after,
	.navbar-collapse:before, .navbar-collapse:after, .pager:before, .pager:after,
	.panel-body:before, .panel-body:after, .modal-header:before,
	.modal-header:after, .modal-footer:before, .modal-footer:after {
	content: " ";
	display: table;
}

*:before, *:after {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.clearfix:after, .dl-horizontal dd:after, .container:after,
	.container-fluid:after, .row:after, .form-horizontal .form-group:after,
	.btn-toolbar:after, .btn-group-vertical>.btn-group:after, .nav:after,
	.navbar:after, .navbar-header:after, .navbar-collapse:after, .pager:after,
	.panel-body:after, .modal-header:after, .modal-footer:after {
	clear: both;
}

.clearfix:before, .clearfix:after, .dl-horizontal dd:before,
	.dl-horizontal dd:after, .container:before, .container:after,
	.container-fluid:before, .container-fluid:after, .row:before, .row:after,
	.form-horizontal .form-group:before, .form-horizontal .form-group:after,
	.btn-toolbar:before, .btn-toolbar:after, .btn-group-vertical>.btn-group:before,
	.btn-group-vertical>.btn-group:after, .nav:before, .nav:after, .navbar:before,
	.navbar:after, .navbar-header:before, .navbar-header:after,
	.navbar-collapse:before, .navbar-collapse:after, .pager:before, .pager:after,
	.panel-body:before, .panel-body:after, .modal-header:before,
	.modal-header:after, .modal-footer:before, .modal-footer:after {
	content: " ";
	display: table;
}

*:before, *:after {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

#sidebar-scroll>div>ul {
	-webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	font-size: 14px;
	line-height: 1.42857143;
	font-family: Lato, "Helvetica Neue", Helvetica, Arial, sans-serif;
	color: #acb5bf;
	box-sizing: border-box;
	list-style: none;
	margin: 0;
	padding: 10px 0 0;
}
</style>