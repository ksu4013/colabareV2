<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h1>type LIST</h1>


	<table border="1">
		<tr>
			<td>유형번호</td>
			<td>유형제목</td>
			<td>유형내용</td>
			

		</tr>

		<c:forEach var="todotype" items="${getTypeList }">
			<tr>
				<td>${todotype.todo_type_no }</td>
				<td>${todotype.todo_type_title}</td>
				<td>${todotype.todo_type_contents}</td>
				
			</tr>
		</c:forEach>
	</table>
</body>
</html>