<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/vendor/jquery-3.3.1.min.js" ></script>
<!-- 
<script type="text/javascript" src="../poll/source/poll_insertformsource.js"></script>
<link rel="stylesheet" href="../poll/css/pollinsertscss.css" type="text/css">
<link rel="stylesheet" src="../poll/css/insert-test.css"></script> 
 -->

</head>
<body> 
<%@ include file = "../common/header.jsp" %>

<div id="id">
	<h3>설문조사</h3>
</div>
	<div>
		<div class="side">
			
			<a href="pollinsertform">
				<button name="poll_insert">설문 등록</button>
			</a>
			<br>
			<a href="pollListform">
				<button name="ingpoll">진행중인 설문</button>
			</a>
			<br>
			<button>끝난 설문</button>
			<br>
		</div>
		
		<div id="paper">
			<h4 class="aa">설문조사 생성</h4>
			<div id="formm">
			<form action="pollinsert"  method="post">
				<div>
					<div>
						<label>부 서</label> <select name="department_id">
							<option value="">모두</option>
							<option value="인사">인사</option>
							<option value="영업">영업</option>
							<option value="마케팅">마케팅</option>
						</select>
					</div>
					<div>
						<label>공 개</label> <input type="checkbox" name="poll_type" checked="checked">
					</div>
					<div>
						<label>설문 제목</label> <input name="poll_title" value="제목">
					</div>
					<div>
						<label>설문 설명</label> <input name="poll_contents" value="설명">
					</div>
					<div>
						<label>마감시간</label> <input type="datetime-local" name="poll_etime" value="2019-11-07 오전 01:00">
					</div>
					<div id="questiontab">
						<div id="q1" class="question">
							<label>1. 질문 내용</label><br>
							<input type="hidden" id="pnqn?-1" class="pollnumquesrionnum" name="poll_num_question_num" value="1">
							<textarea rows="5" cols="20" id="questionText1" class="questiontext" name="poll_question_text" >질문1</textarea>
							<div class="item_list1">
								<div class="itemtab1">
									<input type="hidden" id="qn1-1" class="pollquestionnum" name="poll_question_num" value="">
									<input type="hidden" id="qnin1-1" class="item_num" name="question_num_item_num" value="1">
									<label>항목</label><input id="item1-1" class="item" name="poll_item_text" value="항목1">
									<button>삭제</button>
									<br>
								</div>
								<div class="itemtab2">
									<input type="hidden" id="qn1-1" class="pollquestionnum" name="poll_question_num" value="">
									<input type="hidden" id="qnin1-2" class="item_num" name="question_num_item_num" value="2">
									<label>항목</label><input id="item1-2" class="item" name="poll_item_text" value="항목2">
									<button>삭제</button>
									<br>
								</div>
								<!-- 항목 추가 자리 -->
							</div>
							<div id="addibutton1" class="additembutton">
								<!-- <div id="realIB">항목 추가</div> -->
								<b>항목 추가</b>
							</div>
							<!-- <div>
								<label>응답자 옵션 추가</label> <input type="checkbox" name="db없음">
							</div> -->
							<div>
								<label>중복 선택</label> <input type="checkbox" id="qmulti1" class="questionmultiple" name="poll_multiple"  checked="checked">
							</div>
						</div>
						
					</div>
					<!-- 질문 추가자리 -->
					<div id="addqubutton">
						<!-- <div id="realQB"></div> -->
						<b>질문 추가</b>
					</div>
					<div class="subutton">
						<input type="submit" value="등록">
					</div>
				</div>
			</form>
		</div>
		</div>
		<a href="/colabare/main.jsp"><button>홈으로</button></a>
	</div>
</body>
</html>



 
<script type="text/javascript">



