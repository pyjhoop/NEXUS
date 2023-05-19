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
	height: auto;;
	padding: 2.5rem 2rem 2srem 2rem;
	background-color: white;
	margin-top: 3rem;
	overflow: auto !important;
}
#prTitle{
	width: 100%;
	margin-top: 5rem;
	padding-top: 3rem;
}
#psnPrTitle{
	vertical-align: middle !important;
	overflow: auto !important;
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
	padding-left: 1.2rem;
	overflow: auto !important;
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
	overflow: auto;
	height: 
	
}
#specs2>b{
	margin-left: 1rem;
	margin-bottom: 5rem !important;
}
#info1, #info2{
	width: 45%;
	height: 13rem;
	float:left !important;
}
#specs2{
	/* overflow: auto; */
	margin-bottom: 1rem; 
	padding-left: 0.8rem; 
	border-bottom: 3px solid #f2f2f2";
}
#info1 span, #info2 span, #info3 span{
	margin-left: 1rem;
	color: black;
}
#info1 div, #info2 div, #info3 div{
	height: 25%;
	color: gray;
	font-weight: bold;
	font-size: 1.4rem;
}
#info3{
	width: 100%;
	/* height: 10rem; */
	overflow: auto;
}
#pjtPrStackSpan, #info3, #info4{
	display: inline-block;
}
 #info4{
 	margin-top: 1rem;
 }
</style>

<body>
<jsp:include page="../common/template.jsp"/>

<script>
		
	
		// active 클래스 를 repository로 옮기기
		$(".active").removeClass("active");
		$("#rcccccc").addClass("active");
		// $("#total1").addClass("active");
	
	
	
	 </script>

<div class="container-xxl flex-grow-1" >


<div id="mainBody">



<div id="prTitle">
	<p id="psnPrTitle">${r.pjtPrTitle }</p>
</div>

<div id="idDate">

	<div id="idDateReal1" style="display: inline-block;">
	 <img  src="${r.profile}" alt="" style="width: 2.1rem; border-radius: 100%;"> &nbsp; 
	<span id="userName" style="font-size: 1.1rem;">${r.userName}</span> &nbsp; &nbsp; 
	<span>${r.pjtPrCreateDate }</span>
	<p id="countNo" style="display: inline-block; font-size: 1.4rem; float:right; margin-bottom: 0px; margin-top: 0.23rem;">${r.count }</p>  &nbsp;
	<i class='bx bx-show' style="float: right; font-size: 2.5rem; margin-right: 0.4rem;"></i>  &nbsp;
	</div>
	
</div>

<div id="specs" style=" padding: 3rem 6rem 0rem 6rem;">
	<div id="specs2">
		<!-- PJT_PR_START   PJT_PR_PERIOD
		PJT_PR_DEADLINE  PJT_PR_FACE
		PJT_PR_CONTACT  PJT_PR_FIELD
		PJT_PR_CAPACITY PJT_PR_RECRUITS
		PJT_PR_STACK  1줄필요 -->
		<div id="info1">
			<div><b>프로젝트 시작일:<span>${r.pjtPrStart }</span></b></div>
			<div><b>인원모집 마감일:<span>${r.pjtPrDeadline }</span></b></div>
			<div><b>연락 방법:<span>${r.pjtPrContact }</span></b></div>
			<div><b>프로젝트 정원:<span>${r.pjtPrCapacity }</span></b></div>
		</div>
		<div id="info2">
			<div><b>프로젝트 진행기간:<span>${r.pjtPrPeriod }</span></b></div>
			<div><b>진행방식:<span>${r.pjtPrFace }</span></b></div>
			<div><b>모집분야:<span>${r.pjtPrField }</span></b></div>
			<div><b>모집인원:<span>${r.pjtPrRecruits }</span></b></div>
		</div>
		<div id="info3">
			<div id="info4"><b>사용언어:<span id="pjtPrStackSpan">${r.pjtPrStack }</span></b></div>
		</div>
	</div>

</div>





<div id="content" style="padding-left: 0.8rem;">

	<div>
		<p id="jgsg" style="font-size: 1.75rem; font-weight:900; color: black; padding: 3rem 6rem 0rem 6rem;"><b>프로젝트 소개</b></p> 
	</div>
	
	<div style="margin-left:5rem; border-bottom: 1.5px solid #f2f2f2; width: 88%;"></div>
	
	<div id="realContent" style="padding: 2rem 0rem 3rem 6rem; font-size: 1.2rem; color: black;">
		<b>${r.pjtPrContent }</b>
	</div>

</div><br><Br><Br><br><Br><Br>
















</div>




















































</div><br><Br><Br><br><Br><Br>

</body>
</html>