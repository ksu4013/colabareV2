/**
 * MeetingBoard게시판의 Reply
 */

console.log("MeetingBoard Reply,,,,!!!!!!!!!!!!!!!!!");

var MBReplyService = (function(){
	
	// 댓글 리스트
	function getList(param, callback, error){
		var board_no = param.board_no;
		var page = param.page || 1;
		
		$.getJSON("/mbreplies/pages/" + board_no + "/" + page + ".json",
				function(data){
					if(callback){
						//$('#replyList').empty();
						callback(data.replyCnt, data.list);	// 댓글 숫자와 목록을 가져온다.
					}
		}).fail(function(xhr, status, err){
			if(error){
				error();
			}
		});
	}
	
	// 댓글 삽입
	function add(reply, callback, error){
		console.log("add reply,,,,,,,,,,,,,,!!!!!!!!!!!!!");
		
		$.ajax({
		
			type : 'post',
			url : '/mbreplies/newMBReply',
			data : JSON.stringify(reply),
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
	
	
	// 댓글 삭제
	function remove(reply_no, callback, error){
		$.ajax({
			
			type : 'delete',
			url : '/mbreplies/' + reply_no,
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
	
	
	// 댓글 한 개 조회
	function get(reply_no, callback, error){
		$.post("/mbreplies/" + reply_no + ".json", function(result){
			if(callback){
				callback(result);
			}
			
			
		}).fail(function(xhr, status, err){
			
			if(error){
				error(err);
			}
			
		});
	}
	
	
	
	// 댓글 수정
	function update(reply, callback, error){
		
		
		$.ajax({
				   type : 'put',
					url : '/mbreplies/' + reply.reply_no,
				   data : JSON.stringify(reply),
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	return{ getList : getList,
				add : add,
			 remove : remove,
			    get : get,
			 update : update   };
	
	
	
	
	
	
})();