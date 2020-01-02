/**
 * 
 */

	
	
 	// 결재자 목록 리스트
	function approverList(approval_no, employee_no){
		
		$('#aList').empty();
		
		var approval_no = approval_no;
		var employee_no = employee_no;
		
		DCService.approverList(approval_no, function(result){
			
			var output = '';
			
			$.each(result, function(index, list){	
				output += '<li>';
				output += '<a href="javascript:void(0)">';
				if(list.profilepic == null){
					output += '<img src="/resources/img/placeholders/avatars/avatar13@2x.jpg" alt="image" class="nav-users-avatar">';
				}else{
					output += '<img src="/profile/displayprofile?fileName='+list.profilepic+'" alt="image" class="nav-users-avatar">';
				}
				output += '<span class="label label-success nav-users-indicator">' + (index+1) + '</span>';
				output += '<span class="nav-users-heading">' + list.name + '</span>';
				output += '<span class="text-muted">' + list.department_name + '</span>';
				if(list.approval_active == 'a' && list.employee_no == employee_no){
					output += "&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-effect-ripple btn-xs btn-info' data-toggle='tooltip' >결재중</button></a>";
				}
				if(list.approval_active == 'y'){
					output += "&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-effect-ripple btn-xs btn-info' data-toggle='tooltip' >결재완료</button></a>";	
				}
				if(list.approval_active == 'n'){
					output += "&nbsp;&nbsp;&nbsp;<button type='button' class='btn btn-effect-ripple btn-xs btn-danger' data-toggle='tooltip' >반려</button></a>";
				}
				output += '</li>';
			
			$("#aList").html(output);
			});
		});
		
	} 
 	
	// 참조자 목록 리스트
	function approvalVList(approval_no){
		
		$('#bList').empty();
		
		var approval_no = approval_no;
		
		DCService.approvalVList(approval_no, function(result){
			
			var output = '';
			
			$.each(result, function(index, list){	
				output += '<li>';
				output += '<a href="javascript:void(0)">';
				if(list.profilepic == null){
					output += '<img src="/resources/img/placeholders/avatars/avatar13@2x.jpg" alt="image" class="nav-users-avatar">';
				}else{
					output += '<img src="/profile/displayprofile?fileName='+list.profilepic+'" alt="image" class="nav-users-avatar">';
				}
				output += '<span class="label label-success nav-users-indicator">' + (index+1) + '</span>';
				output += '<span class="nav-users-heading">' + list.name + '</span>';
				output += '<span class="text-muted">' + list.department_name + '</span>';
				output += '</li>';
			
			$("#bList").html(output);
			});
		});
		
	}
	
	
	
	
	
