<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>

<h3>todo 유형 작성</h3>
<hr>
	<form action="registerType" method='post'>
	<input type="hidden" value="">
	제목: <input type="text" name="todo_type_title"><br>
	내용:<input type="text" name="todo_type_contents"><br>
	<!-- 함께할 사람:<script type="text/javascript">
	console.log("$()")
	<input type="submit" value="검색">
	</script> -->
	
	<br><br>
	
	<input type="submit" value="작성">
	
	</form>


</body>
</html>