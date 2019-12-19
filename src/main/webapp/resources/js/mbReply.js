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
			url : '/replies/newMBReply',
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
				add : add      };
	
	
	
	
	
	
})();