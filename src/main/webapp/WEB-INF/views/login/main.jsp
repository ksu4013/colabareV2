<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<%@ include file = "../common/header.jsp" %>
        
</head>
<body>
<h1>메인</h1>
<c:if test="${sessionScope.employee.master=='y'}">
	<a href="/colabare/master/master.do">마스터 페이지</a><br><br>
</c:if>
<a href="/colabare/profile/profile.do">프로필 수정</a><br><br>

<a href="meetingboard/list.do">MeetingBoard</a>
<a href="">Document</a>

<br><br><hr>

<a href="todolist/todotypelist.do">TODO TYPE</a>
<br>
<hr>
<a href="http://192.168.0.57:3000/">Chat</a>
<hr>
<a href="notice/notice_list.do">공지사항</a>
<hr>
<a href="/poll/pollinsertform">설문조사</a>
<hr>
<a href="mail/mailcheck.do">E-MAIL</a>

        
</body>

</html>