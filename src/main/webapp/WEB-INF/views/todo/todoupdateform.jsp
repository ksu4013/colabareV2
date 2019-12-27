<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "../common/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<h3>할일수정</h3>
	<hr>
	<form action="modifyTodo" method="POST">
		<input type="hidden" name="todo_type_no" value="${todolist.todo_type_no }">
		<input type="hidden" name="todo_no" value="${todo.todo_no }">
	제목:<input type="text" name="todo_title" value="${todo.todo_title }"><br>
	내용:<input type="text" name="todo_contents" value="${todo.todo_contents }"><br>
		<input type="submit" value="수정">
	</form>

<hr>
<a href="todo/typelist">목록보기</a>
</body>
</html>

