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
	<div class="chat-body">
	<div class="chat-scroll">
	<ul class="list-unstyled">
	<li class="media sent">
	<div class="media-body">
	<div class="msg-box">
	<div>
	<p>Hello. What can I do for you?</p>
	<ul class="chat-msg-info">
	<li>
	<div class="chat-time">
	<span>8:30 AM</span>
	</div>
	</li>
	</ul>
	</div>
	</div>
	</div>
	</li>
	<li class="media d-flex received">
	<div class="avatar">
	<img src="assets/img/profiles/usermain.jpg" alt="" class="avatar-img rounded-circle">
	</div>
	<div class="media-body">
	<div class="msg-box">
	<div>
	<p>I'm just looking around.</p>
	<p>Will you tell me something about yourself?</p>
	<ul class="chat-msg-info">
	<li>
	<div class="chat-time">
	<span>8:35 AM</span>
	</div>
	</li>
	</ul>
	</div>
	</div>
	<div class="msg-box">
	<div>
	<p>Are you there? That time!</p>
	<ul class="chat-msg-info">
	<li>
	<div class="chat-time">
	<span>8:40 AM</span>
	</div>
	</li>
	</ul>
	</div>
	</div>
	<div class="msg-box">
	<div>
	<div class="chat-msg-attachments">
	<div class="chat-attachment">
	<img src="assets/img/img-01.jpg" alt="">
	<div class="chat-attach-caption">placeholder.jpg</div>
	<a href="" class="chat-attach-download">
	<i class="fas fa-download"></i>
	</a>
	</div>
	<div class="chat-attachment">
	<img src="assets/img/img-01.jpg" alt="">
	<div class="chat-attach-caption">placeholder.jpg</div>
	<a href="" class="chat-attach-download">
	<i class="fas fa-download"></i>
	</a>
	</div>
	</div>
	<ul class="chat-msg-info">
	<li>
	<div class="chat-time">
	<span>8:41 AM</span>
	</div>
	</li>
	</ul>
	</div>
	</div>
	</div>
	</li>
	<li class="media sent">
	<div class="media-body">
	<div class="msg-box">
	<div>
	<p>Where?</p>
	<ul class="chat-msg-info">
	<li>
	<div class="chat-time">
	<span>8:42 AM</span>
	</div>
	</li>
	</ul>
	</div>
	</div>
	<div class="msg-box">
	<div>
	<p>OK, my name is Limingqiang. I like singing, playing basketballand so on.</p>
	<ul class="chat-msg-info">
	<li>
	<div class="chat-time">
	<span>8:42 AM</span>
	</div>
	</li>
	</ul>
	</div>
	</div>
	<div class="msg-box">
	<div>
	<div class="chat-msg-attachments">
	<div class="chat-attachment">
	<img src="assets/img/img-01.jpg" alt="">
	<div class="chat-attach-caption">placeholder.jpg</div>
	<a href="" class="chat-attach-download">
	<i class="fas fa-download"></i>
	</a>
	</div>
	</div>
	<ul class="chat-msg-info">
	<li>
	<div class="chat-time">
	<span>8:50 AM</span>
	</div>
	</li>
	</ul>
	</div>
	</div>
	</div>
	</li>
	<li class="media d-flex received">
	<div class="avatar">
	<img src="assets/img/profiles/usermain.jpg" alt="" class="avatar-img rounded-circle">
	</div>
	<div class="media-body">
	<div class="msg-box">
	<div>
	<p>You wait for notice.</p>
	<p>Consectetuorem ipsum dolor sit?</p>
	<p>Ok?</p>
	<ul class="chat-msg-info">
	<li>
	<div class="chat-time">
	<span>8:55 PM</span>
	</div>
	</li>
	</ul>
	</div>
	</div>
	</div>
	</li>
	<li class="chat-date">Today</li>
	<li class="media d-flex received">
	<div class="avatar">
	<img src="assets/img/profiles/usermain.jpg" alt="" class="avatar-img rounded-circle">
	</div>
	<div class="media-body">
	<div class="msg-box">
	<div>
	<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,</p>
	<ul class="chat-msg-info">
	 <li>
	<div class="chat-time">
	<span>10:17 AM</span>
	</div>
	</li>
	<li><a href="#">Edit</a></li>
	</ul>
	</div>
	</div>
	</div>
	</li>
	<li class="media sent">
	<div class="media-body">
	<div class="msg-box">
	<div>
	<p>Lorem ipsum dollar sit</p>
	<div class="chat-msg-actions dropdown">
	<a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	<i class="fe fe-elipsis-v"></i>
	</a>
	<div class="dropdown-menu dropdown-menu-right">
	<a class="dropdown-item" href="#">Delete</a>
	</div>
	</div>
	<ul class="chat-msg-info">
	<li>
	<div class="chat-time">
	<span>10:19 AM</span>
	</div>
	</li>
	<li><a href="#">Edit</a></li>
	</ul>
	</div>
	</div>
	</div>
	</li>
	<li class="media d-flex received">
	<div class="avatar">
	<img src="assets/img/profiles/usermain.jpg" alt="" class="avatar-img rounded-circle">
	</div>
	<div class="media-body">
	<div class="msg-box">
	<div>
	<div class="msg-typing">
	<span></span>
	<span></span>
	<span></span>
	</div>
	</div>
	</div>
	</div>
	</li>
	</ul>
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
	<!--  <script src="${pageContext.request.contextPath}/resources/js/chat_script.js"></script>-->
</body>
</html>