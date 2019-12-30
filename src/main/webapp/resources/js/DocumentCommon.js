/**
 *  문서 공통 양식
 */

console.log("Document Common!!,,,,!!!!!!!!!!!!!!!!!");

$(document).ready(function(e){
	
	// 문서 삽입
	$("#documentSav").on("click", function(e){
		var title = $("#title").val();
		var employee_no = $("#demployee_no").val();
		var department_id = $("#ddepartment_id").val();
		var document_no = $("#ddocument_no").val();
		
		var content   = $("#dcontent").val();
		var content2  = $("#dcontent2").val();
		var content3  = $("#dcontent3").val();
		var content4  = $("#dcontent4").val();
		var content5  = $("#dcontent5").val();
		var content6  = $("#dcontent6").val();
		var content7  = $("#dcontent7").val();
		var content8  = $("#dcontent8").val();
		var content9  = $("#dcontent9").val();
		var content10 = $("#dcontent10").val();
		
		var docu = {
				title: title,
				employee_no: employee_no,
				department_id: department_id,
				document_no: document_no,
				content: content,
				content2: content2,
				content3: content3,
				content4: content4,
				content5: content5,
				content6: content6,
				content7: content7,
				content8: content8,
				content9: content9,
				content10: content10
		};
		
		DCService.addDoc(docu,function(result){
			alert(result);
		})
	});
	
	
	// 결재자 검색
	$("#aSearch").keyup(function(){
		var query = $(this).val();
		
		if(query != ''){
			$.ajax({
				url : "/approval/search",
				method : "post",
				data : { "query" : query},
				dataType : 'json',
				success : function(data){
					searchList(data);
				}
			});
		}
		
	});
	
	// 결재자 검색결과 리스트
	function searchList(data){
		
		var output = '';
			
		$.each(data, function(index, list){	
			output += "<tr>";
			output += "<td class='text-center' style='width: 100px;'>";
			output += "<img src='img/placeholders/avatars/avatar13.jpg' alt='User Image' class='img-circle'>";
			output += "</td><td>";
			output += "<a href='javascript:void(0)'>"+ list.name + "</a><br>";
			output += '<input name="employee_no" value=' + list.employee_no +'>';
			output += "</td>";
			output += "<td class='text-center' style='width: 80px;'>";
			output += "<button type='button' id='moveA' value='"+list.employee_no+"' class='btn btn-effect-ripple btn-xs btn-primary' data-toggle='tooltip' title='결재자로 추가하기'><i class='fa fa-plus'></i></button>";
			output += "</td>";
			output += "</tr>";
			
		$("#aSearchList").fadeIn();
		$("#aSearchList").html(output);
		});

	}
	
	$("#aSearchList").on('click', '#moveA', function(){
		
		var employee_no = $(this).val();
		
		$.ajax({
			url : "/approval/" + employee_no + ".json",
			method : "post",
			data : {"employee_no" : employee_no},
			dataType : 'json',
			success : function(data){
				lastNum(data, employee_no);
			}
		});
		
	});
	
	// 마지막 넘버
	function lastNum(data, employee_no){
		var employee_no = employee_no;
		
		$.ajax({
			url : "/approval/lastNum",
			method : "post",
			success : function(result){
				approverInsert(result,employee_no);
			}
		});
		
	}
	
	// 결재자 삽입
	function approverInsert(data, employee_no){
		
		var approval_no = data;
		var employee_no = employee_no;
		
		var approver = {
				approval_no : approval_no,
				employee_no : employee_no
		};
		
		DCService.addApprover(approver, function(result){
			approverList(approval_no);
			
		});
		
	}
	
	// 결재자 목록 리스트
	function approverList(approval_no){
		
		$('#aList').empty();
		
		var approval_no = approval_no;
		
		DCService.approverList(approval_no, function(result){
			
			var output = '';
			
			$.each(result, function(index, list){	
				output += '<li>';
				output += '<a href="javascript:void(0)">';
				output += '<img src="img/placeholders/avatars/avatar6.jpg" alt="image" class="nav-users-avatar">';
				output += '<span class="label label-success nav-users-indicator">' + (index+1) + '</span>';
				output += '<span class="nav-users-heading">' + list.name + '</span>';
				output += '<span class="text-muted">' + list.department_name + '</span>';
				output += "<button type='button' id='aListRemove' value='"+ list.no +"' class='btn btn-effect-ripple btn-xs btn-danger' data-toggle='tooltip' title='삭제하기'><i id='appNo' value='"+ approval_no +"'  class='fa fa-share'></i></button></a>";
				output += '</li>';
			
			// $("#aList").fadeIn();
			$("#aList").html(output);
			});
		});
		
	}
	
	// 결재자 삭제
	$("#aList").on('click', '#aListRemove', function(){
		
		var no = $(this).val();
		approvalNumSelect(no);
		
		function approvalNumSelect(no){
			$.ajax({
				url : "/approval/approvalNumSelect",
				method : "post",
				data : {"no" : no},
				dataType : 'json',
				success : function(result){
					approverDelete(result);
				}
			});
			
		}
		
		
		function approverDelete(data){
			var approval_no = data;
			
			DCService.approverRemove(no, function(result){
				approverList(approval_no);
			});
		}
		
	});
	
	
	// 참조자 검색
	$("#bSearch").keyup(function(){
		var query = $(this).val();
		
		if(query != ''){
			$.ajax({
				url : "/approval/search",
				method : "post",
				data : { "query" : query},
				dataType : 'json',
				success : function(data){
					bSearchList(data);
				}
			});
		}
		
	});
	
	// 참조자 검색결과 리스트
	function bSearchList(data){
		
		var output = '';
			
		$.each(data, function(index, list){	
			output += "<tr>";
			output += "<td class='text-center' style='width: 100px;'>";
			output += "<img src='img/placeholders/avatars/avatar13.jpg' alt='User Image' class='img-circle'>";
			output += "</td><td>";
			output += "<a href='javascript:void(0)'>"+ list.name + "</a><br>";
			output += '<input name="employee_no" value=' + list.employee_no +'>';
			output += "</td>";
			output += "<td class='text-center' style='width: 80px;'>";
			output += "<button type='button' id='moveB' value='"+list.employee_no+"' class='btn btn-effect-ripple btn-xs btn-primary' data-toggle='tooltip' title='결재자로 추가하기'><i class='fa fa-plus'></i></button>";
			output += "</td>";
			output += "</tr>";
			
		$("#bSearchList").fadeIn();
		$("#bSearchList").html(output);
		});

	}
	
	$("#bSearchList").on('click', '#moveB', function(){
		
		var employee_no = $(this).val();
		
		$.ajax({
			url : "/approval/" + employee_no + ".json",
			method : "post",
			data : {"employee_no" : employee_no},
			dataType : 'json',
			success : function(data){
				lastNumB(data, employee_no);
			}
		});
		
	});
	
	// 마지막 넘버 참조자
	function lastNumB(data, employee_no){
		var employee_no = employee_no;
		
		$.ajax({
			url : "/approval/lastNum",
			method : "post",
			success : function(result){
				approvalVInsert(result,employee_no);
			}
		});
		
	}
	
	// 참조자 삽입
	function approvalVInsert(data, employee_no){
		
		var approval_no = data;
		var employee_no = employee_no;
		
		var approvalV = {
				approval_no : approval_no,
				employee_no : employee_no
		};
		
		DCService.addApproval(approvalV, function(result){
			approvalVList(approval_no);
			
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
				output += '<img src="img/placeholders/avatars/avatar6.jpg" alt="image" class="nav-users-avatar">';
				output += '<span class="label label-success nav-users-indicator">' + (index+1) + '</span>';
				output += '<span class="nav-users-heading">' + list.name + '</span>';
				output += '<span class="text-muted">' + list.department_name + '</span>';
				output += "<button type='button' id='bListRemove' value='"+ list.apprviewer +"' class='btn btn-effect-ripple btn-xs btn-danger' data-toggle='tooltip' title='삭제하기'><i id='appNo' value='"+ approval_no +"'  class='fa fa-share'></i></button></a>";
				output += '</li>';
			
			// $("#aList").fadeIn();
			$("#bList").html(output);
			});
		});
		
	}
	
	// 참조자 삭제
	$("#bList").on('click', '#bListRemove', function(){
		
		var apprviewer = $(this).val();
		approvalVNumSelect(apprviewer);
		
		function approvalVNumSelect(apprviewer){
			$.ajax({
				url : "/approval/approvalVNumSelect",
				method : "post",
				data : {"apprviewer" : apprviewer},
				dataType : 'json',
				success : function(result){
					approvalVDelete(result);
				}
			});
			
		}
		
		
		function approvalVDelete(data){
			var approval_no = data;
			
			DCService.approvalVRemove(apprviewer, function(result){
				approvalVList(approval_no);// 바꾸기
			});
		}
		
	});
	
	
	
	
	
	
});
