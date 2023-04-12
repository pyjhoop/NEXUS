<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/template.jsp"/>
	<div class="container-xxl flex-grow-1 container-p-y cpadding">
		<div class="card">
			<h1>${news.newsTitle }</h1>
			<span>${news.userNo }</span>
			<p>${ news.newsContent }</p>
		</div>
	
	</div>

</body>
</html>