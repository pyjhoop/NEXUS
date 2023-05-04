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
	height: 100rem;;
	padding: 2.5rem 2rem 2srem 2rem;
	background-color: white;
	margin-top: 3rem;
}
#prTitle{
	width: 100%;
	margin-top: 5rem;
	padding-top: 3rem;
}
#psnPrTitle{
	vertical-align: middle !important;
}
#prTitle{
	width: 85%;
	/* height: 12.5rem; */
	overflow:auto !important;  /*자식크기에 따라 부모크기 자동 조절  */
	/* border: 1px solid black; */
	margin: auto;
	font-weight: 580;
	font-size: 2.87rem;
	color: black;
}
#idDate{
	width: 85%;
	/* height: 5rem; */
	/* border: 1px solid black; */
	margin: auto;
	padding: 1.5rem 0.8rem 0.5rem 0.8rem;
	border-bottom: 1px solid lightgray;
}
#idDateReal1{
	margin: auto;
	height:90%;
	width: 98%;
}
#countNo{
	margin-bottom: 0px !important;
}
#content{
 overflow: auto;
}
#specs{
	font-size: 1.2rem; 
	font-weight: 100;
	padding: 3rem 0rem 0rem 10rem;
	
}
#specs2>b{
	margin-left: 1rem;
	margin-bottom: 5rem !important;
}

</style>

<body>
<jsp:include page="../common/template.jsp"/>

<div class="container-xxl flex-grow-1" >


<div id="mainBody">



<div id="prTitle">
	<p id="psnPrTitle">${p.psnPrTitle }</p>
</div>

<div id="idDate">

	<div id="idDateReal1" style="display: inline-block;">
	 <img  src="${p.profile}" alt="" style="width: 2.1rem; border-radius: 100%;"> &nbsp; 
	<span id="userName" style="font-size: 1.1rem;">${p.userName}</span> &nbsp; &nbsp; 
	<span>${p.createDate }</span>
	<p id="countNo" style="display: inline-block; font-size: 1.4rem; float:right; margin-bottom: 0px; margin-top: 0.23rem;">${p.count }</p>  &nbsp;
	<i class='bx bx-show' style="float: right; font-size: 2.5rem; margin-right: 0.4rem;"></i>  &nbsp;
	</div>
	
</div>

<div id="specs" style=" padding: 3rem 6rem 0rem 6rem;">
	<div id="specs2" style="overflow: auto; margin-bottom: 3rem; padding-left: 0.8rem; border-bottom: 3px solid #f2f2f2">
		<div><b>희망 분야 <span style="margin-left: 2.5rem; color: black; ">&nbsp; &nbsp; ${p.category }</span></b></div><br>
		<div><b>참여 기간 <span style="margin-left: 2.5rem; color: black;">&nbsp; &nbsp; ${p.psnPrAvlPrd }</span></b></div><br>
		<div><b>연락 방법 <span style="margin-left: 2.5rem; color: black;">&nbsp; &nbsp; ${p.psnPrContact }</span></b></div><br>
		<div><b>사용 언어<span style="margin-left: 2.5rem; color: black; ">&nbsp; &nbsp; ${p.psnPrStack }</span></b></div><br>
	</div>

</div>





<div id="content" style="padding-left: 0.8rem;">

	<div>
		<p id="jgsg" style="font-size: 1.75rem; font-weight:900; color: black; padding: 3rem 6rem 0rem 6rem;  " ><b>자기소개</b></p> 
	</div>
	
	<div style="margin-left:5rem; border-bottom: 1.5px solid #f2f2f2; width: 88%;"></div>
	
	<div id="realContent" style="padding: 2rem 0rem 3rem 6rem; font-size: 1.2rem; color: black;">
		<b>${p.psnPrContent }</b>
	</div>

</div>
















</div>




















































</div>

</body>
</html>