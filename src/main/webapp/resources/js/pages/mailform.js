 var regex = new RegExp("(.*?)\.(exe|sh}zip|alz)$");
   var maxSize =5242880; //5MB
   
   function checkExtension(fileName, fileSize) {
      if(fileSize>maxSize){
         alert("파일 사이즈 초과");
         return false;
      }
      
      if(regex.test(fileName)){
         alert("해당 종류의 파일은 업로드 할 수 없습니다.");
         return false;
      }
      return true;
   }

$(document).ready(function(){
	
		$('#mailsendbtn').on('click',function() {
			var formData = new FormData();
		    var inputFile = $("input[name='uploadFile']");
		    var files = inputFile[0].files;
		   
		   
		    console.log(files);
		    
		    //add filedate to formdata
		    for(var i = 0; i < files.length; i++){
		       
		       if(!checkExtension(files[i].name, files[i].size)){
		          return false;
		       }
		       
		       formData.append("uploadFile", files[i]);
		    }
		    
		    formData.append("to",$('#to').val());
		    formData.append("content",$('#content').val());
		    formData.append("subject",$('#subject').val());
			$.ajax({
				url : "/mail/sendmail.do",
				processData: false,
		        contentType: false,
				type : 'post',
				dataType:'json',
				data : formData,
				success : function(result,status,xhr){
					alert("메일이 전송되었습니다.");
					$('#to').val('');
					$('#content').val('');
					$('#subject').val('');
					$('#uploadFile').val('');
				},
				error: function(xhr,status,er){
					alert("보내기에 실패하였습니다.");
				}
			});
		});
		
		
});