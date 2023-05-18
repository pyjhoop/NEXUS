<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

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

    <title>Forgot Password Basic - Pages | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="../assets/img/favicon/favicon.ico" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->
    <!-- Page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/vendor/css/pages/page-auth.css" />
    <!-- Helpers -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/config.js"></script>
  </head>

  <body>
    <!-- Content -->
    <c:if test="${alertMsg != null}">
	    <script>
	        alert("${alertMsg}")
	    </script>
	    <c:remove var="alertMsg" scope="session"/>
    	
    </c:if>

    <div class="container-xxl">
      <div class="authentication-wrapper authentication-basic container-p-y">
        <div class="authentication-inner py-4">
          <!-- Forgot Password -->
          <div class="card">
            <div class="card-body">
              <!-- Logo -->
              <div class="app-brand justify-content-center">
                
                  <span class="app-brand-text demo text-body fw-bolder">NEXUS</span>
              </div>
              <!-- /Logo -->
              <h4 class="mb-2">Change Password 🔒</h4>
              <form id="formAuthentication" class="mb-3" action="resetPwd.p" method="POST">
	              <div class="mb-3">
	                  <label for="userPwd" class="form-label">비밀번호</label>
	                  <input
	                    type="password"
	                    class="form-control"
	                    id="userPwd"
	                    name="userPwd"
	                    placeholder="비밀번호 입력"
	                    autofocus
	                  />
	                </div>
	                <input type="hidden" name="userId" value="${userId }">
                <div class="mb-3">
                  <label for="pwdConfirm" class="form-label">비밀번호 확인</label>
                  <input
                    type="password"
                    class="form-control"
                    id="pwdConfirm"
                    name="pwdConfirm"
                    placeholder="비밀번호 재입력"
                  />
                </div>
                <button type="submit" class="btn btn-primary d-grid w-100" onclick="return pwdCheck();">비밀번호 재설정</button>
              </form>
              <div class="text-center">
                <a href="login.p" class="d-flex align-items-center justify-content-center">
                  <i class="bx bx-chevron-left scaleX-n1-rtl bx-sm"></i>
                  Back to login
                </a>
              </div>
            </div>
          </div>
          <!-- /Forgot Password -->
        </div>
      </div>
    </div>

    <script>
      var sum = 0;
      $(function(){
        $("#userPwd").keyup(function(){
          $(".inf1").remove();
        const regEx = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
        const pwd = $(this);
        if(regEx.test(pwd.val())){
            pwd.after("<span class='text-primary inf1'>사용가능</span>")
            pwd.css("border-color","");
        }else{
            pwd.after("<span class='text-danger inf1'>영문자와 숫자 특수문자를 조합해 8자 이상 입력해주세요</span>")
            pwd.addClass("dis");
        }
    })

    // 비밀번호 재확인 
    $("#pwdConfirm").focusout(function(){
        $(".inf2").remove();
        const pwdFirm = $(this);
        const pwdRaw = $("#userPwd").val();
        if(pwdRaw != ''){
            if(pwdFirm.val() == pwdRaw){
                pwdFirm.after("<span class='text-primary inf2'>비밀번호가 일치합니다</span>")
                pwdFirm.removeClass("dis")
                pwdFirm.css("border-color","");
                sum=1;
            }else if((pwdFirm.val() != pwdRaw )){
                pwdFirm.after("<span class='text-danger inf2'>비밀번호가 일치하지 않습니다</span>")
                pwdFirm.addClass("dis");
            }
        }
    })
      })

      function pwdCheck(){
        if(sum == 1){
          return true;
        }else{
          return false;
        }
      }
    </script>

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/popper/popper.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="${pageContext.request.contextPath}/resources/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>
