<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file = "../common/header.jsp" %>




<!-- Page content -->
<div id="page-content">
    <!-- Forum Header -->
    <div class="content-header">
        <div class="row">
            <div class="col-sm-6">
                <div class="header-section">
                    <h1>결재목록</h1>
                </div>
            </div>
            <!-- <div class="col-sm-6 hidden-xs">
                <div class="header-section">
                    <ul class="breadcrumb breadcrumb-top">
                        <li>Extra Pages</li>
                        <li><a href="">Forum</a></li>
                    </ul>
                </div>
            </div> -->
        </div>
    </div>
    <!-- END Forum Header -->

    <!-- Forum Block -->
    <div class="block">
        <!-- Forum Tabs Title -->
        <div class="block-title">
            <ul class="nav nav-tabs" data-toggle="tabs">
                <li><a id="approval1" href="#approvalL1">기안문서</a></li>
                <li><a id ="approval2" href="#approvalL2">수신문서</a></li>
                <li><a id ="approval3" href="#approvalL3">반려문서</a></li>
                <li><a id ="approval4" href="#approvalL4">회람문서</a></li>
                <li><a id ="approval5" href="#approvalL5">결재 완료 문서</a></li>
            </ul>
        </div>
        <!-- END Forum Tabs -->

        <!-- Tab Content -->
        <div class="tab-content">
            <!-- Forum -->
            <div class="tab-pane active" id="#approvalL1">
                <!-- Intro Category -->
                <table class="table table-striped table-vcenter">
                    <thead>
                        <tr>
                            <th colspan="2">작성한 기안 목록</th>
                            <th class="text-center hidden-xs hidden-sm" style="width: 100px;">작성자</th>
                            <th class="hidden-xs hidden-sm" style="width: 200px;">기안 날짜</th>
                        </tr>
                    </thead>
                    <tbody id="sentDoc">
                    	
                    </tbody>
                </table>
                <!-- END Intro Category -->
				
            </div>
            <!-- END 기안문서 -->


            <!-- 수신문서 -->
            <div class="tab-pane" id="approvalL2">
                <table class="table table-striped table-vcenter">
                    <thead>
                        <tr>
                            <th colspan="2">결재 대기 목록</th>
                            <th class="text-center hidden-xs hidden-sm" style="width: 100px;">작성자</th>
                            <th class="hidden-xs hidden-sm" style="width: 200px;">기안 날짜</th>
                        </tr>
                    </thead>
                    <tbody id="receiveDoc">
                        
                        
                        
                    </tbody>
                </table>
                
            </div>
            <!-- END Topics -->






            <!-- Discussion -->
            <div class="tab-pane" id="approvalL3">
              <table class="table table-striped table-vcenter">
                    <thead>
                        <tr>
                            <th colspan="2">반려 문서 목록</th>
                            <th class="text-center hidden-xs hidden-sm" style="width: 100px;">작성자</th>
                            <th class="hidden-xs hidden-sm" style="width: 200px;">기안 날짜</th>
                        </tr>
                    </thead>
                    <tbody id="rejectDoc">
                      
                        
                        
                    </tbody>
                </table>
               
            </div>
            <!-- END Discussion -->
            <div class="tab-pane" id="approvalL4">
            	<table class="table table-striped table-vcenter">
                    <thead>
                        <tr>
                            <th colspan="2">회람 목록</th>
                            <th class="text-center hidden-xs hidden-sm" style="width: 100px;">작성자</th>
                            <th class="hidden-xs hidden-sm" style="width: 200px;">기안 날짜</th>
                        </tr>
                    </thead>
                    <tbody id="viewDoc">
                      
                        
                    </tbody>
                </table>
                
            </div>
            
            <div class="tab-pane" id="approvalL5">
            	<table class="table table-striped table-vcenter">
                    <thead>
                        <tr>
                            <th colspan="2">결재 완료 목록</th>
                            <th class="text-center hidden-xs hidden-sm" style="width: 100px;">작성자</th>
                            <th class="hidden-xs hidden-sm" style="width: 200px;">기안 날짜</th>
                        </tr>
                    </thead>
                    <tbody id="doneDoc">
                      
                        
                    </tbody>
                </table>
                
            </div>
            
            
            
            
        </div>
        <!-- END Tab Content -->
    </div>
    <!-- END Forum Block -->
