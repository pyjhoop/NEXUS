<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/css/bootstrap.min.css' />
 <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/css/fontawesome.min.css' />
 <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/css/all.min.css' />
 <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/css/chat_style.css' />
 <style>
 .chat-window .chat-scroll 
 {
  height: calc(100vh - 255px);}
 </style>
</head>
<body>
	<jsp:include page="../common/template.jsp"/>
	
	<div class="container-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
	<div class="row">
	<div class="col-sm-12">
	<div class="chat-window">
	<div class="chat-cont-left">
	<div class="chat-header">
	<span>Chats</span>
	<a href="javascript:void(0)" class="chat-compose">
	<i class="bx bx-plus-circle"></i>
	</a>
	</div>
	<form class="chat-search">
	<div class="input-group">
	<div class="input-group-prepend">
	<i class="bx bx-search-alt-2"></i>
	</div>
	<input type="text" class="form-control" placeholder="Search">
	</div>
	</form>
	<div class="chat-users-list">
	<div class="chat-scroll">
	<c:forEach var="r" items="${rList}">
	<a href="roomDetail.ih?rno=${r.roomNo }" class="media d-flex">
	<div class="media-img-wrap">
	<div class="avatar avatar-away">
	<img src="assets/img/profiles/avatar-05.jpg" alt="" class="avatar-img rounded-circle">
	</div>
	</div>
	<div class="media-body">
	<div>
	<div class="user-name">
	<c:forEach var="u" items="${uList}">
	<c:if test="${ r.roomNo eq u.roomNo }">
	${u.userName}
	</c:if>
	</c:forEach>
	</div>
	<div class="user-last-chat">Give me a full explanation about our project</div>
	</div>
	<div>
	<div class="last-chat-time block">7:30 PM</div>
	<div class="badge badge-success badge-pill">3</div>
	</div>
	</div>
	</a>
	</c:forEach>
	</div>
	</div>
	</div>
	<div class="chat-cont-right">
	<div class="chat-header">
	<a id="back_user_list" href="javascript:void(0)" class="back-user-list">
	<i class="bx bx-chevron-left"></i>
	</a>
	<div class="media d-flex">
	<div class="media-img-wrap">
	<div class="avatar avatar-online">
	<img src="assets/img/profiles/usermain.jpg" alt="" class="avatar-img rounded-circle">
	</div>
	</div>
	<div class="media-body">
	<div class="user-name">Brian Johnson</div>
	<div class="user-status">online</div>
	</div>
	</div>
	</div>
	
	<div class="chat-users-list">
	<div class="chat-scroll">
	<c:forEach var="r" items="${rList}">
	<a href="roomDetail.ih?rno=${r.roomNo }" class="media d-flex">
	<div class="media-img-wrap">
	<div class="avatar avatar-away">
	<img src="assets/img/profiles/avatar-05.jpg" alt="" class="avatar-img rounded-circle">
	</div>
	</div>
	<div class="media-body">
	<div>
	<div class="user-name">
	<c:forEach var="u" items="${uList}">
	<c:if test="${ r.roomNo eq u.roomNo }">
	${u.userName}
	</c:if>
	</c:forEach>
	</div>
	<div class="user-last-chat">Give me a full explanation about our project</div>
	</div>
	<div>
	<div class="last-chat-time block">7:30 PM</div>
	<div class="badge badge-success badge-pill">3</div>
	</div>
	</div>
	</a>
	</c:forEach>
	</div>
	</div>
	<div class="chat-footer">
	<div class="input-group">
	<div class="input-group-prepend">
	<div class="btn-file btn">
	<i class="bx bx-paperclip"></i>
	<input type="file">
	</div>
	</div>
	<input type="text" class="input-msg-send form-control" placeholder="Type something">
	<div class="input-group-append">
	<button type="button" class="btn msg-send-btn"><i class="bx bx-paper-plane"></i></button>
	</div>
	</div>
	</div>
	
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/feather.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.slimscroll.min.js""></script>
	<!-- <script src="${pageContext.request.contextPath}/resources/js/chat_script.js"></script> -->
</body>
</html>