$(document).ready(function(){
		//question 증가코드
		$(document).on('click','#addqubutton',function(){
			//마지막 질문 아이디 번호값
			var qidString = $('#questiontab').children(":last").attr('id');
			//마지막 질문 아이디 번호값은 '1'
			var qidnum = qidString.substring(1,qidString.length);
			//마지막 번호값에 +1
			var qidPnum = ++qidnum;
			
		$('#questiontab').append(
				/* 설문번호와 질문순번 */
				+ "<input type='hidden' id='pnqn?-"+qidPnum+"' class='pollnumquesrionnum' name='poll_num_question_num' value='"+qidPnum+"'>"
				/* 질문 내용 */
				+ "<div id='q"+qidPnum+"' class='question'><label>"+qidPnum+". 질문 내용</label><br><br>"
				+ "<textarea rows='5' cols='20' id='questionText"+qidPnum
				+ "' class='questiontext' name='poll_question_text'>질문"+qidPnum+"</textarea>"
				/* 항목1번 */
				+ "<input type='hidden' id='pqn"+qidPnum+"-1' class='pollquestionnum' name='poll_question_num' value=''>"
				+ "<input type='hidden' id='qnin"+qidPnum+"-1' class='item_num' name='question_num_item_num' value='1'>"
				+ "<div class='item_list"+qidPnum+"'><div class='itemtab1'><label>항목</label>"
				+ "<input id='item"+qidPnum+ "-1' class='item' name='poll_item_text' value='항목1'>"
				+ "<button>삭제</button><br></div>"
				/* 항목2번 */
				+ "<input type='hidden' id='pqn"+qidPnum+"-2' class='pollquestionnum' name='poll_question_num' value=''>"
				+ "<input type='hidden' id='qnin"+qidPnum+"-2' class='item_num' name='question_num_item_num' value='2'>"
				+ "<div class='itemtab2'><label>항목</label>"
				+ "<input id='item"+qidPnum+ "-2' class='item' name='poll_item_text' value='항목2'>"
				+ "<button>삭제</button><br></div></div><div>"
				/* 항목추가 버튼 */
				+ "<div id='addibutton"+qidPnum+"' class='additembutton'><b>항목 추가</b></div>"
				/* 중복 옵션 */
				+ "<!-- <div><label>응답자 옵션 추가</label> <input type='checkbox' name='db없음'></div> -->"	
				+ "<div><label>중복 선택 허용</label> <input type='checkbox' id='qmulti"+qidPnum	
				+ "' class='questionmultiple' name='poll_multiple' checked='checked'></div></div>");
	});

		//클릭하면 클릭한 질문에 대한(id) item 증가 코드
		$(document).on('click','.additembutton',function(){
			//이벤트 버블링 방지
			event.stopPropagation();
			
			
			//현재 값 찾기
			//클릭한 항목추가의 id값 = 초기 '1'
			var fullIBID= $(this).attr('id');
			//빼온 id값 숫자만 추출 1
			var ibID = fullIBID.substring(fullIBID.length-1,fullIBID.length);
			//id숫자 조합해서 '현재 클릭한 리스트'값 구함 
			var listnum = ".item_list" + ibID;
			 
			
			//증가된 값 구하기
			 //아이템리스트의 마지막 자식클레스값 인 itemtab class 찾기 = 초기 'itemtab2'
			var lastitem = $(listnum).children(":last").attr('class');
			 //클레스값 숫자만 잘라내기
			var lastitemnum = lastitem.substring(lastitem.length-1,lastitem.length);
			 //하나 증가 시킨값 == 기본 3;
			var addnum = ++lastitemnum;
			 /* alert(lastitemnum); */
			 
			 
			$(listnum).append(
					"<div class='itemtab"+lastitemnum+"'>"
					
					+ "<input type='hidden' id='pqn"+ibID+"-"+addnum+"' class='pollquestionnum' name='poll_question_num' value=''>"
					+ "<input type='hidden' id='qnin"+ibID+"-"+addnum+"' class='item_num' name='question_num_item_num' value='"+addnum+"'>"
					
					+ "<label>항목</label>"
					+ "<input id='item"+ibID+"-"+addnum+"' class='item' name='poll_item_text' value='항목"+addnum+"'>"
					+ "<button>삭제</button><br></div>");
		});
		
		

	
});
	
	
	
	
	
	
	
	
	
	
	
</script>


<style>

* {
	/* color: white; */
}
#id {
	/* color: white; */
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
	border-right-width: 1px;
	/* border-style: solid; */
	border-color: black;
	/* background-color: navy; */
	
}
.side *{
	margin-top: 10px;
	margin-bottom: 10px;
}

h4 {
	/* color: white; */
	padding-left: 30px;
	padding-top: 20px;
	padding-bottom: 20px;
	/* border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: black; */
}

#paper {
	width: 500px;
	margin-left: 145px;
	border-width: 1px;
	border-style: solid;
	border-color: black;
}

#formm {
	padding-left: 30px;
	/* background-color: gray; */
}


#questiontab {
	width: 442px;
	
	margin-top: 10px;
	margin-bottom: 10px;
	margin-left: 10px;
	margin-right: 10px;
	/* background-color: aqua; */
	border-width: 1px;
	border-style: solid;
	border-color: black; 
}

.question {
	width: 400px;
	padding-left: 20px;
	padding-top: 0px;
	margin-bottom: 5px;
	margin-left: 10px;
	border-width: 1px;
	border-style: solid;
	border-color: black;
}

#formm div {
	/* padding-top: 10px; */	
	padding-top: 10px;
	padding-bottom: 10px;
}

#addqubutton {
	text-align: center;
	font-weight: 800;
	cursor: pointer;
	width: 100px;
	height: 40px;
	margin: 0px 0px ;
	padding: 0px 0px ;
	background-color: aqua;
	/* border: 10px 10px 10px 10px;  */
	border-style: solid;
	border-color: #0080FF; 
}

.additembutton {
	/* color: white; */
	text-align: center;
	font-weight: 800;
	cursor: pointer;
	width: 100px;
	height: 40px;
	margin: 0px 0px 0px 100px;
	padding: 0px 0px ;
	background-color: orange;
	/* border: 10px 10px 10px 10px;  */
	border-style: solid;
	border-color: #FFBF00;
}


.subutton {
	margin: 10px;
}
label {
	padding-right: 10px;
}




</style> 
