<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

	<h3>todo 작성</h3><hr>
	
	<form action="registerTodo" method="post">
	<input type="hidden" name="todo_type_no" value="${todolist.todo_type_no}">
	제목:<input type="text" name="todo_title"placeholder="할일 제목을 입력하세요."><br>
	내용:<textarea name="todo_contents" placeholder="내용을 입력하세요"></textarea><br>
	
		
		<input type="submit" value="작성">
	</form>

</body>
</html>