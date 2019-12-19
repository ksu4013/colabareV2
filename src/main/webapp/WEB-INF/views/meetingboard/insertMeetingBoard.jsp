<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file = "../common/header.jsp" %>
<style>
.uploadResult ul li {
	list-style: none;
	padding: 10px;
}
</style>


	<div id="page-content">
		<div class="content-header">
			<div class="row">
				<div class="col-sm-6">
					<div class="header-section">
						<h1>회의록 게시판</h1>
					</div>
				</div>
				<div class="col-sm-6 hidden-xs">
					<div class="header-section">
						<ul class="breadcrumb breadcrumb-top">
							<li>Extra Pages</li>
							<li><a href="">Blank</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div class="block">
			<div class="block-title">
				<h2>글 작성하기</h2>
			</div>
			<form role="form" action="/meetingboard/insertMeetingBoard" method="post" class="form-horizontal form-bordered" >
				<div class="form-group">
					<label class="col-md-3 control-label">작성자</label>
					<div class="col-md-9">
					<p class="form-control-static">로그인 기능 pull 받은 후 jstl로 하기   </p>
					
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-3 control-label">작성자</label>
					<div class="col-md-9">
						<input type="hidden" name="employee_no" value="1">
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label" for="example-text-input">제목</label>
					<div class="col-md-6">
					<input type="text" name="title" class="form-control" placeholder="제목">
					<!-- <span class="help-block">This is a help text</span> -->
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label" for="example-textarea-input">내용</label>
					<div class="col-md-9">
					<textarea name="content" rows="7" class="form-control" placeholder="내용"></textarea>
					</div>
				</div>
				
				 
				
				<div class="form-group form-actions">
					<div class="col-md-9 col-md-offset-3">
						<button type="submit" class="btn btn-effect-ripple btn-primary">완료</button>
						<button type="reset" class="btn btn-effect-ripple btn-danger">취소</button>
					</div>
				</div>
				
			</form>
			
			
		</div>
		
	</div>
	
	
	<div class="form-group">
				<label class="col-md-3 control-label" for="example-file-multiple-input">파일첨부</label>
				<div class="col-md-9 uploadDiv">
					<input type="file" name="uploadFile" multiple>
				</div>
				<div class='uploadResult'> 
		          <ul>
		          
		          </ul>
		        </div>
			</div>
	
	
<script>
$(document).ready(function(e){
	
	var formObj = $("form[role='form']");
	
	$("button[type='submit']").on("click", function(e){
		
		e.preventDefault();
		
		console.log("submit clicked");
		
		var str = "";
	    
	    $(".uploadResult ul li").each(function(i, obj){
	      
	      var jobj = $(obj);
	      
	      console.dir(jobj);
	      console.log("-------------------------");
	      console.log(jobj.data("filename"));
	      
	      
	      str += "<input type='hidden' name='attachList["+i+"].fileName'   value='" + jobj.data("filename")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uuid'       value='" + jobj.data("uuid")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='" + jobj.data("path")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].fileType'   value='" + jobj.data("type")+"'>";
	    
	  	});
	    
	    console.log(str);
		
	    formObj.append(str).submit();
		
	});
	
	  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	  var maxSize = 5242880; //5MB
	  
	  function checkExtension(fileName, fileSize){
	    
	    if(fileSize >= maxSize){
	      alert("파일 사이즈 초과");
	      return false;
	    }
	    
	    if(regex.test(fileName)){
	      alert("해당 종류의 파일은 업로드할 수 없습니다.");
	      return false;
	    }
	    
	    return true;
	  }
	  
	  
	  $("input[type='file']").change(function(e){

		    var formData = new FormData();
		    
		    var inputFile = $("input[name='uploadFile']");
		    
		    var files = inputFile[0].files;
		    
		    for(var i = 0; i < files.length; i++){

		      if(!checkExtension(files[i].name, files[i].size) ){
		        return false;
		      }
		      formData.append("uploadFile", files[i]);
		      
		    }
		    
		    $.ajax({
		      url: '/uploadMeetingBoard',
		      processData: false, 
		      contentType: false,
			  data:formData, 
			  type: 'POST',
		      dataType:'json',
		        success: function(result){
		          console.log(result); 
		          alert("업로드에이작스");
				  showUploadResult(result); //업로드 결과 처리 함수 

		      }
		    }); //$.ajax
		    
		  }); 
	  
	  
	// 첨부파일의 삭제 처리. x모양 아이콘 클릭할 경우 삭제
	  $(".uploadResult").on("click", "button", function(e){
		    
		    console.log("delete file");
		      
		    var targetFile = $(this).data("file");
		    var type = $(this).data("type");
		    
		    var targetLi = $(this).closest("li");
		    
		    $.ajax({
		      url: '/deleteFileMeetingBoard',
		      data: {fileName: targetFile, type:type},
		      dataType:'text',
		      type: 'POST',
		        success: function(result){
		           alert(result);
		           targetLi.remove();
		         }
		      
		    }); //$.ajax
		     
		    
		});

});	// document.ready 끝

	function showUploadResult(uploadResultArr){
	    
	    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
	    
	    var uploadUL = $(".uploadResult ul");
	    
	    var str ="";
	    
	    $(uploadResultArr).each(function(i, obj){
	    
			//image type
			if(obj.image){
				var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
				str += "<li data-path='"+obj.uploadPath+"'";
				str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'";
				str +" ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' ";
				str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/display?fileName="+fileCallPath+"'>";
				str += "</div>";
				str +"</li>";
				
			}else{
				
				var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
			    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
			      
				str += "<li ";
				str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
				str += "<span> "+ obj.fileName+"</span>";
				str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " ;
				str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
				str += "<img src='/resources/img/attach.png'></a>";
				str += "</div>";
				str +  "</li>";
			} 
			
	    });
	    
	    uploadUL.append(str);
	  }
</script>

</body>
</html>