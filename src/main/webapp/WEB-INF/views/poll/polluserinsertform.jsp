<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script type="text/javascript" src="/resources/js/vendor/jquery-3.3.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 
<link rel="stylesheet" href="./css/polluserinsertcss.css" type="text/css" >
<script type="text/javascript" src="./source/poll_uisource.js"></script>
 -->
</head>
<body>
<%@ include file = "../common/header.jsp" %>
<div id="id">
	<h3>설문조사</h3>
</div>
	<div>
		<div>
			<div class="side">
				<a href="/poll/pollinsertform">
					<button name="pollinsertform">설문 등록</button>
				</a> <br> 
				<a href="/poll/polllistform">
					<button name="ingpoll">진행중인 설문</button>
				</a> <br>
				<button name="endpoll">끝난 설문</button>
				<br>
			</div>
		</div>
	</div>
	<div>
		<div id="paper">	
			<div class="pollform">
				<div class="pollinfo">
					<h4>${poll.pollVO.poll_num }번 설문 입니다.</h4>
					<label>부서: ${poll.pollVO.department_name }</label><br>
					<div>내용: ${poll.pollVO.poll_contents }</div>
				</div>
				<c:choose>
					<c:when test="${employee.employee_no eq poll.answer[0].employee_no }">
						<form action="polluserupdate" name="form" method="post">
					</c:when>
					<c:when test="${employee.employee_no ne poll.answer[0].employee_no }">
						<form action="polluserinsertform" name="form" method="post">
					</c:when>
				</c:choose>
				<input type="hidden" name="poll_num" value="${poll.pollVO.poll_num }">
				<input type="hidden" name="employee_no" value="${employee.employee_no }">
				<input type="hidden" name="poll_joiner_num" value="${poll.answer[0].poll_joiner_num }">
				 
				<c:forEach var="answer" items="${poll.answer }" varStatus="ansnum">
					<input type="hidden" name="poll_answer_num" value="${answer.poll_answer_num}">
					<input type="hidden" id="getanswerI_${ansnum.count }" class="getanswerC" value="${answer.poll_select_num }">
				</c:forEach>
				<c:forEach var="qilist" items="${poll.qilist }" varStatus="qnum">
			 		<div class="questionTab">
						<div id="q_text_${qnum.count }"	>
							<br>${qilist.question.poll_question_text }
						</div>
						<div id="q_multiple_${qnum.count }" class="multiple">
							<input type="hidden" id="qm_${qilist.question.poll_num_question_num }" value="${qilist.question.poll_multiple}">
							
							<div id="q_multiple_${qnum.count }" class="multiple">다중선택 : <label>
								<c:choose>
									<c:when test='${qilist.question.poll_multiple eq "1".charAt(0)}'>불허</c:when>
									<c:when test='${qilist.question.poll_multiple eq "2".charAt(0)}'>허용</c:when>
								</c:choose>
							</label>
							</div>
						</div>
						<!-- 단일 다중 판단 -->
						<div class="itemList" id="Ilist_${qnum.count }">
							<c:forEach var="items" items="${qilist.item }" varStatus="inum">
								
								<input type="hidden" id="itemNum_${qilist.question.poll_num_question_num}_${inum.count}" 
									name="poll_item_num_${qilist.question.poll_num_question_num -1}" class="itemidc_${qilist.question.poll_num_question_num}" 
									value="${items.poll_item_num }">
								<div class="itemButton itemButton_${qilist.question.poll_num_question_num} button_${items.poll_item_num}" 
									id="itemLS_${qilist.question.poll_num_question_num}_${inum.count}" >${items.poll_item_text }</div>
								<br>
							</c:forEach>
								
							<c:forEach var="itemnum" items="${qilist.item }" varStatus="selectnum">
							
							<input type="hidden" class="userselectI_${qilist.question.poll_num_question_num}" 
							id="userinput_${qnum.count }_${selectnum.count}" name="poll_select_num_${qilist.question.poll_num_question_num -1}" value="0"><br>
							<input type="hidden" class="userselectQ" id="userinputQnum_${qnum.count }" 
							name="poll_question_num_${qilist.question.poll_num_question_num -1}" value="${qilist.question.poll_question_num }"><br>
							</c:forEach>
							<br>
							<div class="qtag_${qilist.question.poll_num_question_num }">
							<%-- <c:choose>
							<c:when test='${qilist.question.poll_multiple eq "1".charAt(0)}'> --%>
							
							<%-- </c:when>
							<c:when test='${qilist.question.poll_multiple eq "2".charAt(0)}'> --%>
							<%-- qID값 전달값[questionNum]<input type="text" class="userselectQ" id="Qnum_${qnum.count }" name="" value="${qilist.question.poll_question_num }">
							</c:when>
							</c:choose> --%>
							</div>
						</div>
					</div>
					<input type="hidden" name="question_size" value="0">
				</c:forEach>
				<div class="subutton">
					<input class="submitButton" type="submit" 
					<c:choose>
					<c:when test="${employee.employee_no eq poll.answer[0].employee_no }">
						value="설문 수정"
					</c:when>
					<c:when test="${employee.employee_no ne poll.answer[0].employee_no }">
						value="설문 제출"
					</c:when>
					
				</c:choose>
					>
				</div>
				<c:if test="${employee.employee_no eq  poll.pollVO.poll_writer}">
					<div id="formdeletebutton">
						설문 삭제
					</div>
					<div id="formupdatebutton">
						작성자 수정 버튼
					</div>
				</c:if>
				
				</form>
				<br>
			</div>
		</div>
		<br><br>
	</div>
