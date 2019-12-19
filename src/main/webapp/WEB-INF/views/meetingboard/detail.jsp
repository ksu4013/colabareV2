<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Detail MeetingBoard</title>
</head>
<body>
<%@ include file = "../common/header.jsp" %>
	<br><br><br>

	<hr><br>
	<b>${meetingBoard.title }</b><br>
	<br>
	<hr>
	
	
	<b>${meetingBoard.write_date }</b><br><br>
	<b>${meetingBoard.content }</b><br><br>
	<hr>
	<b>${meetingBoard.name }</b><br>
	<hr>
	<br><br>
	
	<button class="btn btn-primary" onclick="location.href='/colabare/meetingboard/list.do'">목록보기</button>
	
	<c:if test="${employee.employee_no == meetingBoard.employee_no}">
		<button onclick="location.href='/colabare/meetingboard/updateForm.do?board_no=${meetingBoard.board_no }'">수정하기</button>
		<button onclick="location.href='/colabare/meetingboard/deleteForm.do?board_no=${meetingBoard.board_no }'">삭제하기</button>
	</c:if>
	
	<br><br>
	<hr>
	<br><br>
	
	
	
	<form>
				 <input type="hidden" id = "board_no"    name = "board_no"    value ="${meetingBoard.board_no }">
				 <input type="hidden" id = "employee_no" name = "employee_no" value ="${employee.employee_no }" >
		댓글 내용 : <input type="text"   id = "content" 	 name = "content"><br>
		
				 <input type="button" id = "btnReplySave" class="btn btn-primary" value = "댓글작성">
	</form>
	<br><br>
	
	
	<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">

		<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
		<input type="hidden" id = "bdno" value = "${meetingBoard.board_no }">
		<%-- <input type="hidden" id = "rpno" value = "${meetingBoardReply.reply_no }"> --%>
		<table id="replyList" border="1"></table> 

	</div> 


	

	
		<br><br>
	<hr>
	<br><br>
	<br><br>	<br><br>
	<hr>
	<br><br>
	<br><br>	<br><br>
	<hr>
	<br><br>
	<br><br>	<br><br>
	<hr>
	<br><br>
	<br><br>	<br><br>
	<hr>
	<br><br>
	<br><br>
	
	
	
	
	<%-- <jsp:include page="/document/normal.jsp"></jsp:include> --%>
	
	
	
	
	
	
	<%-- <table border="1">
		<c:forEach var = "reply" items="${meetingBoardReply }">
			<tr id="${reply.reply_no }' + ${thisreply.reply_no } + '">
				<td>${reply.reply_no }</td>
				<td>${reply.employee_no }</td>
				<td>${reply.board_no }</td>
				<td>${reply.content }</td>
				<td>${reply.name }</td>
				<td>${reply.write_date }</td>
				<c:if test="${employee.employee_no == reply.employee_no}">
					<td><button onclick="location.href='/colabare/meetingboard/updateReplyForm.do?board_no=${reply.board_no }'">수정</button></td>
					<td><button onclick="location.href='/colabare/meetingboard/deleteReply.do?reply_no=${reply.reply_no }'">삭제</button></td>
				</c:if>
			</tr>
		</c:forEach>
	</table> --%>
	<br><br>
	<hr>
	<br><br>
	<br><br>


	<!-- <script type="text/javascript" src="/colabare/meetingBoard/listReply.js"></script> -->
<!-- jQuery, Bootstrap, jQuery plugins and Custom JS code -->
   

   <!-- Load and execute javascript code used only in this page -->
   
</body>
</html>