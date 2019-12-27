<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/vendor/jquery-3.3.1.min.js"></script>
<!-- <script type="text/javascript" src="/WEB-INF/views/poll/source/poll_listformsource.js"></script>
<link rel="stylesheet" href="/WEB-INF/views/poll/css/polllistcsss.css" type="text/css"> -->
</head>
<body>
<%@ include file = "../common/header.jsp" %>

<div id="id">
	<h3>설문조사</h3>
</div>
	<div>
		<div>
			<div class="side">
				<a href="pollinsertform">
				<button name="pollinsertform">설문 등록</button>
				</a>
				<br>
				<a href="polllistform">
				<button name="ingpoll">진행중인 설문</button>
				</a>
				<br>
				<button name="endpoll">끝난 설문</button>
				<br>
			</div>
		</div>
	</div>
	<div id="paper"><br>
		<c:choose>
		 	<c:when test="${empty PollList }">
		 		<br><br><br><br><br><br><br><br><label>지금 등록된 설문이 없습니다.</label><br><br><br><br><br><br><br><br>
		 	</c:when>
			 <c:when test="${!empty PollList }"> 
				<div id="listtab">
					<c:forEach var="poll" items="${PollList}">
					<div class="polltab">
						<div class="polls">
							<div class="pollsnum">${poll.poll_num}번 설문</div>
							<a href="polluserinsertform?poll_num=${poll.poll_num}">
								<div class="listinfo">
									<div>${poll.poll_title} <br> ${poll.department_name} | ${poll.name} | 
									<c:choose>
										<c:when test='${poll.poll_type eq "1".charAt(0) }'>비공개</c:when>
										<c:when test='${poll.poll_type eq "0".charAt(0) }'>공개</c:when>
									</c:choose>
									</div>
								</div>
								<div class="tabtail">
									<div class="s-etime">${poll.poll_stime} ~ ${poll.poll_etime}</div>
									<div class="other"> 준비중</div>
								</div>
							</a>
						</div>
					</div>
					</c:forEach>
				</div>	 
				</c:when> 
			</c:choose>
		</div>
	
	<!-- 페이징 처리 자리 -->
	<div>
	</div>
</body>
</html>

<style>

#id {
	color: white;
	width: 615px;
	height: 100px;
	margin: 50px 0 0 0;
	/* margin-left: 10px; */
	padding-top: 20px;
	padding-left: 30px;
	border-width: 1px;
	/* border-style: solid; */
	border-color: black;
	border-bottom-style: none;
}

.side {
	float: left;
	padding-top: 30px;
	padding-left: 20px;
	padding-right: 20px;
	padding-bottom : 600px;
	margin-bottom: 20px;
/* 	border-width: 1px;
	border-style: solid;
	border-color: black; */
	/* background-color: navy; */
	
}
.side *{
	margin-top: 10px;
	margin-bottom: 10px;
}

h4 {
	padding-left: 30px;
	padding-top: 20px;
	padding-bottom: 20px;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: black;
}
/* 
#paper {
	width: 500px;
	margin-left: 145px;
	border-width: 1px;
	border-style: solid;
	border-color: black;
} */

#paper {
	width: 900px;
	margin-left: 145px;
	border-width: 1px;
	border-style: solid;
	border-color: white;
}

#listtab {
	padding: 0px 20px 0px 20px;
}

.polltab {
	width: 100%;
}

.polls {
	/* display: inline-block; */
	width: 100%;
	height: 60px;
/* 	margin-top
	margin-right
	margin-bottom
	margin-left */
	margin: 10px 0px 30px 0px;
	padding: 10px 10px 10px 10px;
	border-width: 1px;
	border-style: solid;
	border-color: black;
}
.pollsnum {
	color: lime;
	float: left;
	height: 50px;
	padding-top: 10px;
	text-align: center;
	margin-right: 40px;
	
}

.listinfo {
	width: 300px;
	float: left;
	display: inline-block;
}

.tabtail {
	display: inline-block;
	margin: 10px 10px 0px 20px;
}

.tabtail *{
	display: inline-block;
	margin: 0px 0px 0px 20px;
}

.s-etime {
	margin: 0px 20px 0px 0px;
}










</style>