$(document).ready(function(){
	
	 getempList(1);
	 getreqList();

	var pageNum = 1;
	var employeePage = $("#employeepage");
	 //페이지를 누르면 ajax실행
	 employeePage.on("click","li a", function(e){
	       e.preventDefault();
	       console.log("page click");
	       
	       var targetPageNum = $(this).attr("href");
	       
	       console.log("targetPageNum: " + targetPageNum);
	       
	       pageNum = targetPageNum;
	       
	       getList(pageNum);
	     }); 
	
	    //회원목록 ajax
	    function getempList(page) {
		    
		    $.getJSON('/master/listmem/'+page + ".json",
		        function(data) {
		    		employeeList(data.employeelist)
		    		showPage(data.employeecnt,employeePage)
		        }).fail(function(xhr, status, err) {
		      if (error) {
		    	  alert("회원목록 불러오기 실패!");
		      }
		    });
		  }
	    
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
	    //회원삭제ajax
	    $('body').on('click','#deletemem',function() {
			
			var employee_no=$(this).val()
			$.ajax({
				url : '/master/deletemem.do',
				type : 'post',
				datatype:'json',
				data : {"employee_no":employee_no},
				success : getempList(pageNum)
			});
		});
	    
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
	 //회원 리스트 출력  
	function employeeList(em){
		$('#employeelist').empty();
		for(var i = 0, len = em.length || 0; i < len; i++){
			var html = '<tr id="'+em[i].employee_no+'"><td class="text-center">' + em[i].employee_no + '</td>';
			html += '<td class="text-center">' + em[i].name + '</td>';
			html += '<td><span class="label label-danger">' + em[i].department_name + '</span></td>';
			html += '<td><span class="label label-danger">' + em[i].position_name + '</span></td>';
			html += '<td>' + em[i].e_mail + '</td>';
			html += '<td class="text-center">' + em[i].master + '</td>';
			html += '<td><a href="/master/modifymemform.do?employee_no='+em[i].employee_no+'"><button>수정</button></a></td>';
			html += '<td><button id="deletemem" value="' + em[i].employee_no + '">삭제</button></td>';
			html += '</tr>';
			$('#employeelist').append(html);
		}
	}
	//페이징
    function showPage(employeeCnt,page){
      var endNum = Math.ceil(pageNum / 5.0) * 5;  
      var startNum = endNum - 4; 
      var prev = startNum != 1;
      var next = false;
      
      if(endNum * 5 >= employeeCnt){
        endNum = Math.ceil(employeeCnt/5.0);
      }
      
      if(endNum * 5 < employeeCnt){
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
      
      str += "</ul>";
      page.empty();
      page.append(str);
    }
});

