<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
 -->
<!-- beautify ignore:start -->
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

<title>Dashboard - Analytics | Sneat - Bootstrap 5 HTML Admin
	Template - Pro</title>

<meta name="description" content="" />

<!-- Favicon -->
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/assets/img/favicon/favicon.ico" />

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
	rel="stylesheet" />

<!-- Icons. Uncomment required icon fonts -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/fonts/boxicons.css" />

<!-- Core CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/demo.css" />

<!-- Vendors CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/vendor/libs/apex-charts/apex-charts.css" />

<!-- Page CSS -->

<!-- Helpers -->
<script
	src="${pageContext.request.contextPath}/resources/assets/vendor/js/helpers.js"></script>

<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
<script
	src="${pageContext.request.contextPath}/resources/assets/js/config.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

 <!-- chatbot -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/chat.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- jquery-->

</head>

<body>

	<!-- Layout wrapper -->
	<div class="layout-wrapper layout-content-navbar">
		<div class="layout-container">
			<!-- Menu -->

			<aside id="layout-menu"
				class="layout-menu menu-vertical menu bg-menu-theme">
				<div class="app-brand demo">
					<a href="main.p" class="app-brand-link"> <span
						class="app-brand-text demo menu-text fw-bolder ms-2">NEXUS</span>
					</a> <a href="javascript:void(0);"
						class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
						<i class="bx bx-chevron-left bx-sm align-middle"></i>
					</a>
				</div>

				<div class="menu-inner-shadow"></div>

				<ul class="menu-inner py-1">
					<!-- Dashboard -->
					<li class="menu-item active"><a href="main.p"
						class="menu-link"> <i
							class="menu-icon tf-icons bx bx-home-circle"></i>
							<div data-i18n="Analytics">Home</div>
					</a></li>
					<li class="menu-item" id="repository"><a href="repository.p"
						class="menu-link"> <i class="menu-icon tf-icons bx bxl-github"></i>
							<div data-i18n="Basic">Repository</div>
					</a></li>
					<!-- Components -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">Project</span></li>
					<!-- Cards -->
					<li class="menu-item"><a href="#" class="menu-link"> <i
							class="menu-icon tf-icons bx bx-collection"></i>
							<div data-i18n="Basic">Issue</div>
					</a></li>
					<li class="menu-item"><a href="#" class="menu-link"> <i
							class="menu-icon tf-icons bx bx-box"></i>
							<div data-i18n="User interface">Milestone</div>
					</a></li>

					<li class="menu-item"><a href="#" class="menu-link"> <i
							class="menu-icon tf-icons bx bx-copy"></i>
							<div data-i18n="Extended UI">Kanban</div>
					</a></li>

					<li class="menu-item"><a href="#" class="menu-link"> <i
							class="menu-icon tf-icons bx bxl-wikipedia"></i>
							<div data-i18n="Boxicons">Wiki</div>
					</a></li>
					<li class="menu-item"><a href="#" class="menu-link"> <i
							class="menu-icon tf-icons bx bx-detail"></i>
							<div data-i18n="Form Elements">News</div>
					</a></li>
					<li class="menu-item"><a href="#" class="menu-link"> <i
							class="menu-icon tf-icons bx bxs-calendar"></i>
							<div data-i18n="Tables">Calendar</div>
					</a></li>
					<!-- Misc -->
					<li class="menu-header small text-uppercase"><span
						class="menu-header-text">Team</span></li>
					<li class="menu-item"><a href="#" target="_blank"
						class="menu-link"> <i
							class="menu-icon tf-icons bx bx-message-rounded-dots"></i>
							<div data-i18n="Support">Chatting</div>
					</a></li>
					<li class="menu-item"><a href="#" target="_blank"
						class="menu-link"> <i
							class="menu-icon tf-icons bx bx-bot"></i>
							<div data-i18n="Support">Chattbot</div>
					</a></li>
					<li class="menu-item"><a href="personal.me" target="_blank"
						class="menu-link"> <i
							class="menu-icon tf-icons  bx bxs-megaphone"></i>
							<div data-i18n="Documentation">Personal Pr</div>
					</a></li>
					<li class="menu-item"><a href="javascript:void(0);"
						class="menu-link "> <i class="menu-icon tf-icons bx bxs-group"></i>
							<div data-i18n="Form Layouts">Recruit</div>
					</a></li>
					<li class="menu-item"><a href="javascript:void(0);"
						class="menu-link"> <i
							class="menu-icon tf-icons bx bx-user-plus"></i>
							<div data-i18n="Form Elements">Friend</div>
					</a></li>
				</ul>

			</aside>
			<!-- / Menu -->

			<!-- Layout container -->
			<div class="layout-page">
				<!-- Navbar -->

				<nav
					class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
					id="layout-navbar">
					<div
						class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
						<a class="nav-item nav-link px-0 me-xl-4"
							href="javascript:void(0)"> <i class="bx bx-menu bx-sm"></i>
						</a>
					</div>

					<div class="navbar-nav-right d-flex align-items-center"
						id="navbar-collapse">
						<!-- Search -->
						<div class="navbar-nav align-items-center">
							<div class="nav-item d-flex align-items-center">
								<i class="bx bx-search fs-4 lh-0"></i> <input type="text"
									class="form-control border-0 shadow-none"
									placeholder="Search..." aria-label="Search..." />
							</div>
						</div>
						<!-- /Search -->

						<ul class="navbar-nav flex-row align-items-center ms-auto">
							<!-- Place this tag where you want the button to render. -->
							<li class="nav-item 1h-1 me-4"><a href="javascript:void(0);"
								class="menu-link "> <i class='menu-icon tf-icons bx bx-bell'></i>
							</a></li>

							<!-- User -->
							<li class="nav-item navbar-dropdown dropdown-user dropdown">
								<a class="nav-link dropdown-toggle hide-arrow"
								href="javascript:void(0);" data-bs-toggle="dropdown">
									<div class="avatar avatar-online">
										<img src="${loginUser.profile }" alt
											class="w-px-40 h-auto rounded-circle" />
									</div>
							</a>
								<ul class="dropdown-menu dropdown-menu-end">
									<li><a class="dropdown-item" href="#">
											<div class="d-flex">
												<div class="flex-shrink-0 me-3">
													<div class="avatar avatar-online">
														<img src="${loginUser.profile }" alt
															class="w-px-40 h-auto rounded-circle" />
													</div>
												</div>
												<div class="flex-grow-1">
													<span class="fw-semibold d-block">${loginUser.userName }</span>
													<small class="text-muted">Admin</small>
												</div>
											</div>
									</a></li>
									<li>
										<div class="dropdown-divider"></div>
									</li>
									<li><a class="dropdown-item" href="#"> <i
											class="bx bx-user me-2"></i> <span class="align-middle">My
												Profile</span>
									</a></li>
									<li><a class="dropdown-item" href="#"> <i
											class="bx bx-cog me-2"></i> <span class="align-middle">Settings</span>
									</a></li>

									<li>
										<div class="dropdown-divider"></div>
									</li>
									<li><c:choose>
											<c:when test="${loginUser.social eq 'K'}">
												<a class="dropdown-item"
													href="https://kauth.kakao.com/oauth/logout?client_id=c2b8f2ae81e7206df597a694d983c1ee&logout_redirect_uri=http://localhost:8010/nexus/logout">
													<i class="bx bx-power-off me-2"></i> <span
													class="align-middle">Log Out</span>
												</a>
											</c:when>
											<c:when test="${ loginUser.social eq 'G' }">
												<a class="dropdown-item" href="logout.p"> <i
													class="bx bx-power-off me-2"></i> <span
													class="align-middle">Log Out</span>
												</a>
											</c:when>
											<c:otherwise>
												<a class="dropdown-item" href="logout"> <i
													class="bx bx-power-off me-2"></i> <span
													class="align-middle">Log Out</span>
												</a>
											</c:otherwise>
										</c:choose></li>
								</ul>
							</li>
						</ul>
					</div>
				</nav>
				
				<!-- CHAT BAR BLOCK -->
    <div class="chat-bar-collapsible">
        <button id="chat-button" type="button" class="collapsible">Chat with us!
            <i id="chat-icon" style="color: #fff;" class="fa fa-fw fa-comments-o"></i>
        </button>

        <div class="content">
            <div class="full-chat-block">
                <!-- Message Container -->
                <div class="outer-container">
                    <div class="chat-container">
                        <!-- Messages -->
                        <div id="chatbox">
                            <h5 id="chat-timestamp"></h5>
                            <p id="botStarterMessage" class="botText"><span>Loading...</span></p>
                        </div>

                        <!-- User input box -->
                        <div class="chat-bar-input-block">
                            <div id="userInput">
                                <input id="textInput" class="input-box" type="text" name="msg"
                                    placeholder="Tap 'Enter' to send a message">
                                <p></p>
                            </div>

                            <div class="chat-bar-icons">
                                <i id="chat-icon" style="color: crimson;" class="fa fa-fw fa-heart"
                                    onclick="heartButton()"></i>
                                <i id="chat-icon" style="color: #333;" class="fa fa-fw fa-send"
                                    onclick="sendButton()"></i>
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

	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery/jquery.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/popper/popper.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/js/bootstrap.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/js/menu.js"></script>
	<!-- endbuild -->

	<!-- Vendors JS -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/vendor/libs/apex-charts/apexcharts.js"></script>

	<!-- Main JS -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

	<!-- Page JS -->
	<script
		src="${pageContext.request.contextPath}/resources/assets/js/dashboards-analytics.js"></script>

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>
	
	 <!-- chatbot -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/static/scripts/responses.js"></script>
	<script src="${pageContext.request.contextPath}/resources/static/scripts/chat.js"></script>
</body>

</html>