</body>
</html>


<script>

$(document).ready(function(){
	
 	
	$(function() {
		$('.itemButton').hover(function() {
			$(this).addClass('hover');
		}, function() {
			$(this).removeClass('hover');
		});
	});

	
//버튼을 클릭하면 하나씩 아래의 input에 입력됨
//두번클릭하면 입력된 값을 없에야됨
//다중선택시 여러가지 선택
//단일선택시 하나 클릭후 다른 값 없엠
$(function(){
	
	$('.itemButton').on('click',function(){
		
		//클릭한 버튼 ID
		var ButtonID = $(this).attr('id');

		//버튼ID의 풀번호 ex(1-1)
		var inum = ButtonID.substring(ButtonID.length-3);
		//선택한 버튼의 질문순서번호(pnqn) 가운데 단일 번호
		var qnum = ButtonID.substring(ButtonID.length-3, ButtonID.length-2);
		//선택한 아이템의 ID값이 있는 태그선택
		var itemID = "#itemNum_"+inum;
		//ID값 태그의 밸류값 선택
		var item_value = $(itemID).attr('value');
		//select 클릭한 버튼의 id와 번호와 같은  select아이디번호   
		var chid = "#userinput_" + inum;

		var mulpichoID = "#qm_"+qnum;
		
		
		// 단일 선택=1
		//$(mulpichoID == '1')
		if ($(mulpichoID).attr('value') == '1') {
			
			//질문 번호가 같은 버튼의 클래스 선택하고 클릭클래스 제거
			var itembuttonNum = ".itemButton_"+qnum;
			$(itembuttonNum).removeClass('itemclick');
			//추가
			$(this).addClass('itemclick');
			
			
			//선택한 태그에 먼저 이름속성 제거하고, 새로운 태그에 이름 속성 달기 > 전달값 선택	//수정 모든 태그에 이름 적용함.
			//var itemidc = ".itemidc_"+qnum;
			//$(itemidc).removeAttr('name');
			//$(itemID).attr('name','poll_item_num_'+(qnum-1));
			
			
			//단일 선택은 1번만 선택하여 하나의 값만 저장	//수정 먼저 모두 0을 만들고 클릭한것만 값 넣어주기
			var uselect = ".userselectI_"+qnum;
			$(uselect).attr('value',0);
			//var oneid = "#userinput_" + qnum + "_1";
			var oneid = "#userinput_" + inum;
			//전달값에 아이템ID값 입력
			$(oneid).attr('value', item_value); 
		}
		// 다중선택 =2;
		else if ($(mulpichoID).attr('value') == '2') {
			
			var qtag = ".qtag_"+qnum;
			var qtaglast = ".qtag_"+qnum+":last";
			var qid = "#Qnum_"+qnum;
			var QID = $(qid).attr('value');
			
			
			//다시 클릭한거라면
			if ($(this).hasClass('itemclick')) {	
				//클릭한 버튼에 클릭클래스가 있으면 클릭클래스 제거
				$(this).removeClass('itemclick');
				
				//선택한 태그에 이름속성 제거	//수정: 이름속성 모두 적용 
				//$(itemID).removeAttr('name');
				
				//value값 삭제 //수정 : 값을 0으로 바꾼다.
				//$(chid).removeAttr('value');
				$(chid).attr('value', 0); 
				
				/* //반복선택시 qid삭제
				$(qtag).children(":last").remove(); */
			} 
			//처음 클릭이라면
			else {
					//버튼에 클래스 추가
					$(this).addClass('itemclick');
					//, 새로운 태그에 이름 속성 달기 > 전달값 선택	//수정: 이름속성 모두 적용 
					//$(itemID).attr('name','poll_item_num_'+(qnum-1));
					
					//전달값에 아이템ID값 value입력
					$(chid).attr('value', item_value); 
					/* //qid값 선택한만큼 생성
					$(qtag).append("<input type='text' class='userselectQ' id='userinputQnum_"+qnum 
							+ "' name='poll_question_num_"+(qnum-1)+"' value='"+QID+"'>"); */
			}
		}
	});
	//저장된 응답번호 불러와 클릭해주기
	if ($('.getanswerC').length != 0) {
		var lennum = $('.getanswerC').length;
		for (var i = 1; i <= lennum; i++) {
			var id = "#getanswerI_"+i;
			var rid = $(id).attr('value');
			var bcl = ".button_"+rid;
			$(bcl).trigger("click");
		}
	}

});

});




