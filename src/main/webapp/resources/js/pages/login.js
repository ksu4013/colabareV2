$(document).ready(function(){
		$('#loginbtn').on('click',function() {
			$.ajax({
				url : "/login/chklogin.do",
				type : 'post',
				data : {"employee_no" : $("#employee_no").val(),
					"password" : $("#password").val()},
				success : function(result,status,xhr){
					alert("로그인에 성공했습니다. ");
					window.location.href = "/login/main.do";
				},
				error:function(xhr,status,er){
					
						$('#fail').empty();
						$('#employee_no').val('');
						$('#password').val('');
						var html="<h6>아이디 혹은 비밀번호가 잘못되었습니다.</h6>";
						$('#fail').append(html);
						
					
				}
			});
		});
});