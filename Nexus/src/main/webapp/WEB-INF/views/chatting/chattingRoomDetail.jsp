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
  height: calc(100vh - 255px);
 }
	.chat-window .chat-cont-right .chat-body .media.sent .media-body2 {
    align-items: flex-end;
	display: flex;
    flex-direction: column;
    justify-content: flex-end;
    margin-left: 0;
}
.chat-window .chat-cont-right .chat-body .media.sent .media-body2 .msg-box>div {
    background-color: #e3e3e3;
}
.chat-window .chat-cont-right .chat-body .media.sent .media-body2 .msg-box {
    padding-left: 50px;
    position: relative;
}
.chat-window .chat-cont-right .chat-body .media .media-body2 .msg-box>div {
    padding: 10px 15px;
    border-radius: 0.25rem;
    display: inline-block;
    position: relative;
}
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
	<div class="chat-body">
	<div class="chat-scroll">
	<ul class="list-unstyled">
	<c:forEach var="c" items="${cList }">
	<c:if test="${c.userNo eq loginUser.userNo }">
	<li class="media sent">
	<div class="media-body2">
	<div class="msg-box">
	<div>
	<p>${ c.chattingContent }</p>
	<ul class="chat-msg-info">
	<li>
	<div class="chat-time">
	<span>${ c.createDate }</span>
	</div>
	</li>
	</ul>
	</div>
	</div>
	</div>
	</li>
	</c:if>
	<c:if test="${ c.userNo != loginUser.userNo }">
	<li class="media d-flex received">
	<div class="avatar">
	<img src="${c.profile }" alt="" class="w-px-40 h-px-40 rounded-circle">
	</div>
	<div class="media-body">
	<div class="msg-box">
	<div>
	<p>${ c.chattingContent }</p>
	<ul class="chat-msg-info">
	<li>
	<div class="chat-time">
	<span>${ c.createDate }</span>
	</div>
	</li>
	</ul>
	</div>
	</div>
	</div>
	</li>
	</c:if>
	</c:forEach>
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
	<input type="text" class="input-msg-send form-control" id="inputChatting" placeholder="Type something">
	<div class="input-group-append">
	<button type="button" id="send" class="btn msg-send-btn"><i class="bx bx-paper-plane"></i></button>
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
	
	 <script>
        //el태그통해 js변수 셋팅
        const userNo = "${loginUser.userNo}";
        const userEmail = "${loginUser.email}";
        const userName = "${loginUser.userName}";
        const roomNo = "${rno}";
        const profile = "${loginUser.profile}";
        const contextPath = "${contextPath}";

        // /chat이라는 요청주소로 통신할수있는 webSocket 객체 생성 --> /spring/chat
        let chatSocket = new SockJS("http://localhost:8010/nexus/chat");
        //-> websocket 프로토콜을 이용해서 해당주소로 데이터를 송/수신 할수 있다.
        /*	WebSocket
        - 브라우저와 웹 서버간의 전이중 통신을 지원하는 프로토콜
        * 전이중 통신 (full duplex) : 두대의 단말기가 데이터를 동시에 송/수신하기위해 각각 독립된 회선을 사용하는 통신방식
        * HTML5 , JAVA7버전 이상, SPRING 4버전이상에서 지원.
        */
    </script>

	
	
	<script src="${pageContext.request.contextPath}/resources/js/chatting.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/feather.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.slimscroll.min.js""></script>
	<!--  <script src="${pageContext.request.contextPath}/resources/js/chat_script.js"></script>-->
</body>
</html>