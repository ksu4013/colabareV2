$(document).ready(function(e){
	//question 늘어나는 코드
	$('#addquestion').click('click','*',function(){
		$('.question').after("<div class='question'><label>질문 내용</label><br>"
							+ "<textarea rows='5' cols='20' class='question' name='poll_question_text' >ss</textarea>"
							+ "<div class='item_list'><div><input class='item' name='poll_item_text0' value='항목1'>"
							+ "<button>삭제</button><br></div ><div id='asdlkjfe'><input class='item' name='poll_item_text0' value='항목2'>"
							+ "<button>삭제</button><br></div></div><div><div><button id='add_item'>항목 추가</button></div>"		
							+ "</div><!-- <div><label>응답자 옵션 추가</label> <input type='checkbox' name='db없음'></div> -->"	
							+ "<div><label>중복 선택 허용</label> <input type='checkbox' name='poll_multiple' checked='checked'>"	
							+ "</div></div>")		
							return false;
	});
	
	
	
	
	
	
	//item 늘어나는 코드
	
	
	
	
	//submit 클릭시 이벤트
	
	$('#transmit').on('click','')
});