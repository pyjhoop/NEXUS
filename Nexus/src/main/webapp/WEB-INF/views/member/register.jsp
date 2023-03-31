<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
<html
  lang="en"
  class="light-style customizer-hide"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Register Basic - Pages | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Favicon -->
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/logo3.png" />
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/assets/vendor/css/pages/page-auth.css" />
    <!-- Helpers -->
    <script src="${ pageContext.request.contextPath }/resources/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${ pageContext.request.contextPath }/resources/assets/js/config.js"></script>
    <!-- jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>

    <!-- register.js-->
    <script src="${ pageContext.request.contextPath }/resources/js/register.js"></script>
  </head>

  <body>
    <!-- Content -->

    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner">
          <!-- Register Card -->
          <div class="card" style="width: 450px;">
            <div class="card-body" >
              <!-- Logo -->
              <div class="app-brand justify-content-center">
                <a href="index.html" class="app-brand-link gap-2">
                	<img src="${ pageContext.request.contextPath }/resources/image/logo1.png" class="app-brand-logo w-px-50 h-auto mt-1" alt="logo" />
                    <span class="app-brand-text demo text-body fw-bolder" style="position:relative; left:-20px; font-size:2.5rem;">NEXUS</span>
                </a>
              </div>
              <!-- /Logo -->
              <h4 class="mb-2">Adventure starts here 🚀</h4>
              <p class="mb-4">Make your app management easy and fun!</p>
				
              <form id="formAuthentication" class="mb-3" action="index.html" method="POST">
                <div class="mb-3">
                  <label for="userId" class="form-label">아이디</label>
                  <input
                    type="text"
                    class="form-control dis"
                    id="userId"
                    name="userId"
                    placeholder="Enter your username"
                    autofocus
                  />
                </div>

                <div class="mb-3">
                  <label for="userPwd" class="form-label">비밀번호</label>
                  <input
                    type="password"
                    class="form-control dis"
                    id="userPwd"
                    name="userPwd"
                    placeholder="Enter your password"
                  />
                </div>

                <div class="mb-3">
                  <label for="pwdConfirm" class="form-label">비밀번호 확인</label>
                  <input
                    type="password"
                    class="form-control dis"
                    id="pwdConfirm"
                    name="pwdConfirm"
                    placeholder="Enter your password again"
                  />
                </div>

                <label for="userName" class="form-label">이름</label>
                <div class="mb-3" style="display: flex;">
                  <input
                    type="text"
                    class="form-control dis"
                    id="userName"
                    name="userName"
                    placeholder="Name"
                    style="margin-right: 10px;"
                  />
                 
                </div>

                <div class="mb-3">
                  <label for="defaultSelect" class="form-label">성별</label>
                  <select id="gemder" class="form-select" name="gender">
                    <option value="">성별</option>
                    <option value="M">남</option>
                    <option value="F">여</option>
                    <option value="O">기타</option>
                  </select>
                </div>

                <div class="mb-3">
                  <label for="email" class="form-label">이메일</label>
                  <input type="text" class="form-control dis" id="email" name="email" placeholder="Enter your email" />
                </div>
                <div style="width: 100%; display: flex; justify-content: flex-end;" class="mb-3">
                  <span id="timer" style="padding-right: 20px; padding-top: 10px;" class="text-primary"></span>
                  <button type="button" class="btn btn-primary" onclick="return firm();">이메일 인증</button>
                </div>

                <div class="mb-3 c" style="display: flex;">
                  <input type="text" class="form-control dis" id="code" name="code" placeholder="Enter Code"  style="width: 70%;"/>
                  <button id="condeFirm" type="button" class="btn btn-primary" style="width:30%">코드인증</button>
                </div>


                <div class="mb-3">
                  <div class="form-check">
                    <input class="form-check-input" type="checkbox" id="terms-conditions" name="terms" />
                    <label class="form-check-label" for="terms-conditions">
                      I agree to
                      <a href="javascript:void(0);">privacy policy & terms</a>
                    </label>
                  </div>
                </div>
                <button type="submit" class="btn btn-primary d-grid w-100" onclick="return final()">회원가입</button>
              </form>

              

              <p class="text-center">
                <span>Already have an account?</span>
                <a href="login">
                  <span>Sign in instead</span>
                </a>
              </p>
            </div>
          </div>
          <!-- Register Card -->
        </div>
      </div>
    </div>


    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="${ pageContext.request.contextPath }/resources/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/assets/vendor/libs/popper/popper.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/assets/vendor/js/bootstrap.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="${ pageContext.request.contextPath }/resources/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="${ pageContext.request.contextPath }/resources/assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>
