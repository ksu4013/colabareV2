<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>

<html>


<script type="text/javascript" src="/resources/js/vendor/jquery-3.3.1.min.js"></script>
<script type="text/javascript"  src="/resources/js/pages/login.js"> </script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<form id="login" method="post">
	사원번호 : <input type="text" name="employee_no" id="employee_no"><br>
	비밀번호 : <input type="password" name="password" id="password"><br>
	<div id="fail"></div>
	<input type="button" id="loginbtn" value="로그인">
</form>

</body>
</html >