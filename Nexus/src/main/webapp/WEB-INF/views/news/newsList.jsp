<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/news.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/newsList.js"></script>
</head>
<body>
	<jsp:include page="../common/template.jsp"/>
    <div class="container-xxl flex-grow-1 container-p-y cpadding">
        <button type="button" class="btn btn-primary">작성</button>
		<c:forEach var="i" items="${list }" varStatus="status">
	        <div class="card mb-5 ct">
	            <div class="firstrow" style="display: flex;">
	                <div class="col-md-2 col-4 profile1" style="display: flex;">
	                    <img src="${i.profile}" alt="프로필" class="profile rounded-circle">
	                    <span class="username d-flex align-items-center justify-content-center">${i.userNo}</span>
	                </div>
	                <div class="col-md-5 col-4 d-flex align-items-center justify-content-center title">${ i.newsTitle }</div>
	                <div class="col-md-5 col-4 d-flex align-items-center justify-content-center">${ i.createDate }</div>
                
	            </div>
                
	            
	            <div class="row">
	                <div class="col-md-6 imgp" style="padding-right: 0px;"><img src="${pageContext.request.contextPath}/resources/image/laoh.jpg" alt="" class="imgplace"></div>
	                <div class="col-md-6" style="padding: 40px;">
	                    <div class="contents">
	                        ${ i.newsContent }
	                    </div>
                        <div class="divider">
                            <div class="divider-text">댓글</div>
                          </div>
	                    <div class="reply">
                            

	                    	<c:choose>
	                    		<c:when test="${ status.count eq 1 }">
			                    	<c:forEach var="j" items="${allList[0]}">
			                    		${ j.commentContent }
			                    		<br>
			                    	</c:forEach>
	                    		</c:when>
	                    		<c:when test="${ status.count eq 2 }">
			                    	<c:forEach var="j" items="${allList[1]}">
			                    		${ j.commentContent }
			                    		<br>
			                    	</c:forEach>
	                    		</c:when>
	                    		<c:when test="${ status.count eq 3 }">
			                    	<c:forEach var="j" items="${allList[2]}">
                                        <div style="display: flex;">
                                            <img alt="" src="${pageContext.request.contextPath}/resources/image/laoh.jpg" class="reImg">
                                            <div class="rediv">
                                                <span class="reWriter">${ j.commentWriter }</span>
                                                <span class="reDate">${ j.commentDate }</span>
                                                <br>
                                               <span class="reComment">
                                                   ${j.commentContent }
                                               </span>

                                            </div>
                                        </div>
			                    		<br>
			                    	</c:forEach>
	                    		</c:when>
	                    		<c:when test="${ status.count eq 4 }">
			                    	<c:forEach var="j" items="${allList[3]}">
			                    		${ j.commentContent }
			                    		<br>
			                    	</c:forEach>
	                    		</c:when>
	                    		<c:when test="${ status.count eq 5 }">
			                    	<c:forEach var="j" items="${allList[4]}">
			                    		${ j.commentContent }
			                    		<br>
			                    	</c:forEach>
	                    		</c:when>
	                    	</c:choose>
	                    	
	                    </div>
	                    <div class="inputreply">
	                        <img src="${loginUser.profile}" alt="">
	                        <input type="text" class="form-control" id="inputtext" placeholder="댓글 작성" aria-describedby="defaultFormControlHelp">
	                        <button type="button" class="btn btn-primary re">입력</button>
	                    </div>
	                </div>
	
	            </div>
	        </div>
		</c:forEach>
        <div class="list"></div>
       
            
      <div id="observer" class="card">더보기</div>
    </div>

 

		



</body>
</html>
