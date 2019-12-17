<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>todo 리스트</h3>
<hr>
	<a href="todolistinsertform.do?todo_type_no=${todo_type_no}">새로운 todo</a>
	<br><br>
	<table border="1">
		<tr>
			<!-- <td>todo번호</td> -->
			<td>제목</td>
			<td>내용</td>
			<td>우선순위</td>
			<!-- <td>캘린더연동여부</td>
			<td>시작일</td>
			<td>마감일</td> -->
			
		</tr>
		
		<c:forEach var="todolist" items="${listTodo }" >
		<tr>
			
<%-- 			<td><input type="hidden" name="todo_type_title" value="${todo_type_title}"></td>
			<td><input type="hidden" name="todo_type_contents" value="${todo_type_contents}"></td> --%>
			<%-- <td>${todolist.todo_no}</td> --%>
			<%-- <td><a href="/colabare/todolist.detail.do?todo_no=${todolist.todo_no }">${todolist.todo_title }</a></td> --%>
			<td>${todolist.todo_title }</td>
			<td>${todolist.todo_contents }</td>
			<td>${todolist.todo_priority}</td>
			<%-- <td>${todolist.upload_on_cal}</td>
			<td>${todolist.startdate }</td>
			<td>${todolist.enddate }</td> --%>
			<%-- <td><a href="todolistupdateform.do?todo_no=${todolist.todo_no}">수정하기</a><td> --%>
			<td><a href="todolistupdateform.do?todo_no=${todolist.todo_no}&todo_type_no=${todo_type_no}">수정하기</a></td>
			<td><a href="todolistDeleteAction.do?todo_no=${todolist.todo_no}&todo_type_no=${todo_type_no}">삭제하기</a></td>
		</tr>				
		<input type="hidden" name="todo_type_no" value="${todo_type_no}">
		</c:forEach>
	</table>
	<br><br>
	<hr>
	<a href="todotypelist.do">TODO TYPE</a>
</body>
</html>