<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file = "../common/header.jsp" %>

<style type="text/css">
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
  color: black;
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

	
	
        

           

     <!-- Page content -->
     <div id="page-content">
         <!-- Article Header -->
         <div class="content-header">
             <div class="header-section clearfix">
                 <a href="javascript:void(0)" class="pull-right">
                     <img src="../resources/img/placeholders/avatars/avatar4.jpg" alt="Avatar" class="img-circle">
                 </a>
                 <h1>${meetingBoard.title }</h1>
                 <h2>${meetingBoard.name }</h2>
                 	<button data-oper='list' type="button" class="btn btn-effect-ripple btn-primary" style="overflow: hidden; position: relative;">목록</button>
                <c:if test="${employee.employee_no == meetingBoard.employee_no}"> 
                 	<button data-oper='modify' type="button" class="btn btn-effect-ripple btn-info"    style="overflow: hidden; position: relative;">수정</button>
                 	<button data-oper='remove' type="submit" class="btn btn-effect-ripple btn-danger"  style="overflow: hidden; position: relative;">삭제</button>
             	</c:if>
             </div>
         </div>
         
         <form action="/meetingboard/modifyMeetingBoard" id='operForm' method="get">
         	<input type="hidden" id="board_no" name="board_no" value='<c:out value="${meetingBoard.board_no }"/>'>
         	<input type="hidden" name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
         	<input type="hidden" name='amount' value='<c:out value="${cri.amount}"/>'>
         	<input type="hidden" name='keyword' value='<c:out value="${cri.keyword}"/>'>
         	<input type="hidden" name='type' value='<c:out value="${cri.type}"/>'>  
         </form>
         <!-- END Article Header -->

         <!-- Article Content -->
         <div class="row">
             <div class="col-md-10 col-md-offset-1 col-lg-8 col-lg-offset-2">
                 <!-- Article Block -->
                 <div class="block">
                     <!-- Article Title -->
                     <div class="block-title">
                         <div class="block-options pull-right">
                             <a href="javascript:void(0)" class="btn btn-effect-ripple btn-warning" data-toggle="tooltip" title="Add to favorites"><i class="fa fa-star"></i></a>
                             <a href="javascript:void(0)" class="btn btn-effect-ripple btn-success" data-toggle="tooltip" title="Add bookmark"><i class="fa fa-bookmark"></i></a>
                             <a href="javascript:void(0)" class="btn btn-effect-ripple btn-danger" data-toggle="tooltip" title="Love it"><i class="fa fa-heart"></i></a>
                         </div>
                         <h2><i class="fa fa-clock-o"></i> ${meetingBoard.write_date }</h2>
                     </div>
                     <!-- END Article Title -->

                     <!-- Article Content -->
                     <article class="article-story">
                         <p>${meetingBoard.content }</p>
                     </article>
                     <hr>
                      <div class="block-section text-center">Files
                         <div class='uploadResult'> 
				          <ul>
				          </ul>
				        </div>
                     </div>
                     
                     <!-- END Article Content -->
                 </div>
                 <!-- END Article Block -->

                 <!-- Comments Block -->
                 <div class="block">
                     <!-- Comments Title -->
                     <div class="block-title">
                         <h2><i class="fa fa-comments"></i> 댓글 ( ${meetingBoard.replyCnt } )</h2>
                     </div>
                     <!-- END Comments Title -->

                     <!-- Comments Content -->
                     <ul class="media-list" id="replyList">
                     
                     </ul><!-- END Comments Content -->
                     <div class="panel-footer"> <!-- 댓글 페이징 버튼  -->
                 	 </div>
                  </div>
                     
                     
                 <!-- END Comments Block -->
					
				
				





                 <!-- Add Comment Block -->
                 <div class="block">
                     <!-- Add Comment Title -->
                     <div class="block-title">
                         <h2><i class="fa fa-plus"></i> 댓글</h2>
                     </div>
                     <!-- END Add Comment Title -->

                     <!-- Add Comment Content -->
                     <form method="post" class="form-horizontal" >
                         
                         <div class="form-group">
                         	<div class="col-xs-6">
                                <input type="hidden" name = "board_no"    value ="${meetingBoard.board_no }">
								<input type="hidden" name = "employee_no" value ="${meetingBoard.employee_no }" >
                         	</div>
                         </div>
                         
                         <div class="form-group">
                             <div class="col-xs-12">
                                 <textarea id="content" name="content" class="form-control" rows="5" placeholder="Comment.."></textarea>
                                 <!-- <input id="content" class="form-control" rows="5" placeholder="Comment.." name='content'> -->
                             </div>
                         </div>
                         
                         <div class="form-group">
                             <div class="col-xs-12">
                                 <button type="button" data-oper='insert' class="btn btn-effect-ripple btn-primary"><i class="fa fa-pencil"></i>&nbsp; 댓글 작성</button>
                             </div>
                         </div>
                         
                     </form>
                     <!-- END Add Comment Content -->
                 </div>
                 <!-- END Add Comment Block -->
                 
                 
                 
                 
                 
             </div>
         </div>
         <!-- END Article Content -->
     </div>
     <!-- END Page Content -->
     
     <div class='bigPictureWrapper'>
	  <div class='bigPicture'>
	  </div>
	</div>

