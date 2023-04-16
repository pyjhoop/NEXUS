<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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


 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    

</head>
<body>
    <div class="container-xxl flex-grow-1 container-p-y cpadding">
      <div class="card cardcon">

        <form action="${status eq 'E' ? 'insertNews' : 'updateNews'}" method="post" style="height: 100%;">
          
          <div class="row mb-3" style="margin-top: 15px;">
            <div class="title">
              TITLE
            </div>

            <div class="col-sm-10">
              <input type="text" class="form-control" id="newsTitle" name="newsTitle" placeholder="Title" value="${ news.newsTitle }">


            </div>

          </div>

          <textarea name="newsContent" id="newsContent"></textarea>
		    
          
          <input type="hidden" name="userNo" value="${loginUser.userNo}">
          <input type="hidden" name="newsContent" id="newsContent">
          <input type="hidden" name="thumbnail" id="thumbnail">

          <div class="btns"  align="right">

              
              <c:choose>
	              <c:when test="${ status eq 'E' }">
		              <button type="reset" class="btn btn-outline-danger">초기화</button>
		              <button type="submit" class="btn btn-outline-primary" onclick="return confirm();">제출하기</button>
	              </c:when>
	              <c:otherwise>
	                  <button type="reset" class="btn btn-outline-danger">초기화</button>
	                  <button type="submit" class="btn btn-outline-secondary">수정하기</button>
	              </c:otherwise>
              </c:choose>

          </div>

        </form>
      </div>

    </div>

    <c:if test="${news.newsContent != null}">
      <script>
        let string = '${news.newsContent}';
        $("#newsContent").summernote('pasteHTML',string);
      </script>
    </c:if>

  


	
</body>
</html>