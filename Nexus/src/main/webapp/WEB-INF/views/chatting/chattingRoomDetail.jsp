<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/css/bootstrap.min.css' />  -->
<link rel="stylesheet"
	href='${pageContext.request.contextPath}/resources/css/fontawesome.min.css' />
<link rel="stylesheet"
	href='${pageContext.request.contextPath}/resources/css/all.min.css' />
<link rel="stylesheet"
	href='${pageContext.request.contextPath}/resources/css/chat_style.css' />
<style>
.chat-window .chat-scroll {
	height: calc(100vh - 255px);
}

.chat-window .chat-cont-right .chat-body .media.sent .media-body2 {
	align-items: flex-end;
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	margin-left: 0;
}

.chat-window .chat-cont-right .chat-body .media.sent .media-body2 .msg-box>div
	{
	background-color: #e3e3e3;
}

.chat-window .chat-cont-right .chat-body .media.sent .media-body2 .msg-box
	{
	padding-left: 50px;
	position: relative;
}

.chat-window .chat-cont-right .chat-body .media .media-body2 .msg-box>div
	{
	padding: 10px 15px;
	border-radius: 0.25rem;
	display: inline-block;
	position: relative;
}

.chat-window .chat-cont-right .chat-body .media .avatar {
	height: 30px;
	width: 40px;
}

#cnt-name {
	font-size: 3px;
	font-weight: 800;
	padding-top: 8px;
}

.bx {
	vertical-align: middle;
	font-size: 1.6rem;
	line-height: 1;
}

.media-img-wrap {
	margin-right: 15px;
	position: relative;
}

.media2 {
	border-bottom: 1px solid #e5e5e5;
	padding: 10px 15px;
	transition: all .2s ease 0s;
}

.user-name {
	color: #333;
	text-transform: capitalize;
}

.media-body2 {
	display: flex;
	justify-content: space-between;
	width: 100%;
}

.down-link {
	
}

.chat-body {
	height: calc(100vh - 255px);
}

.list-unstyled {
	width: 100%;
	height: 100% !important;
	overflow: auto;
	/*스크롤 처럼*/
	list-style: none;
	padding: 10px 10px;
	z-index: 1;
	positon: absoulte;
}

.chat-invite {
	font-size: 14px;
	margin: 1.875rem 0;
	text-align: center;
}

.chat-img {
	width: 100%;
	height: 100%;
}

.chat-attachment {
	height: 22vh;
	width: 50vw;
}

