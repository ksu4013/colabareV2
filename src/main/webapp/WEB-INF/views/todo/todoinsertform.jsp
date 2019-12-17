<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/header.jsp" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>todo 작성</h3>
<hr>
<form action="/colabare/todolist/todolistInsertAction.do" method="post">
  
	제목: <input type="text" name="todo_title"><br>
	내용:<textarea name="todo_contents"></textarea><br>
	우선순위:<input type="text" name="todo_priority"><br>
	
	<%-- 우선순위:<select>
					<option value="${h}">상</option>
					<option value="${m}">중</option>
					<option value="${l}">하</option> --%>
	<!-- 		</select><br>
	캘린더연동<input type="checkbox" value="upload_on_cal"><br>
	시작일<input type="date" max="9999-12-31" name="startdate"><br>
	마감일<input type="date" max="9999-12-31" name="enddate"><br> -->
	
	<input type="hidden" name="todo_type_no" value="${todo_type_no}">
	<input type="submit" value="작성">
	
</form>



</body>
</html>