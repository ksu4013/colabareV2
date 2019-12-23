$(document).ready(function(){
		$('#modifymembtn').on('click',function() {
			var check=[]
			$("input[id='auth']:checked").each(function() {
				  check.push($(this).val())
				})
				jQuery.ajaxSettings.traditional = true;

			$.ajax({
				url : "/master/modifymember.do",
				type : 'post',
				data : {
					"employee_id":$('#employee_id').val(),
					"department_id":$('#department_id option:selected').val(),
					"name":$('#name').val(),
					"position_id":$('#position_id option:selected').val(),
					"master":$('#master option:selected').val(),
					"seclist":check
				} ,
				success : function(data){
					alert("수정되었습니다.");
					location.href = "/master/listmember.do";
				},
				error: function(data){
					alert("수정에 실패하였습니다.");
				}
			});
		});
});