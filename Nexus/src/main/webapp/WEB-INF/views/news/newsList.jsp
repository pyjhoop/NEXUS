<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/newsList.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newsList.css">
</head>
<body>
    
    <jsp:include page="../common/template.jsp"/>

    <button type="button" class="btn btn-lg rounded-pill btn-icon btn-outline-primary up">
        <span class="tf-icons bx bx-chevrons-up"></span>
    </button>

    

    <div class="container-xxl flex-grow-1 container-p-y cpadding mt-5">

        <div class="row mb-5">

        	<c:forEach var="i" items="${ list }">
	            <div class="col-md-4 col-sm-6 col-lg-3 mb-5 cardWrap" onclick="location.href='newsDetail.p?nNo=${i.newsNo}'">
	                <div class="card h-100">
	                	
                      <c:choose>

                      	<c:when test="${ not empty i.thumbnail }">
		                  <img class="card-img-top" src="${ i.thumbnail }" alt="Card image cap">
                      	</c:when>

                      	<c:otherwise>
		                  <img class="card-img-top" src="resources/image/logo3.png" alt="Card image cap">
                      	</c:otherwise>

                      </c:choose>

	                  <div class="card-body">
	                      <h5 class="card-title">${ i.newsTitle }</h5>
	                      <p class="card-text${i.newsNo} card-text1">

                            <script>
                                var htmlString = '${i.newsContent}';
                                var $html = $(htmlString);
                                //console.log($html.find("img"));
                                if($html.find("img").length >0){
                                    $html.find("img").remove();
                                }
								if($html.find("iframe").length>0){
									$html.find("iframe").remove();
								}

                                $(".card-text${i.newsNo}").html($html.html());
                                
                            </script>
	                          
	                          
	                      </p>
	                      ${ i.createDate}
	                      <hr>

	                      <div class="userInfo">

	                          <div>
                                <!-- 프로필 이미지-->
                                  <img  src="${pageContext.request.contextPath}/resources/image/laoh.jpg" alt="" style="width: 25px; border-radius: 100%;">
                                  &nbsp;by <span class="userName">${i.userNo}</span>
	                          </div>

	                          <div class="heartwrap">

	                            <i class='bx bxs-heart-circle'></i>
	                            <span class="zzim${i.newsNo}">${i.likeCount}</span>

	                          </div>
	
	                      </div>
	                  </div>
	                </div>
	            </div>
        	</c:forEach>
        </div>
            
    </div>
    
    <div id="observer" class="card" style="visibility: hidden;">더보기</div>



</body>
</html>
