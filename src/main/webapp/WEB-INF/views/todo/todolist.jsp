<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@include file="../common/header.jsp" %>

<head>

</head>
<div>
</div>
<hr><hr>
<!-- Tasks List -->
<!-- Add new task functionality (initialized in js/pages/readyTasks.js) -->
<div class="row">
	
	<div class="col-md-10 col-md-offset-1 col-lg-6 col-lg-offset-3">
	<!-- 	<form id="add-task-form" class="push">
			<input type="text" id="add-task" name="add-task"
				class="form-control input-lg"
				placeholder="Enter a task and press enter..">
		</form> -->
		<a href="todoinsertform?todo_type_no=${todo_type_no}">new todo</a>
		<a href="todoinsertform?todo_type_no=${todo_type_no }" class="btn btn-xs btn-default pull-left"><i
					class="fa fa-plus"></i></a>
		<ul class="task-list">
		<c:forEach var="todolist" items="${todolist }">
			<li>
			
			<a href="deleteTodo?todo_no=${todolist.todo_no}&todo_type_no=${todolist.todo_type_no}" class="task-close text-danger"><i
					class="fa fa-times" id="delBtn"></i></a> <label class="checkbox-inline"> <input
					type="checkbox"> ${todolist.todo_title }	</label>
			
			</li>
			
			</c:forEach>
		</ul>
		<a href="typelist">TODO TYPE</a><hr>
	</div>
</div>
<!-- END Task List -->
</div>

<%-- 
<body>


	<h3>todo 리스트</h3>
	<hr>
	<a href="todoinsertform?todo_type_no=${todo_type_no}">새로운 todo</a>
	<br>
	<br>
	<table border="1">
		<tr>
			<td>할일 번호</td>
			<td>할일 제목</td>
			<td>할일 내용</td>
			
		</tr>

		<c:forEach var="todolist" items="${todolist }">
			<tr>
				<td>${todolist.todo_no }</td>
				<td>${todolist.todo_title }</td>
				<td>${todolist.todo_contents }</td>


				<td><a
					href="todoupdateform?todo_no=${todolist.todo_no}&todo_type_no=${todolist.todo_type_no}">수정하기</a></td>
				<td><a
					href="deleteTodo?todo_no=${todolist.todo_no}&todo_type_no=${todolist.todo_type_no}">삭제하기</a></td>
			</tr>
			<input type="hidden" name="todo_type_no" value="${todo_type_no}">
		</c:forEach>
	</table>
	<br>
	<br>
	<hr>
	<a href="typelist">TODO TYPE</a>
</body> --%>

<script type="text/javascript">
$(document.ready(function() {
	
	$("#delBtn").on("click",function(){
		
	});
	}));

</script>
<style>
element.style {
	
}

.row {
	margin-left: -15px;
	margin-right: -15px;
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
</style>

</html>

