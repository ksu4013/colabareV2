<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<h3>todo 리스트</h3>
<hr>
	<a href="todoinsertform?todo_type_no=${todo_type_no}">새로운 todo</a>
	<br><br>
	<table border="1">
		<tr>
			<td>할일 번호</td>
			<td>할일 제목</td>
			<td>할일 내용</td>

			
		</tr>
		
		<c:forEach var="todolist" items="${todolist }">
		<tr>
			<td>${todolist.todo_no }</td>
			<td>${todolist.todo_title }</td>
			<td>${todolist.todo_contents }</td>
			
				
			<td><a href="todoupdateform?todo_no=${todolist.todo_no}&todo_type_no=${todolist.todo_type_no}">수정하기</a></td>
			<td><a href="deleteTodo?todo_no=${todolist.todo_no}&todo_type_no=${todolist.todo_type_no}">삭제하기</a></td>
		</tr>				
		<input type="hidden" name="todo_type_no" value="${todo_type_no}">
		</c:forEach>
	</table>
	<br><br>
	<hr>
	<a href="typelist">TODO TYPE</a>
</body>
</html>

