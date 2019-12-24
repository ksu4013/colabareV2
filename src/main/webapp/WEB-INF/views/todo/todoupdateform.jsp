<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "../common/header.jsp" %>

<h3>할일수정</h3>
	<hr>
	<form action="modifyTodo?todo_type_no=${todolist.todo_type_no }" method="POST">
	<input type="hidden" name="todo_type_no" value="${todolist.todo_type_no }">
	제목:<input type="text" name="todo_title" value="${todolist.todo_title }"><br>
	내용:<input type="text" name="todo_contents" value="${todolist.todo_contents }"><br>
	
	<br>	
	<input type="submit" value="수정">
</form>

<hr>
<a href="todo/typelist">목록보기</a>
</body>
</html>