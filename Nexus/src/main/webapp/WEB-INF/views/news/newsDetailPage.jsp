<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="container-xxl flex-grow-1 container-p-y cpadding">

		<div class="zzimWrap">
			<i class='bx bxs-heart-circle'></i>
			<br>
			<i class='bx bxs-share-alt'></i>
		</div>

		<div class="card">
			<div class="wrap">
				<h1>${news.newsTitle }</h1>
				<br>
	
				<div class="subtitle">
					<span class="userNo">${news.userNo }</span>
					<span>${news.createDate}</span>
				</div>
				<br> <br>
	
				<p>${ news.newsContent }</p>
			</div>
		</div>
	
	</div>

</body>
</html>