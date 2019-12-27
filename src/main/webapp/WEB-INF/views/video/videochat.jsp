<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<%@ include file = "../common/header.jsp" %>
 <!DOCTYPE html>
<html>
  <head>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/resources/css/style.css">
  </head>
  <body onload="showMyFace()">
   <div id="page-content">
   <div id="videoChat" style="">
    <video id="yourVideo" autoplay muted playsinline></video>
    <video id="friendsVideo" autoplay playsinline></video>
    <br />
    <button onclick="showFriendsFace()" type="button" class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span> 통화</button>
    <script src="https://www.gstatic.com/firebasejs/4.9.0/firebase.js"></script>
    <script src="/resources/js/script.js"></script>
    </div>
    </div>
  </body>
</html>