</script>


<style>
input {
	color: blue;
	width: 100px;
}

#id {
	color: white;
	width: 615px;
	height: 100px;
	margin: 50px 0 0 0;
	/* margin-left: 10px; */
	padding-top: 20px;
	padding-left: 30px;
	border-width: 1px;
	/* border-style: solid; */
	border-color: black;
	border-bottom-style: none;
}

.side {
	float: left;
	padding-top: 30px;
	padding-left: 20px;
	padding-right: 20px;
	padding-bottom : 600px;
	margin-bottom: 20px;
/* 	border-width: 1px;
	border-style: solid;
	border-color: black; */
	/* background-color: navy; */
	
}
.side *{
	margin-top: 10px;
	margin-bottom: 10px;
}

#paper {
	color: white;
	width: 500px;
	margin-left: 145px;
	border-width: 1px;
	border-style: solid;
	border-color: white;
}

.questionTab {
	margin: 10px;
	padding: 10px;
	border-width: 1px;
	border-style: solid;
	border-color: white;
}

/* 
.pollform {
	width: 500px;
	float: left;
	background-color: #ffffff;
}
 */
.pollform .pollinfo {
	/* background-color: green; */
	margin: 10px;
}
.pollform .form {
	background-color: navy;
	margin: 10px;
}

.itemList {
	/* float: left; */
	/* background-color: #ffffff; */
	border: 1px; 
	/* solid #000; */
	margin: 10px;
	padding: 10px;
	font-size: .9em; 
}
.itemList h3 {
	margin: 0;
}
.itemList .itemButton {
	cursor: pointer;
	width: 80%;
	float: left;
	text-align: center;
	margin: 5px;
	padding: 5px;
	background-color: gray;
	border-top: 3px solid #888;
	border-left: 3px solid #888;
	border-bottom: 3px solid #888;
	border-right: 3px solid #888;
}

.hover {
	/* background-color: navy; */
	color: lime;
}


.itemList .itemclick {
	font-weight: bold;
	color : aqua;	
	background-color: #B45F04;
}

.subutton {
	display: inline-block;
	margin: 20px 20px;
}

#formupdatebutton {
	cursor: pointer;
	float: right;
	width: 120px;
	height: 30px;
	color: black;
	text-align: center;
	font-weight: bold;
	padding-top: 2px;
	margin: 20px 10px 0px 0px;
	background-color:white;
	border: 3px solid aqua;
	
}

#formdeletebutton{
	cursor: pointer;
	float: right;
	width: 80px;
	height: 30px;
	color: black;
	text-align: center;
	font-weight: bold;
	padding-top: 2px;
	margin: 20px 10px 0px 0px;
	background-color:white;
	border: 3px solid aqua;
}


</style>