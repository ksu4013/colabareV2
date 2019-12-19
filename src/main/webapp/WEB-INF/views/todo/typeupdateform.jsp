<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>유형 수정</h3>
<hr><form action="typeupdateform" method="get">
	<input type="hidden" name="todo_type_no" value="${todo_type_no }">
	제목:<input type="text" name="todo_type_title"><br>
	내용:<input type="text" name="todo_type_contents"><br>
	
	<br>	
	<input type="submit" value="수정">
</form>
<hr>
<a href="typelist">목록보기</a>
</body>
</html>