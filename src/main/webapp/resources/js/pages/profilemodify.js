$(document).ready(function(){
		$('#passbtn').on('click',function() {
			$.ajax({
				url : "/profile/modifypass.do",
				type : 'post',
				data : {"password" : $("#password").val()},
				success : function(result,status,xhr){
					alert("비밀번호가 변경되었습니다.");
					$('#password').val('');
				},
				error: function(xhr,status,er){
					alert("변경에 실패하였습니다.");
				}
			});
		});
		
		$('#greetingbtn').on('click',function() {
			$.ajax({
				url : "/profile/modifygreeting.do",
				type : 'post',
				data : { "employee_greeting" : $("#employee_greeting").val() },
				success : function(result,status,xhr){
					alert("인사말이 변경되었습니다.");
				},
				error: function(xhr,status,er){
					alert("변경에 실패하였습니다.");
				}
			});
		});
		
		$('#modifybtn').on('click',function() {
			$.ajax({
				url : "/profile/modifyreq.do",
				type : 'post',
				data : { "modify_info" : $("#modify_info").val() },
				success : function(result,status,xhr){
					alert("관리자에게 요청되었습니다.");
					$('#modify_info').val('');
				},
				error: function(xhr,status,er){
					alert("요청에 실패하였습니다.");
				}
			});
		});
});