<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

<meta name="description" content="" />

<!-- 드롭다운 충돌 방지 -->
<script src="/static/js/bootstrap.bundle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>






<!-- Favicon -->
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/logo3.png" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/fonts/boxicons.css" />

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">

<!-- Vendors CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<!-- jQuery and Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
<script src="../../../resources/js/apexcharts.js"></script>
<script src="../../../resources/js/bootstrap.js"></script>

<!-- Page CSS -->

<!-- Helpers -->
<script src="${pageContext.request.contextPath}/resources/assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="${pageContext.request.contextPath}/resources/assets/js/config.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/core.css" class="template-customizer-core-css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/apex-charts/apex-charts.css" />

<!-- Page CSS -->

<!-- Helpers -->
<script src="${pageContext.request.contextPath}/resources/assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script src="${pageContext.request.contextPath}/resources/assets/js/config.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- chatbot -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/chat.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/home.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<!-- 알람창 JavaScript -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

<!-- 알람창 CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!--  알람창 Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<!--  알람창 Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />


<!-- 알람 종 js -->
<script src="${pageContext.request.contextPath}/resources/js/alarm.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/alarm.css" />

<script src="resources/js/template.js"></script>
</head>

<body>


	<c:if test="${not empty alertMsg }">
		<script>
			//alertify.alert("${alertMsg}");
			$("#inputToken").click();
		</script>

		<c:remove var="alertMsg" scope="session" />
	</c:if>


	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->

			<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
				<div class="app-brand demo" style="height: 40px;">
					<a href="main.p" class="app-brand-link">
						<span class="app-brand-text demo menu-text fw-bolder ms-2 text-primary">NEXUS</span>
					</a>
					<a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
						<i class="bx bx-chevron-left bx-sm align-middle"></i>
					</a>
				</div>
				<c:if test="${ repoName != null }">
					<span style="margin-left: 5px; margin-top: 5px; margin-left: 40px;" class="text-primary">(${repoName})</span>
				</c:if>


				<div class="menu-inner-shadow"></div>

				<ul class="menu-inner py-1">
					<!-- Dashboard -->
					<li class="menu-item"><a href="main.p" class="menu-link">
							<i class="menu-icon tf-icons bx bx-home-circle"></i>
							<div data-i18n="Analytics">Home</div>
						</a></li>
					<li class="menu-item" id="repository"><a href="repository.p" onclick="return tokenCheck();" class="menu-link">
							<i class="menu-icon tf-icons bx bxl-github"></i>
							<div data-i18n="Basic">Repository</div>
						</a></li>

					<!-- Components -->
					<li class="menu-header small text-uppercase"><span class="menu-header-text">Project</span></li>
					<!-- Cards -->

					<li class="menu-item"><a href="issueShow.mini" onclick="return repoCheck();" class="menu-link">
							<i class="menu-icon tf-icons bx bx-collection"></i>
							<div data-i18n="Basic">Issue</div>
						</a></li>
					<li class="menu-item"><a href="milestoneList.m" onclick="return repoCheck();" class="menu-link">
							<i class="menu-icon tf-icons bx bx-box"></i>
							<div data-i18n="User interface">Milestone</div>
						</a></li>
					<li class="menu-item"><a href="#" onclick="return repoCheck();" class="menu-link">
							<i class="menu-icon tf-icons bx bx-copy"></i>
							<div data-i18n="Extended UI">Kanban</div>
						</a></li>

					<script>
						function tokenCheck() {
							if ("${loginUser.token}" == "") {
								//모달 클릭 한 뒤 return false
								//$("#eMsg").click();
								$("#inputToken").click();
								return false;
							} else {
								return true;
							}
						}

						function repoCheck() {
							if ("${repoName}" == "") {
								$(".errMsg").html("레파지토리 선택후 이용이 가능합니다.");
								$("#eMsg").click();
								//alertify.alert("레파지토리 선택후 이용이 가능합니다.");
								return false;

							} else {
								return true;
							}
						}
					</script>



					<li class="menu-item news"><a href="news.p" class="menu-link">
						<i class="menu-icon tf-icons bx bx-detail"></i>
						<div data-i18n="Form Elements">News</div>
					</a></li>
				<li class="menu-item"><a href="selectCal.ih" class="menu-link">
						<i class="menu-icon tf-icons bx bxs-calendar"></i>
						<div data-i18n="Tables">Calendar</div>
					</a></li>
				<!-- Misc -->
				<li class="menu-header small text-uppercase"><span class="menu-header-text">Team</span></li>
				<li class="menu-item"><a href="selectChat.ih" target="_blank" class="menu-link">
						<i class="menu-icon tf-icons bx bx-message-rounded-dots"></i>
						<div data-i18n="Support">Chatting</div>
					</a></li>
				<li class="menu-item"><a href="#" target="_blank" class="menu-link">
						<i class="menu-icon tf-icons bx bx-bot"></i>
						<div data-i18n="Support">Chattbot</div>
					</a></li>
				<li class="menu-item"><a href="personal.me" target="_blank" class="menu-link">
						<i class="menu-icon tf-icons  bx bxs-megaphone"></i>
						<div data-i18n="Documentation">Personal Pr</div>
					</a></li>
				<li class="menu-item"><a href="project.re" class="menu-link ">
						<i class="menu-icon tf-icons bx bxs-group"></i>
						<div data-i18n="Form Layouts">Recruit</div>
					</a></li>
				<li class="menu-item"><a href="friend.me" class="menu-link">
						<i class="menu-icon tf-icons bx bx-user-plus"></i>
						<div data-i18n="Form Elements">Friend</div>
					</a></li>
			</ul>

			</aside>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->

				<nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">
					<div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
						<a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
							<i class="bx bx-menu bx-sm"></i>
						</a>
					</div>

					<div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
						<!-- Search -->
						<div class="navbar-nav align-items-center">
							<div class="nav-item d-flex align-items-center">
								<i class="bx bx-search fs-4 lh-0"></i>
								<input type="text" class="form-control border-0 shadow-none" placeholder="Search..." aria-label="Search..." />
							</div>
						</div>
						<!-- /Search -->
						<ul class="navbar-nav flex-row align-items-center ms-auto">

							<button class="btn btn-outline-primary" id="enroll" style="visibility: hidden;">뉴스등록</button>

							<button type="button" id="repobtn" style="display: none;" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#basicModal">new repository</button>
							<!-- Place this tag where you want the button to render. -->
							<li class="nav-item 1h-1 me-4">
								<!-- <a href="javascript:void(0);"class="menu-link position-relative">  --> <a class="nav-link dropdown-toggle hide-arrow menu-link " href="javascript:void(0);" data-bs-toggle="dropdown" style="padding-top: 0px; padding-bottom: 0px; width: 35px;">



									<c:if test="${not empty updateBellIcon}">
										<script>
											$(function() {
												updateBellIcon();
											});
										</script>
									</c:if>


									<script>
									document.addEventListener('DOMContentLoaded', function() {
									  const cleanBtn = document.querySelector('.cleanBtn');
									  if (cleanBtn) {
									    cleanBtn.addEventListener('click', function() {
									      const parentElement = document.querySelector('.issueAlerm').parentElement;

									      const targetElement = parentElement.querySelector('.issueAlerm');
									      if (targetElement) {
									        targetElement.remove();
									      }
									    });
									  }
									});

									$(document).ready(function() {
									  $('.ringring').click(function() {
									    $('.redpoint').addClass('visually-hidden');
									  });
									});


									</script>


									<span class="position-absolute top-0 start-100 translate-middle badge border border-light rounded-circle bg-danger p-1 visually-hidden redpoint"> </span> <i class="menu-icon tf-icons bx bx-bell bx-md ringring"></i>



								</a> <!-- 집어 넣어봄-->

								<ul class="dropdown-menu dropdown-menu-end">


					<!--  이슈 변화가 있을때마다 숫자가 계속 누적되는것도 고민 -->

									<li class="alermLi"><span id="alermMsg" class="dropdown-item alermA" href="#"> 99개의 새로운 알림이 있습니다 </span>
										<button type="button" class="btn btn-outline-danger btn-sm cleanBtn" onclick="deleteTie()">CLEAN</button></li>


								<!-- tie가 for문을 돌아야함 / a태그안에는 issueDetail.mini?ino=${i.number}를 집어넣어야하니 고민 ### -->


								
								

									<div class="tie">

										<li>
											<div class="dropdown-divider"></div>
										</li>

										<a class="boxsize" href="#">
											<li class="issueAlerm">
												<div class="d-flex align-items-center">
													<div class="avatar alarmprofile">
														<img src="${loginUser.profile }" alt class="w-px-40 h-auto rounded-circle" />
													</div>
													<span class="align-middle spanbox pl-3">${authorName}님이 ${issueTitle}를 생성했습니다</span>
												</div>
											</li>
										</a>
										
									</div>


								<div class="tie">

										<li>
											<div class="dropdown-divider"></div>
										</li>

										<a class="boxsize" href="#">
											<li class="issueAlerm">
												<div class="d-flex align-items-center">
													<div class="avatar alarmprofile">
														<img src="${loginUser.profile }" alt class="w-px-40 h-auto rounded-circle" />
													</div>
													<span class="align-middle spanbox pl-3">${authorName}님이 ${issueTitle}를 생성했습니다</span>
												</div>
											</li>
										</a>
										
									</div>



								</ul> <!-- User -->
							<li class="nav-item navbar-dropdown dropdown-user dropdown"><a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
									<div class="avatar avatar-online">

										<img src="${loginUser.profile }" alt class="w-px-40 h-px-40 rounded-circle" />

									</div>
								</a>
								<ul class="dropdown-menu dropdown-menu-end">
									<li><a class="dropdown-item" href="#">
											<div class="d-flex">
												<div class="flex-shrink-0 me-3">
													<div class="avatar avatar-online">


														<img src="${loginUser.profile }" alt class="w-px-40 h-px-40 rounded-circle" />

													</div>
												</div>
												<div class="flex-grow-1">
													<span class="fw-semibold d-block">${loginUser.userName }</span> <small class="text-muted">Admin</small>
												</div>
											</div>
										</a></li>
									<li>
										<div class="dropdown-divider"></div>
									</li>
									<li><a class="dropdown-item" href="selectMy.ih">
											<i class="bx bx-user me-2"></i> <span class="align-middle">My Profile</span>
										</a></li>
									<li><a class="dropdown-item" href="#">
											<i class="bx bx-cog me-2"></i> <span class="align-middle">Settings</span>
										</a></li>

									<li>
										<div class="dropdown-divider"></div>
									</li>
									<li><c:choose>
											<c:when test="${loginUser.social eq 'K'}">
												<a class="dropdown-item" href="https://kauth.kakao.com/oauth/logout?client_id=c2b8f2ae81e7206df597a694d983c1ee&logout_redirect_uri=http://localhost:8010/nexus/logout">
													<i class="bx bx-power-off me-2"></i> <span class="align-middle">Log Out</span>
												</a>
											</c:when>
											<c:otherwise>
												<a class="dropdown-item" href="logout">
													<i class="bx bx-power-off me-2"></i> <span class="align-middle">Log Out</span>
												</a>
											</c:otherwise>
										</c:choose></li>
								</ul></li>
						</ul>
					</div>
				</nav>




				<script>
					
				</script>



				<!-- CHAT BAR BLOCK to be changed to a bubble-->
				<div class="chat-bar-collapsible">
					<button id="chat-button" type="button" class="collapsible">
						Chat with us! <i id="chat-icon" style="color: #fff;" class="fa fa-fw fa-comments-o"></i>
					</button>

					<div class="content">
						<div class="full-chat-block">
							<!-- Message Container -->
							<div class="outer-container">
								<div class="chat-container">
									<!-- Messages -->
									<div id="chatbox">
										<h5 id="chat-timestamp"></h5>
										<p id="botStarterMessage" class="botText">
											<span>Loading...</span>
										</p>
									</div>

									<!-- User input box -->
									<div class="chat-bar-input-block">
										<div id="userInput">
											<input id="textInput" class="input-box" type="text" name="msg" placeholder="Tap 'Enter' to send a message">
											<p></p>
										</div>

										<div class="chat-bar-icons">
											<i id="chat-icon" style="color: crimson;" class="fa fa-fw fa-heart" onclick="heartButton()"></i> <i id="chat-icon" style="color: #333;" class="fa fa-fw fa-send" onclick="sendButton()"></i>
										</div>
									</div>

									<div id="chat-bar-bottom">
										<p></p>
									</div>

								</div>
							</div>

						</div>
					</div>

				</div>

				<!-- 토큰 입력 모달 -->
				<button type="button" id="inputToken" style="display: none;" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#tokenModal"></button>

				<div class="modal fade" id="tokenModal" tabindex="-1" aria-hidden="true" style="display: none;">
					<div class="modal-dialog" role="document">
						<form action="enrollToken" method="post">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel1">깃허브 토큰 입력</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body">
									<div class="row">
										<div class="col mb-3">
											<label for="gitToken" class="form-label">토큰</label>
											<input type="text" id="gitToken" name="token" class="form-control" placeholder="Enter Token">
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" id="closeModal" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>
									<button type="button" id="tokenSubmit" class="btn btn-primary">등록</button>
								</div>
							</div>
						</form>
					</div>
				</div>

				<button type="button" id="eMsg" style="display: none;" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#errorModal"></button>

				<div class="modal fade" id="errorModal" tabindex="-1" aria-hidden="true" style="display: none;">
					<div class="modal-dialog" role="document">
						<form action="enrollToken" method="post">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title text-danger" id="exampleModalLabel1">에러</h4>
									<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
								</div>
								<div class="modal-body errMsg">
									<c:if test="${not empty alertMsg }">
							${alertMsg}
						</c:if>
								</div>
								<div class="modal-footer">
									<button type="button" id="closeModal" class="btn btn-outline-secondary" data-bs-dismiss="modal">Close</button>

								</div>
							</div>
						</form>
					</div>
				</div>







				<!-- Core JS -->
				<!-- build:js assets/vendor/js/core.js -->
				<script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery/jquery.js"></script>
				<script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/popper/popper.js"></script>
				<script src="${pageContext.request.contextPath}/resources/assets/vendor/js/bootstrap.js"></script>
				<script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

				<script src="${pageContext.request.contextPath}/resources/assets/vendor/js/menu.js"></script>
				<!-- endbuild -->

				<!-- Vendors JS -->
				<script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/apex-charts/apexcharts.js"></script>

				<!-- Main JS -->
				<script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

				<!-- Page JS -->
				<script src="${pageContext.request.contextPath}/resources/assets/js/dashboards-analytics.js"></script>

				<!-- Place this tag in your head or just before your close body tag. -->
				<script async defer src="https://buttons.github.io/buttons.js"></script>

				<!-- chatbot -->
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
				<script src="${pageContext.request.contextPath}/resources/static/scripts/responses.js"></script>
				<script src="${pageContext.request.contextPath}/resources/static/scripts/chat.js"></script>
</body>
</html>
