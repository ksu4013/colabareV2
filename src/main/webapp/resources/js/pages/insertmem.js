$(document).ready(function(){
		$('#insertmembtn').on('click',function() {
			$.ajax({
				url : "/master/insertmember.do",
				type : 'post',
				data : {
					"employee_no":$('#employee_no').val(),
					"department_id":$('#department_id option:selected').val(),
					"name":$('#name').val(),
					"e_mail":$('#e_mail').val(),
					"password":$('#password').val(),
					"position_id":$('#position_id option:selected').val(),
					"master":$('#master option:selected').val(),
				} ,
				success : function(result,status,xhr){
					alert("등록되었습니다.");
					$('#employee_no').val('');
					$('#departmen_id').val('');
					$('#name').val('');
					$('#e_mail').val('');
					$('#password').val('');
					$('#position_id').val('');
					$('#master').val('');
				},
				error: function(xhr,status,er){
					alert("등록에 실패하였습니다.");
				}
			});
		});
});