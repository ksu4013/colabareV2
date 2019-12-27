<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>

<html>


<script type="text/javascript" src="/resources/js/vendor/jquery-3.3.1.min.js"></script>
<script type="text/javascript"  src="/resources/js/pages/login.js"> </script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<h3><c:out value="${error }"/></h3>
<h3><c:out value="${logout }"/></h3>
	<form action="/login" method="post">
	<div>
	사원번호 : <input type="text" name="username" value="admin"><br></div><div>
	비밀번호 : <input type="password" name="password" value="admin"><br></div>
	<Div>
	<input type="submit" value="로그인">
	</Div>
	<input type="hidden" name=${_csrf.parameterName } value="${_csrf.token }"/>
</form>

</body>
</html>