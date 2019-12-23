$(document).ready(function(){
		$('#mailsendbtn').on('click',function() {
			$.ajax({
				url : "/mail/sendmail.do",
				type : 'post',
				data : $('#mailform').serialize(),
				success : function(result,status,xhr){
					alert("메일이 전송되었습니다.");
					$('#to').val('');
					$('#content').val('');
					$('#subject').val('');
				},
				error: function(xhr,status,er){
					alert("보내기에 실패하였습니다.");
				}
			});
		});
		
		
});