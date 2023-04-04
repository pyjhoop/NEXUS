<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% System.out.print(session.getAttribute("member")); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- favicon-->
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/logo3.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body>
	<jsp:include page="common/template.jsp"/>
	<div class="container-xxl flex-grow-1 container-p-y">
        <div class="row mb-5">
            <div class="col-md-6 col-lg-3 mb-3">
              <div class="card h-100">
                <div style="display: flex; justify-content: space-around;">
                    <img class="card-img-top" src="${ member.profile }" alt="Card image cap" style="width: 100px; border-radius: 50%;"/>
                    <h4 class="card-title mt-5">${member.userName}</h4>
                </div>
                <div class="card-body">
                  <!-- <h5 class="card-title">Card title</h5> -->
                  <h5 class="card-title">About me</h5>
                  <p class="card-text">
                    반갑습니다.
                  </p>
                  <div>
                    <img src="${pageContext.request.contextPath}/resources/image/phone.png" alt="" id="phoneImg">
                    <span>010-1111-2222</span>
                  </div>
                  <br>
                  <div>
                    <img src="${pageContext.request.contextPath}/resources/image/email.png" alt="" id="email">
                    <span>pyjhoop@naver.com</span>
                  </div>
                  <br>
                  <div>
                    <img src="${pageContext.request.contextPath}/resources/image/url.png" alt="" id="url">
                    <span><a href="www.github.com"> www.github.com</a></span>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-4 mb-3">
              <div class="card h-100">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <h6 class="card-subtitle text-muted">Support card subtitle</h6>
                </div>
                <img class="img-fluid" src="../assets/img/elements/13.jpg" alt="Card image cap" />
                <div class="card-body">
                  <p class="card-text">Bear claw sesame snaps gummies chocolate.</p>
                  <a href="javascript:void(0);" class="card-link">Card link</a>
                  <a href="javascript:void(0);" class="card-link">Another link</a>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-lg-4 mb-3">
              <div class="card h-100">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <h6 class="card-subtitle text-muted">Support card subtitle</h6>
                  <img
                    class="img-fluid d-flex mx-auto my-4"
                    src="../assets/img/elements/4.jpg"
                    alt="Card image cap"
                  />
                  <p class="card-text">Bear claw sesame snaps gummies chocolate.</p>
                  <a href="javascript:void(0);" class="card-link">Card link</a>
                  <a href="javascript:void(0);" class="card-link">Another link</a>
                </div>
              </div>
            </div>
          </div>
    </div>
</body>
</html>