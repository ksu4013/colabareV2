<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/resources/js/vendor/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="/WEB-INF/views/poll/source/poll_insertformsource.js" type="text/javascript"></script>
</head>
<body> 
	<div>
		<div>
			<h3 id="idaaa">설문조사</h3>
		</div>
		<div class="side">
			<a href="poll_insert_form.do">
				<button name="poll_insert">설문 등록</button>
			</a>
			<br>
			<a href="pollList.do">
				<button name="ingpoll">진행중인 설문</button>
			</a>
			<br>
			<button>끝난 설문</button>
			<br>
		</div>
		<div>
			<h4 class="aa">설문조사 생성</h4>
			<form action="/Poll/insertform" id="formm" method="post">
				<div>
					<div>
						<label>부서</label> <select name="department_id">
							<option value="">모두</option>
							<option value="인사">인사</option>
							<option value="영업">영업</option>
							<option value="마케팅">마케팅</option>
						</select>
					</div>
					<div>
						<label>공개</label> <input type="checkbox" name="poll_type" checked="checked">
					</div>
					<div>
						<label>설문 제목</label> <input name="poll_title" value="제목">
					</div>
					<div>
						<label>설문 설명</label> <input name="poll_contents" value="설명">
					</div>
					<div>
						<label>마감시간</label> <input type="datetime-local" name="poll_etime"
							value="2019-11-07 오전 01:00">
					</div>
					<div id="questionform">
						<!-- question -->
						<div class="question">
							<label>질문 내용</label><br>
							<textarea rows="5" cols="20" class="questiontext" name="poll_question_text" >ss</textarea>
							<div class="item_list">
								<div>
									<!-- class="itemform" -->
									<input class="item" name="poll_item_text0" value="항목1">
									<button>삭제</button>
									<br>
								</div >
								<div id="asdlkjfe">
									<input class="item" name="poll_item_text0" value="항목2">
									<button>삭제</button>
									<br>
									<!-- 항목 추가 자리 -->
								</div>
							</div>
							<div>
								<div>
									<button id="add_item">항목 추가</button>
								</div>
							</div>
							<!-- <div>
								<label>응답자 옵션 추가</label> <input type="checkbox" name="db없음">
							</div> -->
							<div>
								<label>중복 선택 허용</label> <input type="checkbox" name="poll_multiple"  checked="checked">
							</div>
						</div>
							<!-- 질문 추가자리 -->
						<div>
							<button id="addquestion">질문 추가</button>
						</div>
					</div>
					<div>
						<input id="transmit" type="submit" value="등록">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>