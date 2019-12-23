<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/vendor/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/WEB-INF/views/poll/source/poll_listformsource.js"></script>
</head>
<body>
	<div>
		<div>
			
			<div>
				<a href="poll_insert_form.do">
				<button name="poll_insert">설문 등록</button>
				</a>
				<br>
				<a href="pollList.do">
				<button name="ingpoll">진행중인 설문</button>
				</a>
				<br>
				<button name="endpoll">끝난 설문</button>
				<br>
			</div>
			<div>
				<h3>설문조사</h3>
			</div>
			<div>
				<div>현재 상태</div>
			</div>
			<br>
			<c:forEach var="poll" items="${PollList}">
			<c:if test="${poll == null }">등록된 설문이 없습니다.</c:if>
			<a href="uiForm.do?poll_num=${poll.poll_num}">
				<div>
					<div>${poll.poll_num}번 설문</div>
					
					<div>${poll.poll_title} | ${poll.poll_etime}</div>
					<div>${poll.department_name} | ${poll.name} | ${poll.poll_type} | 
					
					<c:if test="${poll.poll_type == '1'.toString()} ">비공개</c:if>
					<c:if test="${poll.poll_type == '1'.charAt(0)} ">공개</c:if>
					</div>
					<%-- 	<c:choose><c:when test="${poll.poll_type == '1' }">비공개</c:when>
						<c:when test="${poll.poll_type != '0' }">공개</c:when></c:choose> --%>
					
				</div>
				</a>
				<br>

			</c:forEach>
		</div>
	</div>
	<!-- 페이징 처리 자리 -->
	</div>
</body>
</html>