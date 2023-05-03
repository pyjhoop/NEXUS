<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nexus</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/logo3.png" />
</head>

<style>
#mainBody{
	width: 100%;
	height: 100%;
	padding: 5rem 2rem 5rem 2rem;
}
#prTitle{
	width: 100%;
}
#psnPrTitle{
	vertical-align: middle !important;
}
#prTitle{
	width: 85%;
	/* height: 12.5rem; */
	overflow:auto !important;  /*자식크기에 따라 부모크기 자동 조절  */
	border: 1px solid black;
	margin: auto;
	font-weight: 580;
	font-size: 2.87rem;
	color: black;
}
#idDate{
	width: 85%;
	/* height: 5rem; */
	border: 1px solid black;
	margin: auto;
	padding: 0.8rem;
}
#idDateReal1{
	margin: auto;
	border-right:
}

</style>

<body>
<jsp:include page="../common/template.jsp"/>

<div class="container-xxl flex-grow-1" style="border: solid 1px black;">


<div id="mainBody">



<div id="prTitle">
	<p id="psnPrTitle">${p.psnPrTitle }</p>
</div>

<div id="idDate">
	<div id="idDateReal1" style="display: inline-block;">
	 <img  src="${p.profile}" alt="" style="width: 2.5rem; border-radius: 100%;">
	<span style="display: inline-block;">${p.userName}</span>
	</div>
	
	<div id="idDateReal2">
		<span>${p.createDate }</span>
	</div>
</div>
















</div>




















































</div>

</body>
</html>