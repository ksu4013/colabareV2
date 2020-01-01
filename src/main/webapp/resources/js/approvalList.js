/**
 * Approval 게시판의 List
 */

console.log("approvalList.js !!!!!!!!!!!!!!!!!!!!!");
var APService = (function(){
	
	
	function reciveList(employee_no, callback, error){
		
		$.ajax({

			url : '/approval/receiveList',
			type : 'post',
			data : {"employee_no" : employee_no},
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
	}
	
	function sentList(employee_no, callback, error){
		
		$.ajax({

			url : '/approval/sentList',
			type : 'post',
			data : {"employee_no" : employee_no},
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
		
	}
	
	function rejectList(employee_no, callback, error){
		
		$.ajax({

			url : '/approval/rejectList',
			type : 'post',
			data : {"employee_no" : employee_no},
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
		
	}
	
	
	function viewList(employee_no, callback, error){
		
		$.ajax({

			url : '/approval/viewList',
			type : 'post',
			data : {"employee_no" : employee_no},
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
		
	}
	
	function doneList(employee_no, callback, error){
		
		$.ajax({

			url : '/approval/doneList',
			type : 'post',
			data : {"employee_no" : employee_no},
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
	}
	

		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	return { reciveList : reciveList,
			   sentList : sentList,
			 rejectList : rejectList,
			   viewList : viewList,
			   doneList : doneList};
	
})();