<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nexus!</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/logo3.png" />
<style>
.card span{
	/* margin-right: 2rem;	
	margin-top: 1rem; */
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
#issueTable th, #issueTable td {
	text-align: center;
}
td{
	text-align: center !important;
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
<script>
	$(function(){

	// active 클래스 를 repository로 옮기기
	$(".active").removeClass("active");
	$("#milestone").addClass("active");

	})

 </script>
<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
	  <h4 class="fw-bold py-3 mb-4">
				<span class="text-muted fw-light">NEXUS Project /</span> Milestone
	  </h4>
			
	<div class="card" style="margin-bottom: 3rem;">
		<h1 class="card-header" style="padding-bottom: 0px; color: black; margin-bottom: 0.7rem;">${title }</h1>
		<div style="width: 100%;">
			<div class="progress" style="width: 30%; margin-left: 1rem;">
				<div class="progress-bar" style="width:${(closedIssues / (openedIssues + closedIssues)) * 100}%;height:1rem;"></div>
			 </div><br>
			 <span style="margin-left: 1.5rem; margin-right: 2rem;">${due_on != null ? due_on : 'No Due Date'}</span> 
			 <span style="margin-right: 0px; margin-left: 0rem; color: green;">${Math.round((closedIssues / (openedIssues + closedIssues)) * 100)}% </span>complete
			 <span style="margin-left: 2rem;">${state }</span><br><br>
			 <span style="margin-left: 1.5rem; font-size: 0.8rem;">${description }</span><br><br><br>
		</div>
		
		<div id="buttonDiv">
			<form action="" method="get" style="margin-left: 1rem;">
		<span style=" margin-right: 0px; color: black; font-size: 1rem;">${title}</span>'s Issues<br>
				 <%-- <a href="getMilestoneIssues?mno=${m.number}" class="textA"> --%>
					<!-- <button type="submit" name="state1" value="closed" class="btn btn-outline-secondary btn-sm">Closed</button>
					<button type="submit" name="state1" value="open" class="btn btn-outline-primary btn-sm">Opened</button>
					<button type="submit" name="state1" value="all" class="btn btn-outline-success btn-sm">전체보기</button>
				</a> -->
			</form> 
		</div>
		
		
		
	<div class="table-responsive text-nowrap">
		<table class="table" id="issueTable">
				<thead>
				  <tr>
				  	<th width="5%">번호</th>
				  	<th width="20%" style="text-align: center;">제목</th>
				  	<th width="10%">생성일</th>
				  	<th width="10%">상태</th>
				  	<th width="20%" style="text-align: center;">라벨</th>
				  	<th width="10%">작성자</th>
				  	<th width="10%">담당자</th>
				  </tr>
				  </thead>
				  
				  <tbody class="table-border-bottom-0">
				  		<c:forEach var="m" items="${milestoneIssues }">
				  			<tr>
				  				<td style="width: 5%;">${m.number }</td>
				  				
				  				<td style="width: 20%;text-align: center">
				  					<a href="issueDetail.mini?ino=${m.number}" class="textA">
				  					<i class="fab fa-angular fa-lg text-danger me-3" style="padding-left: 0px; text-align: center;"></i> <strong>${m.title}</strong>
				  				</td>
				  				
				  				<td>
				  					${m.createdAt }
				  				</td>
				  				
				  				<td>
				  					${m.state }
				  				</td>
				  				
				  				<td style="text-align: center;">
                              <c:forEach items="${m.labels}" var="label">
                                 <c:choose>
                                    <c:when test="${label eq 'bug'}">
                                       <span class="badge rounded-pill bg-label-danger">${label}</span>
                                    </c:when>
                                    <c:when test="${label eq 'enhancement'}">
                                       <span class="badge rounded-pill bg-label-info">${label}</span>
                                    </c:when>
                                    <c:when test="${label eq 'duplicate'}">
                                       <span class="badge rounded-pill bg-label-dark">${label}</span>
                                    </c:when>
                                    <c:when test="${label eq 'documentation'}">
                                       <span class="badge rounded-pill bg-label-primary">${label}</span>
                                    </c:when>
                                    <c:when test="${label eq 'invalid'}">
                                       <span class="badge rounded-pill bg-label-warning">${label}</span>
                                    </c:when>
                                    <c:when test="${label eq 'help wanted'}">
                                       <span class="badge rounded-pill bg-label-success">${label}</span>
                                    </c:when>
                                    <c:otherwise>
                                       <span class="badge rounded-pill bg-label-secondary">${label}</span>
                                    </c:otherwise>
                                 </c:choose>
                              </c:forEach>
                           </td>
                           
                        <td>
    <div style="display: flex; justify-content: center;">
        <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
            <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="${m.user}">
                <img src="${m.profile}" alt="" class="rounded-circle" style="width: 90%; margin: auto; display: block;" />
            </li>
        </ul>
    </div>
</td>


									
						
						<td>
    <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center" style="margin: 0; padding: 0; display: flex; justify-content: center;">
        <c:forEach items="${m.assignees}" var="assignee" varStatus="loop">
            <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="${m.assignees}" style="margin: 0; padding: 0;">
                <img src="${m.assigneeProfiles[loop.index]}" alt="" class="rounded-circle" style="display: block;" />
            </li>
        </c:forEach>
    </ul>
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
</body>
</html>