</div>
<!-- END Page Content -->
<script type="text/javascript" src="../resources/js/approvalList.js"></script>
<script>
$(document).ready(function(e){
	var employee_no = '<c:out value="${employee.employee_no}"/>';
	
	
	APService.sentList(employee_no, function(list){
		
		var str = '';
		
		for(var i = 0 , len = list.length || 0 ; i < len; i++){
			str += '<tr>';
			str += '    <td class="text-center" style="width: 75px;"><i class="gi gi-pen fa-2x text-muted"></i></td>';
			str += '    <td>';
			str += '       <h4>';
			str += '            <a href="/document/detailDocV'+list[i].document_no+'?approval_no='+list[i].approval_no+'" class="text-dark"><strong>'+ list[i].title +'</strong></a>';
			str += '        </h4>';
			str += '         <div class="text-muted">'+ list[i].dtitle +'</div>';
			str += '     </td>';
			str += '     <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>'+list[i].name+'</strong></a></td>';
			str += '     <td class="hidden-xs hidden-sm">' + list[i].write_date + '</td>';
			str += '</tr>';
		}
		
		$("#sentDoc").html(str);
	});
	
	$("#approval1").on('click', function(){ 
		
		APService.sentList(employee_no, function(list){
		
			var str = '';
			
			for(var i = 0 , len = list.length || 0 ; i < len; i++){
				str += '<tr>';
				str += '    <td class="text-center" style="width: 75px;"><i class="gi gi-pen fa-2x text-muted"></i></i></td>';
				str += '    <td>';
				str += '       <h4>';
				str += '            <a href="/document/detailDocV'+list[i].document_no+'?approval_no='+list[i].approval_no+'" class="text-dark"><strong>'+ list[i].title +'</strong></a>';
				str += '        </h4>';
				str += '         <div class="text-muted">'+ list[i].dtitle +'</div>';
				str += '     </td>';
				str += '     <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>'+list[i].name+'</strong></a></td>';
				str += '     <td class="hidden-xs hidden-sm">' + list[i].write_date + '</td>';
				str += '</tr>';
			}
			
			$("#sentDoc").html(str);
		});
	});
	
	
	$("#approval2").on('click', function(){
		
		APService.reciveList(employee_no, function(list){
			var str = '';
			
			for(var i = 0 , len = list.length || 0 ; i < len; i++){		
				
				str += '<tr>';
				str += '    <td class="text-center" style="width: 75px;"><i class="fa fa-paper-plane fa-2x text-danger"></i></td>';
				str += '    <td>';
				str += '        <h4>';
				str += '            <a href="/document/detailDoc'+list[i].document_no+'?approval_no='+list[i].approval_no+'" class="text-dark"><strong>'+ list[i].title +'</strong></a>';
				str += '        </h4>';
				str += '        <div class="text-muted">'+ list[i].dtitle+'</div>';
				str += '    </td>';
				str += '    <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>'+list[i].name+'</strong></a></td>';
				str += '    <td class="hidden-xs hidden-sm">'+ list[i].write_date+'</td>';
				str += '</tr>';
				
			}
				$("#receiveDoc").html(str);
		});
			
	});
	
	
	$("#approval3").on('click', function(){ 
		
		APService.rejectList(employee_no, function(list){
		
			var str = '';
			
			for(var i = 0 , len = list.length || 0 ; i < len; i++){
				str += '<tr>';
				str += '    <td class="text-center" style="width: 75px;"><i class="fa fa-ban fa-2x text-danger"></i></td>';
				str += '    <td>';
				str += '       <h4>';
				str += '            <a href="/document/detailDocV'+list[i].document_no+'?approval_no='+list[i].approval_no+'" class="text-dark"><strong>'+ list[i].title +'</strong></a>';
				str += '        </h4>';
				str += '         <div class="text-muted">'+ list[i].dtitle +'</div>';
				str += '     </td>';
				str += '     <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>'+list[i].name+'</strong></a></td>';
				str += '     <td class="hidden-xs hidden-sm">' + list[i].write_date + '</td>';
				str += '</tr>';
			}
			
			$("#rejectDoc").html(str);
		});
	});
	
	$("#approval4").on('click', function(){ 
		
		APService.viewList(employee_no, function(list){
		
			var str = '';
			
			for(var i = 0 , len = list.length || 0 ; i < len; i++){
				str += '<tr>';
				str += '    <td class="text-center" style="width: 75px;"><i class="fa fa-eye fa-2x text-muted text-muted"></i></td>';
				str += '    <td>';
				str += '       <h4>';
				str += '            <a href="/document/detailDocV'+list[i].document_no+'?approval_no='+list[i].approval_no+'" class="text-dark"><strong>'+ list[i].title +'</strong></a>';
				str += '        </h4>';
				str += '         <div class="text-muted">'+ list[i].dtitle +'</div>';
				str += '     </td>';
				str += '     <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>'+list[i].name+'</strong></a></td>';
				str += '     <td class="hidden-xs hidden-sm">' + list[i].write_date + '</td>';
				str += '</tr>';
			}
			
			$("#viewDoc").html(str);
		});
	});
	
	$("#approval5").on('click', function(){ 
		
		APService.doneList(employee_no, function(list){
		
			var str = '';
			
			for(var i = 0 , len = list.length || 0 ; i < len; i++){
				str += '<tr>';
				str += '    <td class="text-center" style="width: 75px;"><i class="fa fa-thumbs-o-up fa-2x text-danger"></i></td>';
				str += '    <td>';
				str += '       <h4>';
				str += '            <a href="/document/detailDocV'+list[i].document_no+'?approval_no='+list[i].approval_no+'" class="text-dark"><strong>'+ list[i].title +'</strong></a>';
				str += '        </h4>';
				str += '         <div class="text-muted">'+ list[i].dtitle +'</div>';
				str += '     </td>';
				str += '     <td class="text-center hidden-xs hidden-sm"><a href="javascript:void(0)"><strong>'+list[i].name+'</strong></a></td>';
				str += '     <td class="hidden-xs hidden-sm">' + list[i].write_date + '</td>';
				str += '</tr>';
			}
			
			$("#doneDoc").html(str);
		});
		
		
		/* $.ajax({

			url : '/approval/realDoneApver',
			type : 'post',
			data : {"approval_no" : approval_no},
			dataType : 'json',
			success : function(result, status, xhr){
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
			
		});
		 */
		
		
		
		
		
		
		
	});

	
	
	

	

	

	
});
</script>
</body>
</html>