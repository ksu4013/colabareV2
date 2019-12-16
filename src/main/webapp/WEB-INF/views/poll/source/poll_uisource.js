$(function(){
	if ($('.multiple').text('1')) {
		$('.multiple').text('다중 선택 : X');
	}	 else {
		$('.multiple').text('다중 선택 : 불허');
	}
});

//$(function() {
//	$('.itemButton').hover(function() {
//		$(this).addClass('hover');
//	}, function() {
//		$(this).removeClass('hover');
//	});
//});


//버튼을 클릭하면 하나씩 아래의 input에 입력됨
//두번클릭하면 입력된 값을 없에야됨
//다중선택시 여러가지 선택
//단일선택시 하나 클릭후 다른 값 없엠
$(function(){

	$('.itemList .itemButton').on('click',function(){
		// 다중 선택=1
				//추가
		$('.itemButton').removeClass('itemclick');
		$(this).addClass('itemclick');
		//
		var ButtonID = $(this).attr('id');
		var inum = ButtonID.substring(ButtonID.length-1);
		
		var itemnumID = "#itemNum_"+inum;
		var item_num = $(itemnumID).attr('value');
		
		
		var qnum = ButtonID.substring(ButtonID.length-3, ButtonID.length-2);
		var id = "#userinput_" + qnum;
		$(id).attr('value', item_num);
		
//		var qnumID = "#userinputQnum_"+qnum;
//		if ($('.userselectQ').is(qnumID)) {
//			$(qnumID).attr('value',qnum);
//		} else{
//			$(id).after('<br><input type="text" class="userselectQ"'
//					+'id="userinputQnum_'+qnum+'" name="poll_question_num"'
//					+'value="'+item_num+'">');
//		}
		
		
		//<input type="hidden" class="userselect" id="userinput_${qnum.count }" name="poll_select_num">
	});
	
});

//$(function() {
//	$('#switcher .button').on('click', function() {
//		$('.button').removeClass('selected');
//		$(this).addClass('selected');
//		$('body').removeClass();
//		if (this.id == 'switcher-large') {
//			$('body').addClass('large');
//		} else if (this.id == 'switcher-narrow') {
//			$('body').addClass('narrow');
//		}
//	});
//});


//테스트 구역
//$(function(){
//});

