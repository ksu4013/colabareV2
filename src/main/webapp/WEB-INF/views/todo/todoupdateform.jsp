<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>todo 수정</h3>
<hr>
<form action="todolistUpdateAction.do" method="get">
<input type="hidden" name="todo_no" value="${todo_no}">
	제목:<input type="text"  name="todo_title"><br>
	내용:<input type="text" name="todo_contents"><br>
	우선순위:<input type="text" name="todo_priority"><br>
	<%-- 투두 타입 노 : ${todo_type_no} --%>
	<%-- 우선순위:<select>
				<option value="${h }">상</option>
				<option value="${m }">중</option>
				<option value="${l }">하</option>
	
			</select><br> --%>
	
	<!-- 캘린더연동여부<input type="checkbox"><br>
	시작일<input type="date"><br>
	마감일<input type="date"><br> -->
	
	<input type="hidden" name="todo_type_no" value="${todo_type_no}">
	<input type="submit" value="수정">
</form>
<hr>
<a href="todolistlist.do?todo_type_no=${todo_type_no }">목록보기</a>

</body>
</html>