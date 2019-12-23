<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/WEB-INF/views/poll/css/polluicss.css" type="text/css" >
<script type="text/javascript" src="/resources/js/vendor/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/WEB-INF/views/poll/source/poll_uisource.js"></script>
</head>
<body>
	<div>
		<div>
			<div>
				<a href="poll_insert_form.do">
					<button name="poll_insert">설문 등록</button>
				</a> <br> 
				<a href="pollList.do">
					<button name="ingpoll">진행중인 설문</button>
				</a> <br>
				<button name="endpoll">끝난 설문</button>
				<br>
			</div>
		</div>
	</div>
	<div>
		<div>	
			<div>
				<h3>설문조사</h3>
			</div>
			<div class="pollform">
				<div class="pollinfo">
					<h4>${poll.polllist.poll_title }</h4>
					<div>${poll.polllist.poll_contents }</div>
				</div>
				
				
				
				<form action="polluiInsert.do" method="post">
				<c:forEach var="question" items="${poll.questions }" varStatus="qnum">
				<input type="text" name="poll_num" value="${poll.polllist.poll_num }">
				<div>NO_${qnum.count }</div><br>
				<input type="hidden" id="qnumID${qnum.count }" name="qestionNum" value="${qnum.count }">
				<div>
					<div>${qnum.count }번 설명</div>
					<div id="q_text_${qnum.count }">
						${question.poll_question_text }
					</div>
					<div id="q_multiple_${qnum.count }" class="multiple">${question.poll_multiple }</div>
						<div class="itemList" id="Ilist_${qnum.count }">
							<c:forEach var="items" items="${poll.items }" varStatus="inum">
								<input type="hidden" id="inumid${inum.count }" name="itemsnumber" value="${inum.count }">
								<div class="itemButton" id="itemLS_${qnum.count }_${inum.count }">
								${items.poll_item_text }
								</div>
								<input type="hidden" id="itemNum_${inum.count }" value="${items.poll_item_num }">
								<br><br><br>
							</c:forEach>
							<input type="text" class="userselectI" id="userinput_${qnum.count }" name="poll_select_num"><br>
							<input type="text" class="userselectQ" id="userinputQnum_${qnum.count }" name="poll_question_num" value="${question.poll_question_num }">
						</div>
				</div>
				</c:forEach>
				<br><br><br><br><br><br><br><br><br><br>
				<div class="submit">
					
				<input class="submitButton" type="submit" value="설문 제출">
				</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>