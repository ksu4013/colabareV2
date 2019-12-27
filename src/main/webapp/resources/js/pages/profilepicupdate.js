
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
   
   var uploadResult = $(".uploadResult ul");
   
   
   // 원본이미지 보여주기
   function showUploadedFile(profilepic){
	   alert("여기?")
	   var str = "";
	   $('#profileimg').empty();
	    
	     if(profilepic.image){
	       
	       var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
	       
	       var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
	       
	       str += '<img src='+obj.fileName+' alt="avatar" class="img-circle img-thumbnail img-thumbnail-transparent img-thumbnail-avatar-2x push">';
	       
	           
	     }
	     if(profilepic=null){
	    	 str += '<img src="/resources/img/placeholders/avatars/avatar13@2x.jpg" alt="avatar" class="img-circle img-thumbnail img-thumbnail-transparent img-thumbnail-avatar-2x push">'

		           
		     }

	    	 
	   $('#profileimg').append(str);
	}
   
	function showImage(fileCallPath){
		  
		  //alert(fileCallPath);
		
		  $(".bigPictureWrapper").css("display","flex").show();
		  
		  $(".bigPicture")
		  .html("<img src='/display?fileName="+fileCallPath+"'>")
		  .animate({width:'100%', height: '100%'}, 1000);

		}
   
   
   
   ///////////////////////////////////////////////////////////////////
   $(document).ready(function(){
	   
	   var cloneObj = $(".uploadDiv").clone();
	   
	   
	   // x 표시에 대한 이벤트 처리. 첨부파일 삭제 위해 Ajax를 통해 첨부파일의 경로와 이름, 파일의 종류 전송
	   $(".uploadResult").on("click","span", function(e){
		   
			  var targetFile = $(this).data("file");
			  var type = $(this).data("type");
			  console.log(targetFile);
			  
			  $.ajax({
			    url: '/deleteFile',
			    data: {fileName: targetFile, type:type},
			    dataType:'text',
			    type: 'POST',
			      success: function(result){
			         alert(result);
			       }
			  }); //$.ajax
			  
			});
	   
	   // 그림을 다시 한 번 클릭하면 사라지는 이벤트
	   $(".bigPictureWrapper").on("click", function(e){
			  $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
			  setTimeout(() => {
			    $(this).hide();
			  }, 1000);
			});
	   
	   
	   
	   
      $("#uploadBtn").on("click", function(e){
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
       $.ajax({
          		  url: '/profile/uploadProfilePic.do',
          processData: false,
          contentType: false,
           		 data: formData,
          		 type: 'POST',
          	 dataType:'json',
          	  success: function(result,status,xhr){
          		  			alert(result);
		                   showUploadedFile(result);
		                }
             }); //$.ajax
      
          }); 
      
       });