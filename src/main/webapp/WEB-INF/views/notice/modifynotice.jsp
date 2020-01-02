<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ include file = "../common/header.jsp" %>

<style>
.uploadResult {
  width:100%;
 
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color:white;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
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
				<h2>글 수정하기</h2>
			</div>
			<form role="form" action="/meetingboard/modifyMeetingBoard" method="post" class="form-horizontal form-bordered" >
				
				<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum }"/>'>
		        <input type='hidden' name='amount'  value='<c:out value="${cri.amount  }"/>'>
			    <input type='hidden' name='type' 	value='<c:out value="${cri.type    }"/>'>
				<input type='hidden' name='keyword' value='<c:out value="${cri.keyword }"/>'>
				
				<input type="hidden" name="board_no" value='<c:out value="${meetingBoard.board_no }"/>'>
				
				
				<div class="form-group">
					<label class="col-md-3 control-label">작성자</label>
					<div class="col-md-9">
					<p class="form-control-static">${meetingBoard.name }</p>
					<input type="hidden" name="employee_no" value='${employee.employee_no }'>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label" for="example-text-input">제목</label>
					<div class="col-md-6">
						<input type="text" name="title" class="form-control" value='<c:out value="${meetingBoard.title }"/>'>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-3 control-label" for="example-textarea-input">내용</label>
					<div class="col-md-9">
					<textarea name="content" rows="7" class="form-control" ><c:out value="${meetingBoard.content }"/></textarea>
					</div>
				</div>
				
				<div class="form-group form-actions">
					<div class="col-md-9 col-md-offset-3">
						<button type="submit" data-oper='modify' class="btn btn-effect-ripple btn-primary">완료</button>
						<button type="submit" data-oper='list' class="btn btn-effect-ripple btn-danger"   >목록</button>
					</div>
				</div>
				
			</form>
			
			<div class='bigPictureWrapper'>
			  <div class='bigPicture'>
			  </div>
			</div>

			<div class="form-group">
				<label class="col-md-3 control-label" for="example-file-multiple-input">Files</label>
				<div class="col-md-9 uploadDiv">
					<input type="file" name="uploadFile" multiple="multiple">
				</div>
				<div class='uploadResult'> 
		          <ul>
		          
		          </ul>
		        </div>
			</div>
			
			
		</div>
		
	</div>
	
	
	
<script type="text/javascript">
$(document).ready(function(){

	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log("operation");
	    console.log(operation);
	    
	    if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/meetingboard/meetingBoardList").attr("method","get");
	      
	      var pageNumTag = $("input[name='pageNum']").clone();
	      var amountTag = $("input[name='amount']").clone();
	      var keywordTag = $("input[name='keyword']").clone();
	      var typeTag = $("input[name='type']").clone();      
	      
	      formObj.empty();
	      
	      formObj.append(pageNumTag);
	      formObj.append(amountTag);
	      formObj.append(keywordTag);
	      formObj.append(typeTag);	  
	      
	    }else if(operation === 'modify'){
	        
	        console.log("submit clicked");
	        
	        var str = "";
	        
	        $(".uploadResult ul li").each(function(i, obj){
	          
	          var jobj = $(obj);
	          
	          console.dir(jobj);
	          
	          str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	          
	        });
	        formObj.append(str).submit();
        }
    
	    formObj.submit();
	  });
	
});	// document.ready end!


</script>
<script>

$(document).ready(function() {
  (function(){
    
    var board_no = '<c:out value="${meetingBoard.board_no}"/>';
    
    // 수정버튼 눌렀을때 첨부파일 된 파일들 보여준다. 
    $.getJSON("/meetingboard/attachListMeetingBoard", {board_no: board_no}, function(arr){
    
      console.log(arr);
      
      var str = "";


      $(arr).each(function(i, attach){
          
          //image type
          if(attach.fileType){
            var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
            
            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
            str +=" data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
            str += "<span> "+ attach.fileName+"</span>";
            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
            str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            str += "<img src='/displayMeetingBoard?fileName="+fileCallPath+"'>";
            str += "</div>";
            str +  "</li>";
          }else{
              
            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
            str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
            str += "<span> "+ attach.fileName+"</span><br/>";
            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
            str += " class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            str += "<img src='../resources/img/attach.png'></a>";
            str += "</div>";
            str +  "</li>";
          }
       });

      
      $(".uploadResult ul").html(str);
      
    });//end getjson
  })();//end function
  
  // 특정 첨부파일을 삭제 했을 경우, 화면에서만 삭제.
  $(".uploadResult").on("click", "button", function(e){
	    
    console.log("delete file");
      
    if(confirm("Remove this file? ")){
    
      var targetLi = $(this).closest("li");
      targetLi.remove();
    }
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
      contentType: false,data: 
      formData,type: 'POST',
      dataType:'json',
        success: function(result){
          console.log(result); 
		  showUploadResult(result); //업로드 결과 처리 함수 

      }
    }); //$.ajax
    
  });    

  function showUploadResult(uploadResultArr){
	    
    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
    
    var uploadUL = $(".uploadResult ul");
    
    var str ="";
    
    $(uploadResultArr).each(function(i, obj){
		
		if(obj.image){
			var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			str += "<li data-path='"+obj.uploadPath+"'";
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			str +" ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/displayMeetingBoard?fileName="+fileCallPath+"'>";
			str += "</div>";
			str +"</li>";
		}else{
			var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
		    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		      
			str += "<li "
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='../resources/img/attach.png'></a>";
			str += "</div>";
			str +"</li>";
		}

    });
    
    uploadUL.append(str);
  } 
  
});

</script>

</body>
</html>