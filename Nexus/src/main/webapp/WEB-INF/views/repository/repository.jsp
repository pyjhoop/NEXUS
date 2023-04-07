<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script src="${ pageContext.request.contextPath }/resources/js/repository.js"></script>
</head>
<body>
	<jsp:include page="../common/template.jsp"/>
    <script>
        $(".active").removeClass("active");
        $("#repository").addClass("active")
    </script>
</body>
</html>