<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	<h1>type LIST</h1>

	<button id='newTypeBtn' href="typeinsertform">새 type</button>
	<a href="typeinsertform" >쓰기</a>
	
	<table border="1">
		<tr>
			<td>유형번호</td>
			<td>유형제목</td>
			<td>유형내용</td>
			<td> </td>
			<td> </td>
			<td> </td>

		</tr>


		<c:forEach var="todotype" items="${typelist }">
			<tr>
				<td>${todotype.todo_type_no }</td>
				<td>${todotype.todo_type_title}</td>
				<td>${todotype.todo_type_contents}</td>
				<td><a href="typeupdateform?todo_type_no=${todotype.todo_type_no }">수정하기</a></td>
				<%-- <td><a href="typeupdateform?todo_type_no=${todotype.todo_type_no }">수정하기</a></td> --%>
				<%-- <td><button id="delTypeBtn" onclick="del(${todotype.todo_type_no})">삭제</button></td> --%>
				<td><a href="deleteType?todo_type_no=${todotype.todo_type_no }">삭제하기</a></td>
				<td><a href="todolist?todo_type_no=${todotype.todo_type_no }">TODO LIST</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
<script type="text/javascript">
	$(document.ready(function(){
		
		
		function del(todo_type_no){
			location.href ='deleteType?todo_type_no='+todo_type_no;
		}
		
		$("#newTypeBtn").on("click",function(){
			
			self.location = "todo/typeinsertform";
			
		});
	
	}));


</script>
</html>