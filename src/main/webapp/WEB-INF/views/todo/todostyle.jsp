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
                     <span class="badge pull-right"><a href="deleteType?todo_type_no=${todotype.todo_type_no }"data-original-title="Delete Type">x</a></span>
                     <i class="fa fa-book fa-fw icon-push"></i> <strong><a href="todolist?todo_type_no=${todotype.todo_type_no }">${todotype.todo_type_title }</strong>
                   
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

  
</div>
<!-- END Page Content -->

<script type="text/javascript">
    
    $(document.ready(function(){
      
       $('#deleteBtn').on("click",function(){
          location.href = "deleteType?todo_type_no=${todotype.todo_type_no }"
       });
       
       
       
    }));
    
    
</script>