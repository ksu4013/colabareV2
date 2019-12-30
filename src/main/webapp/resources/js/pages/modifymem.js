$(document).ready(function(){
	
	 
	 getreqList();

	    
	    //요구목록 ajax
	    function getreqList(){
	    	$.getJSON('/master/listreq.do',
			        function(data) {
			    		reqList(data)
			        }).fail(function(xhr, status, err) {
			      if (error) {
			        alert("수정요청 불러오기 실패!");
			      }
			    });
	    }
	    
	    
	    //요구삭제 ajax
	    $('body').on('click','#deletereq',function() {
			
			var modify_no=$(this).val()
			$.ajax({
				url : '/master/deletereq.do',
				type : 'post',
				datatype:'json',
				data : {"modify_no":modify_no},
				success : getreqList()
			});
		});

	    //요구 리스트 출력
		function reqList(re){
			$('#requestlist').empty();
			for(var i = 0, len = re.length || 0; i < len; i++){
				var html ='<li class="media" id='+re[i].modify_no+'>';
				html+='<a class="pull-left">'+re[i].modify_no+'</a>';
				html +='<div class="media-body">'
	            html +='<p class="push-bit"><span class="text-muted pull-right"></span><small>'+re[i].employee_no+'</small></p>';
				html +='<h4><strong>'+ re[i].modify_info + '</strong></h4>';
	            html+='<p>' + re[i].request_date + '</p>';
	            html+='<p><a href="/master/modifymemform.do?employee_no='+re[i].employee_no+'"><button>수정</button></a>';
	            html+='<button id="deletereq" value="' + re[i].modify_no + '">삭제</button></p>';
	            html+='</div></li>';
			$('#requestlist').append(html);
			}
		}
	 
});

