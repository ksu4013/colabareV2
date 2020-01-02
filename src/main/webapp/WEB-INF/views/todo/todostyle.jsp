<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../common/header.jsp"%>




<!-- Main Container -->


<div id="page-content" class="row">
	<!-- Inner Sidebar -->
	<div class="block">
		<!-- Collapsible Options -->
		<a href="javascript:void(0)"
			class="btn btn-block btn-default visible-xs" data-toggle="collapse"
			data-target="#todo-options">Options</a>
		<div id="todo-options" class="collapse navbar-collapse remove-padding">
			<!-- Lists -->
			<h4 class="inner-sidebar-header">
				<a href="typeinsertform" class="btn btn-xs btn-default pull-right"><i
					class="fa fa-plus"></i></a> Lists
			</h4>
			<div class="block-section">

			<div class="block">
				<ul class="nav nav-pills nav-stacked">
				
				
					<li>
						<c:forEach var="todotype" items="${typelist }">
							<div class="col-sm-3"><a href="typeupdateform?todo_type_no=${todotype.todo_type_no }" data-toggle="tooltip" class="btn btn-effect-ripple btn-sm btn-success col-sm-3" style=overflow: hidden; position: relative; data-original-title="Edit Type"><i class="fa fa-pencil"></i></a></div>
							<a href="javascript:void(0)"> <span class="badge pull-right"><a href="deleteType?todo_type_no=${todotype.todo_type_no }"data-original-title="Delete Type">x</a></span>
							<i class="fa fa-book fa-fw icon-push"></i> <strong><a href="todolist?todo_type_no=${todotype.todo_type_no }">${todotype.todo_type_title }</strong>
							</a>
						</c:forEach>
					</li>
				
				</ul>
				</div>
			</div>
			<!-- END Lists -->

		
		</div>
		<!-- END Collapsible Options -->
	</div>
	<!-- END Inner Sidebar -->

	<!-- Tasks List
	Add new task functionality (initialized in js/pages/readyTasks.js)
	<div class="row">
		<div class="col-md-10 col-md-offset-1 col-lg-6 col-lg-offset-3">
			<form id="add-task-form" class="push">
				<input type="text" id="add-task" name="add-task"
					class="form-control input-lg"
					placeholder="Enter a task and press enter..">
			</form>
			<ul class="task-list">
				<li><a href="javascript:void(0)" class="task-close text-danger"><i
						class="fa fa-times"></i></a> <label class="checkbox-inline"> <input
						type="checkbox"> Update plugins
				</label></li>
				<li class="task-done"><a href="javascript:void(0)"
					class="task-close text-danger"><i class="fa fa-times"></i></a> <label
					class="checkbox-inline"> <input type="checkbox"> To
						do list page
				</label></li>
				<li><a href="javascript:void(0)" class="task-close text-danger"><i
						class="fa fa-times"></i></a> <label class="checkbox-inline"> <input
						type="checkbox"> PSDs Freebies
				</label></li>
				<li class="in-2x"><a href="javascript:void(0)"
					class="task-close text-danger"><i class="fa fa-times"></i></a> <label
					class="checkbox-inline"> <input type="checkbox">
						Icon pack
				</label></li>
				<li class="in-2x"><a href="javascript:void(0)"
					class="task-close text-danger"><i class="fa fa-times"></i></a> <label
					class="checkbox-inline"> <input type="checkbox">
						Widget Pack
				</label></li>
				<li><a href="javascript:void(0)" class="task-close text-danger"><i
						class="fa fa-times"></i></a> <label class="checkbox-inline"> <input
						type="checkbox"> Design UI Elements
				</label></li>
				<li><a href="javascript:void(0)" class="task-close text-danger"><i
						class="fa fa-times"></i></a> <label class="checkbox-inline"> <input
						type="checkbox"> New Features
				</label></li>
				<li class="in-1x task-done"><a href="javascript:void(0)"
					class="task-close text-danger"><i class="fa fa-times"></i></a> <label
					class="checkbox-inline"> <input type="checkbox">
						User Profile page
				</label></li>
				<li class="in-1x"><a href="javascript:void(0)"
					class="task-close text-danger"><i class="fa fa-times"></i></a> <label
					class="checkbox-inline"> <input type="checkbox">
						Create new pages
				</label></li>
				<li><a href="javascript:void(0)" class="task-close text-danger"><i
						class="fa fa-times"></i></a> <label class="checkbox-inline"> <input
						type="checkbox"> Fix some CSS bugs
				</label></li>
				<li><a href="javascript:void(0)" class="task-close text-danger"><i
						class="fa fa-times"></i></a> <label class="checkbox-inline"> <input
						type="checkbox"> Add new components
				</label></li>
			</ul>
		</div>
	</div>
	END Task List -->
</div>
<!-- END Page Content -->

<script type="text/javascript">
    
    $(document.ready(function(){
		
    	$('#deleteBtn').on("click",function(){
    		location.href = "deleteType?todo_type_no=${todotype.todo_type_no }"
    	});
    	
    	
    	
    }));
    
    
</script>
