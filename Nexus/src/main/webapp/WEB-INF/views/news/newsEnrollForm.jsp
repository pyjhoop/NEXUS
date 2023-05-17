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

<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/logo3.png" />

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

          <textarea name="newsContent" id="newsContent" style="height: 700px;"></textarea>
          
          <c:if test="${ !empty news }">
          	<script>
          		
              let text = `${news.newsContent}`;
             

              $("#newsContent").summernote('code',text);

              
        
             
          	</script>
            <input type="hidden" name="newsNo", value="${news.newsNo }">
          </c:if>

         
		    
          
          <input type="hidden" name="userNo" value="${loginUser.userNo}">
          <input type="hidden" name="newsContent" id="newsContent">
          <input type="hidden" name="thumbnail" id="thumbnail">
          

          <div class="btns"  align="right">

              
              <c:choose>
	              <c:when test="${ status eq 'E' }">
		             
		              <button type="submit" class="btn btn-outline-primary" onclick="return confirm();">제출하기</button>
	              </c:when>
	              <c:otherwise>
	                  
	                  <button type="submit" class="btn btn-outline-secondary" onclick="return confirm();">수정하기</button>
	              </c:otherwise>
              </c:choose>

          </div>

        </form>
      </div>

    </div>

  


	
</body>
</html>