<script type="text/javascript" src="../resources/js/mbReply.js"></script>               
<script type="text/javascript">
	$(document).ready(function(){
		
		var operForm = $("#operForm"); 
		
		$("button[data-oper='modify']").on("click", function(e){
			
			operForm.submit();
			
		});
		
		$("button[data-oper='remove']").on("click", function(e){
			
			operForm.attr("action", "/meetingboard/deleteMeetingBoard").submit();
			
		});
		
		
		var board_no = '<c:out value="${meetingBoard.board_no}"/>';
		
		$.getJSON("/meetingboard/attachListMeetingBoard", {board_no: board_no}, function(arr){
	        
	       console.log(arr);
	       
	       var str = "";
	       
	       $(arr).each(function(i, attach){
	       
	         //image type
	         if(attach.fileType){
	           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
	           
	           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
	           str += "<img src='/displayMeetingBoard?fileName="+fileCallPath+"'>";
	           str += "</div>";
	           str +"</li>";
	         }else{
	             
	           str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
	           str += "<span> "+ attach.fileName+"</span><br/>";
	           str += "<img src='../resources/img/attach.png'></a>";
	           str += "</div>";
	           str +"</li>";
	         }
	       });
	       
	       $(".uploadResult ul").html(str);
	       
	       
	     }); //end getjson
		
		
		$("button[data-oper='list']").on("click", function(e){
		    
		    operForm.find("#board_no").remove();
		    operForm.attr("action","/meetingboard/meetingBoardList")
		    operForm.submit();
		    
		  });
	     
	     
		$(".uploadResult").on("click","li", function(e){
		      
		    console.log("view image");
		    
		    var liObj = $(this);
		    
		    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
		    
		    if(liObj.data("type")){
		    	
		      showImage(path.replace(new RegExp(/\\/g),"/"));
		      
		    }else {
		    	
		      //download 
		      self.location ="/downloadMeetingBoard?fileName="+path
		    }
		    
		    
		  });
		
		$(".bigPictureWrapper").on("click", function(e){
			  
		    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
		    
		    setTimeout(function(){ $('.bigPictureWrapper').hide(); }, 1000);
		  });
		
		
		
		//////////////////////////////////////////////////////////////////////////댓글////////////////////////////////////////////////////////
		
		// 댓글 리스트 함수
		var board_no = '<c:out value="${meetingBoard.board_no }"/>';
		var replyUL = $("#replyList");
		
		showList(1);
		
		function showList(page){
			
			$('#replyList').empty();
			console.log("show list " + page);
			
			MBReplyService.getList({board_no : board_no, page: page || 1}, function(replyCnt, list){
				console.log("replyCnt: "+ replyCnt );
		        console.log("list: " + list);
		        console.log(list);
		        
		        if(page == -1){
		        	pageNum = Math.ceil(replyCnt/10.0);
		        	showList(pageNum);
		        	return;
		        }
		        
		        var str = "";
		        
		        if(list == null || list.length == 0){
		        	return;
		        }
		        
		        for(var i = 0 , len = list.length || 0 ; i < len; i++){
		        	str += "<li class='media' id=rp" + list[i].reply_no + ">";
		        	str += "    <a href='javascript:void(0)' class='pull-left'>";
		        	str += "        <img src='../resources/img/placeholders/avatars/avatar12.jpg' alt='Avatar' class='img-circle'>";
		        	str += "    </a>";
		        	str += "     <div class='media-body'>";
		        	str += "         <a href='javascript:void(0)'><strong>" + list[i].name + "</strong></a>";
		        	str += "         <span class='text-muted'><small><em>" + list[i].write_date + "</em></small></span>";
		        	str += "         <p>" + list[i].content + "</p>";
		        	str += '		 <button type="button" class="btn btn-rounded btn-primary" id = "updateFormReply" value = "' + list[i].reply_no + '">수정</button>';
		        	str += '		 <button type="button" class="btn btn-rounded btn-info"    id = "deleteReply"     value = "' + list[i].reply_no + '">삭제</button>';
		        	str += '		 <button type="button" class="btn btn-rounded btn-default" id = "commentReply"    value = "' + list[i].reply_no + '">대댓</button>';
		        	str += "     </div>";
		        	str += "</li>";
		        	
		        }
		        replyUL.html(str);
		        
		        showReplyPage(replyCnt);
			});
			
		}
		
		
		var pageNum = 1;
	    var replyPageFooter = $(".panel-footer");
	    
	    // 댓글 페이징
	    function showReplyPage(replyCnt){
	      
	      var endNum = Math.ceil(pageNum / 10.0) * 10;  
	      var startNum = endNum - 9; 
	      
	      var prev = startNum != 1;
	      var next = false;
	      
	      if(endNum * 10 >= replyCnt){
	        endNum = Math.ceil(replyCnt/10.0);
	      }
	      
	      if(endNum * 10 < replyCnt){
	        next = true;
	      }
	      
	      var str = "<ul class='pagination pull-right'>";
	      
	      if(prev){
	        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
	      }
	      
	       
	      
	      for(var i = startNum ; i <= endNum; i++){
	        
	        var active = pageNum == i? "active":"";
	        
	        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
	      }
	      
	      if(next){
	        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
	      }
	      
	      str += "</ul></div>";
	      
	      console.log(str);
	      
	      replyPageFooter.html(str);
	    }
		
	    // 페이지 버튼
	    replyPageFooter.on("click","li a", function(e){
	        e.preventDefault();
	        console.log("page click");
	        
	        var targetPageNum = $(this).attr("href");
	        
	        console.log("targetPageNum: " + targetPageNum);
	        
	        pageNum = targetPageNum;
	        
	        showList(pageNum);
	      }); 
	    
	    var employee_no = '<c:out value="${meetingBoard.employee_no}"/>';
	    
	    
	    // 댓글 삽입
	    $("button[data-oper='insert']").on("click", function(e){
	    	var content = $('#content').val();

	    	
	    	var reply = {
	    					board_no : board_no,
	    					employee_no : employee_no,
	    					content : content };
	    	
	    	MBReplyService.add(reply, function(result){
	    		alert(result);
	    		$('#content').val('');
	    		showList(-1);
	    	});
	    					
	    	
	    });
	    
	    
	   // 댓글 삭제 deleteReply
	   $(".block").on("click", "#deleteReply", function(){
		   
		   var reply_no = $(this).val();
		   
		   MBReplyService.remove(reply_no, function(result){
			   
			   alert(result);
			   //showList(-1);
			   showList(pageNum);
		   });
		   
	   });
	   
	   
		// 댓글 수정 폼 이동
		$(".block").on("click", "#updateFormReply", function(){
			
			var reply_no = $(this).val();
			
			 MBReplyService.get(reply_no, function(list){
				
				var str = "";
				
				str += "<li class='media' id=rp" + list.reply_no + ">";
	        	str += "    <a href='javascript:void(0)' class='pull-left'>";
	        	str += "        <img src='../resources/img/placeholders/avatars/avatar12.jpg' alt='Avatar' class='img-circle'>";
	        	str += "    </a>";
	        	str += "     <div class='media-body'>";
	        	str += "         <a href='javascript:void(0)'><strong>" + list.name + "</strong></a>";
	        	str += "         <span class='text-muted'><small><em>" + list.write_date + "</em></small></span>";
	        	str += "         <p><textarea class='form-control' rows='5' name='editContent' id='editContent' >" + list.content + "</textarea></p>";
	        	str += '		 <button type="button" class="btn btn-rounded btn-primary" id = "updateReply"  value = "' + list.reply_no + '">완료</button>';
	        	str += '		 <button type="button" class="btn btn-rounded btn-info"    id = "cancelReply"  value = "' + list.reply_no + '">취소</button>';
	        	str += "     </div>";
	        	str += "</li>";
				
				$('#rp' + list.reply_no).replaceWith(str);
				$('#rp' + list.reply_no + '#editContent').focus();
			});
			
		});
		
		// 댓글 수정폼 함수
		/* function editReply(data){
			
			var str = "";
			
			$.each(JSON.parse(data), function(index, list){
				
				str += "<li class='media' id=rp" + list.reply_no + ">";
	        	str += "    <a href='javascript:void(0)' class='pull-left'>";
	        	str += "        <img src='../resources/img/placeholders/avatars/avatar12.jpg' alt='Avatar' class='img-circle'>";
	        	str += "    </a>";
	        	str += "     <div class='media-body'>";
	        	str += "         <a href='javascript:void(0)'><strong>" + list.name + "</strong></a>";
	        	str += "         <span class='text-muted'><small><em>" + list.write_date + "</em></small></span>";
	        	str += "         <p><textarea name='editContent' id='editContent' >" + list.content + "</textarea></p>";
	        	str += '		 <button type="button" class="btn btn-rounded btn-primary" id = "updateFormReply" value = "' + list.reply_no + '">수정</button>';
	        	str += '		 <button type="button" class="btn btn-rounded btn-info"    id = "deleteReply"     value = "' + list.reply_no + '">삭제</button>';
	        	str += '		 <button type="button" class="btn btn-rounded btn-default" id = "commentReply"    value = "' + list.reply_no + '">대댓</button>';
	        	str += "     </div>";
	        	str += "</li>";
				
				$('#rp' + list.reply_no).replaceWith(str);
				$('#rp' + list.reply_no + '#editContent').focus();
			
			});
			
		} */
		
		
	
		// 댓글 수정 취소버튼 시 리스트 출력. 에이작스로 다시 처리
		$('.block').on('click', '#cancelReply', function(){
			
			/* MBReplyService.getList({board_no : board_no, page: 1}, function(result){
	    		showList(1);
	    	}); */
	    	
	    	var Rpage = $(".panel-footer").find(".page-link").attr('href');
			
			 $.ajax({
				url : '/mbreplies/pages/' + board_no + "/" + Rpage + ".json",
				type : 'post',
				datatype : 'json',
				data : {"board_no" : board_no, "page" : Rpage},
				success : showList(Rpage),
				error : function(request, status, error){
					alert("code = " + request.status + "message = " + request.responseText + "error = " + error);
				}
			}); 
			
		});
		
		
		// 댓글 수정 완료
		$('.block').on('click', '#updateReply', function(){
			var reply_no = $(this).val();
			var content = $('#editContent').val();
			
			alert(reply_no);
			alert(content);
			
			var reply = {reply_no : reply_no, content : content};
			
			MBReplyService.update(reply, function(result){
	   	        
		   	    alert(result);
		   	    showList(pageNum);
		   	    
		   	  });
			
		});
		
	    
	
	    
	    
		
	});	// document.ready 끝
	
	
	
	
	function showImage(fileCallPath){
	    
	    alert(fileCallPath);
	    
	    $(".bigPictureWrapper").css("display","flex").show();
	    
	    $(".bigPicture").html("<img src='/displayMeetingBoard?fileName="+fileCallPath+"' >").animate({width:'100%', height: '100%'}, 1000);
	    
	  }
</script>
</body>
</html>