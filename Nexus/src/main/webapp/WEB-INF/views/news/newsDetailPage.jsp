<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- css, js-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newsDetailPage.css">
<script src="${pageContext.request.contextPath}/resources/js/newsDetailPage.js"></script>


</head>
<body>
	<jsp:include page="../common/template.jsp"/>

	<button type="button" class="btn btn-lg rounded-pill btn-icon btn-outline-primary up">
        <span class="tf-icons bx bx-chevrons-up"></span>
    </button>

	<div class="container-xxl flex-grow-1 container-p-y cpadding">
		<div class="totalWrap">

			<div class="zzimWrap">
				<div>
					<i class='bx bxs-heart-circle'></i>
					<br>
					<span>12</span>
					<br> 
					<i class='bx bxs-share-alt'></i>

				</div>

			</div>
	
			<div class="card">
				<div class="wrap">
					<h1>${news.newsTitle }</h1>
					<br>
		
					<div class="subtitle">
						<div>
							<span class="userNo">${news.userNo }</span>
							<span>${news.createDate}</span>
						</div>
						<c:choose>
							<c:when test="${ loginUser.userName eq news.userNo }">
								<div>
									<a href="updateNews.p?nNo=${ news.newsNo }">수정하기</a>
									<a href="#">삭제하기</a>
								</div>
							</c:when>
						</c:choose>
					</div>
					<br> <br>
		
					<p>${ news.newsContent }</p>
				</div>
			</div>

		</div>
	
	</div>

</body>
</html>