.down-link {
	font-size: 1.45rem;
}
.btn-icon2{
	position: absolute;
    right: 4px;
    top: 7px;
    z-index: 999;
    
}
#search-btn{
	border:none;
	background-color:#fff;
	border-radius: 20px;
}
a:hover { text-decoration:none !important }
</style>
</head>
<body>
	<jsp:include page="../common/template.jsp" />

	<div class="container-wrapper">
		<div class="container-xxl flex-grow-1 container-p-y">
			<div class="row">
				<div class="col-sm-12">
					<div class="chat-window">
						<div class="chat-cont-left">
							<div class="chat-header">
								<span>Chats</span>
							</div>
							<div class="chat-search">
								<div class="input-group">
									<input type="text" class="form-control" name="search"
										placeholder="Search" id="selectUser">
									<div class="btn-icon2">
										<button class="bx bx-search-alt-2" id="search-btn"></button>
									</div>
								</div>
							</div>
							<div class="chat-users-list">
								<div class="chat-scroll" id="search-user">
									<c:if test="${not empty fList }">
									<c:forEach var="f" items="${ fList }">
									<div class="card-body d-flex">
									<div class="media-img-wrap">
									<div class="avatar">
									<img src="${f.profile }" alt="" class="avatar-img rounded-circle">
									</div>
									</div>
									<div class="media-body2">
									<div>
									<div class="user-name">
									${f.userName }
									</div>
									<div>
									userCode : ${f.userNo }
									</div>
									</div>
									<div>
									<input type="radio" class="form-check-input" name="chat-check" value="${f.userNo }">
									</div>
									</div>
									</div>
									<hr class="m-0">
									</c:forEach>
									</c:if>
								</div>
							</div>
						</div>
						<div class="chat-cont-right">
							<a id="back_user_list" href="" class="back-user-list"> </a>
							<c:choose>
								<c:when test="${cr.numberParticipants > 2}">
									<div class="chat-header">
										<div class="media d-flex">
											<div class="media-img-wrap">
												<div class="avatar">
													<img src="${cr.changeName }" alt=""
														class="avatar-img rounded-circle">
												</div>
											</div>
											<div class="media-body">
												<div class="user-name">${cr.roomTitle }</div>
											</div>
										</div>
										<div class="chat-options">
											<div class="btn-group">
												<a href=""						
                            						class="btn-icon dropdown-toggle hide-arrow"
													data-bs-toggle="dropdown" aria-expanded="false">
												<i
													class='bx bx-dots-vertical-rounded'
													style="font-size: 1.6rem;"></i>
												</a>
												<ul class="dropdown-menu dropdown-menu-end">
													<li><a class="dropdown-item"
														href="javascript:history.back(-1);">뒤로가기</a></li>
													<li><hr class="dropdown-divider" /></li>
													<li><div class="dropdown-item" href="" id="gRoom-exit">채팅방
															나가기</div></li>
													<li>
														<hr class="dropdown-divider" />
													</li>
													<li><div class="dropdown-item" href="" id="invite">초대하기</div></li>
												</ul>
											</div>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div class="chat-header">
										<div class="media d-flex">
											<div class="media-img-wrap">
												<div class="avatar">
													<img src="${oUser.profile  }" alt=""
														class="avatar-img rounded-circle">
												</div>
											</div>
											<div class="media-body">
												<div class="user-name">${oUser.userName  }</div>
											</div>
										</div>
										<div class="chat-options">

											<div class="btn-group">
												<a href=""
													;
                            class="btn-icon dropdown-toggle hide-arrow"
													data-bs-toggle="dropdown" aria-expanded="false"> <i
													class='bx bx-dots-vertical-rounded'
													style="font-size: 1.6rem;"></i>
												</a>
												<ul class="dropdown-menu dropdown-menu-end">
													<li><a class="dropdown-item"
														href="javascript:history.back(-1);">뒤로가기</a></li>
													<li><hr class="dropdown-divider" /></li>
													<li><a class="dropdown-item"
														href="exitRoom.ih?roomNo=${ rno }&userNo=${loginUser.userNo}">채팅방
															나가기</a></li>
												</ul>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
							<div class="chat-body">
								<ul class="list-unstyled" id="room-scroll2">
									<c:forEach var="c" items="${cList }">
										<c:choose>
											<c:when test="${c.invite eq 'O' || c.invite eq 'Z'}">
												<li class="chat-invite">${ c.chattingContent }</li>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${c.userNo eq loginUser.userNo }">
														<li class="media sent">
															<div class="media-body2">
																<div class="msg-box">
																	<div>
																		<c:choose>
																			<c:when test="${c.invite != 'F'}">
																				<p>${ c.chattingContent }</p>
																				<ul class="chat-msg-info">
																					<li>
																						<div class="chat-time">
																							<span>${ c.createDate }</span>
																						</div>
																					</li>
																				</ul>
																			</c:when>
																			<c:otherwise>
																				<div class="chat-msg-attachments">
																					<c:choose>
																						<c:when test="${empty c.chattingContent}">
																							<div class="chat-attachment">
																								<img src="${c.changeName }" class="chat-img">
																								<div class="chat-attach-caption">${c.originName }</div>
																								<a href="${c.changeName }"
																									download="${c.originName }"
																									class="chat-attach-download"> <i
																									class="bx bxs-download"></i>
																								</a>
																						</c:when>
																						<c:otherwise>
																							<div>
																								<a href="${c.changeName }"
																									download="${c.originName }"> ${c.originName }
																									<i class="bx bxs-download down-link"></i>
																								</a>
																						</c:otherwise>
																					</c:choose>
																				</div>
																	</div>
																	<ul class="chat-msg-info">
																		<li>
																			<div class="chat-time">
																				<span>${ c.createDate }</span>
																			</div>
																		</li>
																	</ul>
											</c:otherwise>
										</c:choose>
							</div>
						</div>
					</div>
					</li>
					</c:when>
					<c:otherwise>
						<li class="media d-flex received">
							<div class="avatar">
								<img src="${c.profile }" alt=""
									class="w-px-40 h-px-40 rounded-circle"> <br>
								<div id="cnt-name">${c.userName }</div>
							</div>
							<div class="media-body">
								<div class="msg-box">
									<div>
										<c:choose>
											<c:when test="${c.invite != 'F'}">

												<p>${ c.chattingContent }</p>
												<ul class="chat-msg-info">
													<li>
														<div class="chat-time">
															<span>${ c.createDate }</span>
														</div>
													</li>
												</ul>
											</c:when>
											<c:otherwise>
												<div class="chat-msg-attachments">
													<c:choose>
														<c:when test="${empty c.chattingContent}">
															<div class="chat-attachment">
																<img src="${c.changeName }" class="chat-img">
																<div class="chat-attach-caption">${c.originName }</div>
																<a href="${c.changeName }" download="${c.originName }"
																	class="chat-attach-download"> <i
																	class="bx bxs-download"></i>
																</a>
															</div>
														</c:when>
														<c:otherwise>
															<div>
																<a href="${c.changeName }" download="${c.originName }">
																	${c.originName } <i class="bx bxs-download down-link"></i>
																</a>
															</div>
														</c:otherwise>
													</c:choose>
												</div>
												<ul class="chat-msg-info">
													<li>
														<div class="chat-time">
															<span>${ c.createDate }</span>
														</div>
													</li>
												</ul>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</li>
					</c:otherwise>
					</c:choose>
					</c:otherwise>
					</c:choose>
					</c:forEach>
					</ul>
				</div>
				<div class="chat-footer">
					<div class="input-group">
						<div class="input-group-prepend">
							<form id="m_fileForm">
								<div class="btn-file btn">
									<i class="bx bx-paperclip" style="font-size: 1.5rem;"></i> 
									<input type="file" id="m-file">
								</div>
							</form>
						</div>
						<input type="text" class="input-msg-send form-control"
							id="inputChatting" placeholder="Type something">
						<div class="input-group-append">
							<button type="button" id="send" class="btn msg-send-btn">
								<i class="bx bx-paper-plane"></i>
							</button>
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
	<script
		src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

	<script>
		//el태그통해 js변수 셋팅
		const userNo = "${loginUser.userNo}";
		const userEmail = "${loginUser.email}";
		const userName = "${loginUser.userName}";
		const roomNo = "${cr.roomNo}";
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

		$("#search-btn").click(function() {
							console.log($("#selectUser").val());
							$.ajax({
										url : "searchPlus.ih",
										data : {
											search : $("#selectUser").val(),
											userNo : userNo
										},
										success : function(result) {
											console.log(result);

											let value = "";

											for ( let i in result) {
												value += "<div class='card-body d-flex'>"
														+ "<div class='media-img-wrap'>"
														+ "<div class='avatar'>"
														+ "<img src= " 
        				   								+ result[i].profile 
        				  								+" class='avatar-img rounded-circle'>"
														+ "</div>"
														+ "</div>"
														+ "<div class='media-body2'>"
														+ "<div>"
														+ "<div class='user-name'>"
														+ result[i].userName
														+ "</div>"
														+ "<div>" 
									     				+ "userCode : "
									     				+ result[i].userNo 
									     			    + "</div>"
														+ "</div>"
														+ "<div>"
														+ "<input type='radio' class= " 
								        				+ "'form-check-input'" 
								        				+ " name='chat-check' value=" 
								        				+ result[i].userNo 
								        				+ ">"
								        				+ "</div>"
														+ "</div>"
														+ "</div>"
														+ "<hr class='m-0'>";
											}

											console.log(value);

											$("#search-user").html(value);
										},
										error : function() {
											console.log('ajax 실패');
										}
									})
						});
		let checkName = "";
		$("#invite").click(function() {
			$('input:radio[name=chat-check]').each(function() {
				if ($(this).is(":checked") == true) {
					checkName = $(this).parent().parent().find('.user-name').text();
					const chatMessage = {
						"userNo" : $(this).val(),
						"userName" : checkName,
						"roomNo" : roomNo,
						"invite" : 'O'
					};
					console.log(chatMessage);

					chatSocket.send(JSON.stringify(chatMessage));
				}

			});

		});
		$("#gRoom-exit").click(function() {
			const chatMessage = {
				"userNo" : userNo,
				"userName" : userName,
				"roomNo" : roomNo,
				"invite" : 'Z'
			};
			console.log(chatMessage);
			chatSocket.send(JSON.stringify(chatMessage));

		});

		$(function() {

			$("#m-file").change(
					function(e) {
						var formData = new FormData();

						formData.append("file", $('#m-file')[0].files[0]);
						formData.append("userNo", userNo);
						formData.append("roomNo", roomNo);

						$.ajax({
							url : "fileChat.ih",
							data : formData,
							type : "POST",
							async : true,
							processData : false,
							contentType : false,
							enctype : "multipart/form-data",
							success : function(result) {

								let ext = result.originName.split('.').pop()
										.toLowerCase();

								if ($.inArray(ext, [ 'jpg', 'jpeg', 'png',
										'gif' ]) != -1) {
									const chatMessage = {
										"chattingContent" : '사진을 보냈습니다.',
										"roomNo" : roomNo,
										"userNo" : userNo,
										"invite" : 'F',
										"originName" : result.originName,
										"changeName" : result.changeName,
										"profile" : profile,
										"userName" : userName
									};

									chatSocket
											.send(JSON.stringify(chatMessage));
									return false;
								} else {
									const chatMessage = {
										"chattingContent" : '파일: '
												+ result.originName,
										"roomNo" : roomNo,
										"userNo" : userNo,
										"invite" : 'F',
										"originName" : result.originName,
										"changeName" : result.changeName,
										"profile" : profile,
										"userName" : userName
									};

									chatSocket
											.send(JSON.stringify(chatMessage));
									return false;
								}

							},
							error : function() {
								console.log("ajax 통신 실패");
							}

						});

					});

		});
	</script>



	<!--  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>-->
	<script
		src="${pageContext.request.contextPath}/resources/js/feather.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.slimscroll.min.js""></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/chatting.js"></script>
	<!--  <script src="${pageContext.request.contextPath}/resources/js/chat_script.js"></script>-->
</body>
</html>