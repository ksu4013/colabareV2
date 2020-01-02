/**
 *  Document 게시판의 Approvals
 */

console.log("Document 게시판의 Approvals,,,,!!!!!!!!!!!!!!!!!");

var DCService = (function(){
	
	
	
	// 문서 삽입
	function addDoc(docu, callback, error){
		console.log("docu,,,,,,,,,,,,,,!!!!!!!!!!!!!");
		
		$.ajax({
		
			type : 'post',
			url : '/approval/insertApproval',
			data : JSON.stringify(docu),
			contentType : "application/json; charset=utf-8",
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
	}
	
	// 결재자 삽입
	function addApprover(approver, callback, error){
		console.log("approver,,,,,,,,,,,,,,!!!!!!!!!!!!!");
		
		$.ajax({
		
			type : 'post',
			url : '/approval/newApprover',
			data : JSON.stringify(approver),
			contentType : "application/json; charset=utf-8",
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
	}
	
	// 참조자 삽입
	function addApproval(approvalV, callback, error){
		console.log("approvalV,,,,,,,,,,,,,,!!!!!!!!!!!!!");
		
		$.ajax({
		
			type : 'post',
			url : '/approval/newApprovalV',
			data : JSON.stringify(approvalV),
			contentType : "application/json; charset=utf-8",
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
	}
	
	
	// 결재자 리스트
	function approverList(approval_no, callback, error){
		var approval_no = approval_no;
		
		$.ajax({
			type : 'post',
			url : "/approval/approverList/" + approval_no,
			data : {"approval_no" : approval_no},
			dataType : 'json',
			contentType : "application/json; charset=utf-8",
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
		
	} 
	
	// 참조자 리스트
	function approvalVList(approval_no, callback, error){
		var approval_no = approval_no;
		
		$.ajax({
			type : 'post',
			url : "/approval/approvalVList/" + approval_no,
			data : {"approval_no" : approval_no},
			dataType : 'json',
			contentType : "application/json; charset=utf-8",
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
		
	}
	
	
	// 결재자 삭제
	function approverRemove(no, callback, error){
		var no = no;
		
		$.ajax({
			type : 'delete',
			url : '/approval/' + no,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
			
			
		});
	}
	
	// 참조자 삭제
	function approvalVRemove(apprviewer, callback, error){
		var apprviewer = apprviewer;
		
		$.ajax({
			type : 'delete',
			url : '/approval/appV/' + apprviewer,
			success : function(deleteResult, status, xhr){
				if(callback){
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er){
				if(error){
					error(er);
				}
			}
			
			
		});
	}

	// 반려
	function reject(rejectD, callback, error){
		
		$.ajax({
			   type : 'put',
				url : '/approval/reject/' + rejectD.employee_no + '/' + rejectD.approval_no,
			   data : JSON.stringify(rejectD),
		contentType : "application/json; charset=utf-8",
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
		
	}
	
	
	// 결재 버튼
	function pass(passD, callback, error){
		
		$.ajax({
			   type : 'put',
				url : '/approval/pass/' + passD.employee_no + '/' + passD.approval_no,
			   data : JSON.stringify(passD),
		contentType : "application/json; charset=utf-8",
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
		
		
		
		
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	return{          addDoc : addDoc,
		        addApprover : addApprover,
		       approverList : approverList,
		     approverRemove : approverRemove,
		        addApproval : addApproval,
		      approvalVList : approvalVList,
		    approvalVRemove : approvalVRemove,
		             reject : reject,
		               pass : pass
		    
	};
	
	
	
	
	
	
	
})();