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

<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/logo3.png" />
</head>
<body>
    
    <jsp:include page="../common/template.jsp"/>

    <button type="button" class="btn btn-lg rounded-pill btn-icon btn-outline-primary up">
        <span class="tf-icons bx bx-chevrons-up"></span>
    </button>

    

    <div class="container-xxl flex-grow-1 container-p-y cpadding mt-5">

		<div class="row">
			<div class="mb-5 col-lg-4 col-md-4">
				<div class="row">
					<div class="col-md-4 new text-primary rePage" id="new">최신 news</div>
					<div class="col-md-4 popular rePage" id="popular">인기 news</div>
					<div class="col-md-4 my rePage" id="my">나의 news</div>
				</div>
			</div>
		</div>

        <div class="row mainContents mb-5">

        	<c:forEach var="i" items="${ list }">
	            <div class="col-md-3 col-sm-3 col-lg-3 mb-5 cardWrap" onclick="location.href='newsDetail.p?nNo=${i.newsNo}'">
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
                                var $html1 = $(htmlString);
								
								console.log(htmlString);
								
                                if($html1.find("img").length >0){
                                    $html1.find("img").remove();
                                }
								if($html1.find("iframe").length>0){
									$html1.find("iframe").remove();
								}

								console.log($html1.text())

                                $(".card-text${i.newsNo}").html($html1.text());
                                
                            </script>
	                          
	                          
	                      </p>
	                      ${ i.createDate}
	                      <hr style="margin: 3px;">

	                      <div class="userInfo">

	                          <div>
                                <!-- 프로필 이미지-->
                                  <img  src="${i.profile}" alt="" style="width: 25px; border-radius: 100%;">
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
    
    <div id="observer" class="card">더보기</div>



</body>
</html>
