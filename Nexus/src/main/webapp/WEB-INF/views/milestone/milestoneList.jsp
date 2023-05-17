<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nexus!</title>
</head>
<body>
<div>
	<c:forEach var="l" items="${list }">
												<option value="${l.name }">${l.name }</option>
											</c:forEach>
											<P>ㄹㄴㅇ</P>
</div>
</body>
</html>