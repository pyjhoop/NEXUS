<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nexus!</title>
<style>
.card span{
	margin-right: 2rem;	
	margin-top: 1rem;
}
.luda span{
	margin-right: 0px !important; 
}
.luda{
}
button{
margin-bottom: 1rem !important; 
margin-right:0.5rem !important;
float: right !important;
}
#allButton{
	/* margin-right: 30rem !important;  */
}
</style>
</head>
<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.18/dist/css/bootstrap-select.min.css">
<!-- Latest compiled and minified JavaScript 한국어 번역 파일 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/i18n/defaults-ko_KR.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/core_issue_mini.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/apex-charts.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/theme-default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/issue_select.css">
<body>
<jsp:include page="../common/template.jsp" />
<!-- 위에서 해당 마일스톤의 정보 가져와야함 -->
<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
	  <h4 class="fw-bold py-3 mb-4">
				<span class="text-muted fw-light">Milestone /</span> NEXUS Project
	  </h4>
			
	<div class="card" style="">
		<h1 class="card-header" style="padding-bottom: 0px; color: black; margin-bottom: 0.7rem;">${title }</h1>
		<div style="width: 100%;">
			<div class="progress" style="width: 30%; margin-left: 1rem;">
				<div class="progress-bar" style="width:${(closedIssues / (openedIssues + closedIssues)) * 100}%;height:1rem;">${Math.round((closedIssues / (openedIssues + closedIssues)) * 100)}%</div>
			 </div><br>
			 <span style="margin-left: 1.5rem;">${due_on != null ? due_on : 'No Due Date'}</span> 
			 <span>${Math.round((closedIssues / (openedIssues + closedIssues)) * 100)}% complete</span>
			 <span>${state }</span><br><br>
			 <span style="margin-left: 1.5rem;">${description }</span><br><br><br>
		</div>
		
		<div>
			<form action="" method="get" style="margin-left: 1rem;">
		<span style=" margin-right: 0px; color: black; font-size: 1rem;">${title}</span>'s Issues
					<button type="submit" name="state1" value="closed" class="btn btn-outline-secondary btn-sm">Closed</button>
					<button type="submit" name="state1" value="open" class="btn btn-outline-primary btn-sm">Opened</button>
					<button type="submit" name="state1" value="all" class="btn btn-outline-success btn-sm">전체보기</button>
			</form>
		</div>
		
		
		
	<div class="table-responsive text-nowrap">
		<table class="table" id="issueTable">
				<thead>
				  <tr>
				  	<th width="10%">번호</th>
				  	<th width="15%">제목</th>
				  	<th width="10%">생성일</th>
				  	<th width="10%">상태</th>
				  	<th width="20%">라벨</th>
				  	<th width="10%">생성자</th>
				  	<th width="10%">작성자</th>
				  </tr>
				  </thead>
				  
				  <tbody class="table-border-bottom-0">
				  		<c:forEach var="m" items="${milestoneIssues }">
				  			<tr>
				  				<td style="width: 10%;">${m.number }</td>
				  				
				  				<td style="width: 15%;">
				  					<a href="issueDetail.mini?ino=${m.number}" class="textA">
				  					<i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${m.title}</strong>
				  				</td>
				  				
				  				<td>
				  					${m.createdAt }
				  				</td>
				  				
				  				<td>
				  					${m.state }
				  				</td>
				  				
				  				<td>
				  					${m.labels }
				  				</td>
				  			</tr>
				  		</c:forEach>
				  </tbody>
				  </table>
				  </div>
				
	
	
	
	</div>	
</div>
</div>
<!-- milestone의 issue들은 밑에서 foreach문 -->
<c:forEach var="m" items="${milestoneIssues }">
	<p>${m.title }</p>
	<p>${m.assigneeProfiles }</p>
	
</c:forEach>
</body>
</html>