<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<jsp:include page="../common/template.jsp"/>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newsEnrollForm.css">
</head>

<script src="${pageContext.request.contextPath}/resources/js/newsEnrollForm.js"></script>

<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>


</head>
<body>
    <div class="container-xxl flex-grow-1 container-p-y cpadding">
      <div class="card cardcon">

        <form action="insertNews" method="post" style="height: 100%;">

          <div class="row mb-3" style="margin-top: 15px;">
            <div class="title">
              TITLE
            </div>

            <div class="col-sm-10">
              <input type="text" class="form-control" id="newsTitle" name="newsTitle" placeholder="John Doe">
            </div>

          </div>

          <textarea name="newsContent" id="newsContent"></textarea>

          <input type="hidden" name="userNo" value="${loginUser.userNo}">
          <input type="hidden" name="newsContent" id="newsContent">
          <input type="hidden" name="thumbnail" id="thumbnail">

          <div class="btns"  align="right">

              <button type="submit" class="btn btn-outline-secondary">수정하기</button>
              <button type="submit" class="btn btn-outline-danger">삭제하기</button>

              <button type="submit" class="btn btn-outline-primary" onclick="return confirm();">제출하기</button>

          </div>

        </form>
      </div>

    </div>


  


	
</body>
</html>