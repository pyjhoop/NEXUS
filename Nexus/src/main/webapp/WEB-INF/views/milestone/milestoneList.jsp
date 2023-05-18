<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="UTF-8">
<title>Nexus!</title>
<style>
.luda{
	height: 5rem;
}
.luda button{
	/* margin-left: 1rem; */
	margin-top: 0.7rem;
}
th{
	padding-top:0rem;
	vertical-align: middle;
	height: 2rem;
	text-align: center !important;
	
}

.table{
	/* table-layout: fixed; */
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
	<!-- 생성일,종료일,수정일, 진척도, -->
	
<div class="content-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
		<h4 class="fw-bold py-3 mb-4">
				<span class="text-muted fw-light">Milestones /</span> NEXUS Project
			</h4>
		
	<div class="card">
		<h5 class="card-header" style="padding-bottom: 0px;">NEXUS Project</h5>
		<div class="luda">
			<form action="" method="get" style="margin-left: 1rem; margin-top: 1rem;">
										<button type="submit" name="state" value="open" class="btn btn-outline-primary btn-sm">Opened</button>
										<button type="submit" name="state" value="closed" class="btn btn-outline-secondary btn-sm">Closed</button>
										<button type="submit" name="state" value="all" class="btn btn-outline-success btn-sm">전체보기</button>
			</form>
			<!-- <a class="btn btn-primary" id="enrollMsB" href="issueEnroll.mini">마일스톤 등록</a>		 -->
		</div>
		
		
		
		
			<div class="table-responsive text-nowrap">
					<table class="table" id="issueTable">
						<thead>
							<tr>
							
								<th width="1%">번호</th>
								<th width="1%">제목</th>
								
								
								<th width="6%" >생성일</th>
								
								<th width="6%">종료일</th>
								
								<th width="6%">최근수정일</th>
								
								<th id="progress" width="10%">진척도</th>
								
								<th width="2.5%">진행중인 이슈</th>
								
								<th width="2.5%">종료된 이슈</th>
								
								<th width="2%">작성자</th>
								
							</tr>

						</thead>
						<tbody class="table-border-bottom-0">
							<c:forEach var="l" items="${list }">
								<tr>
									<td style="width: 2%;">${l.number }</td>
									
									<td  style="width: 10%">
										<a href="milestoneDetail?mno=${l.number}" class="textA">
											<i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${l.title}</strong>
										</a>
									</td>
									
									<td style="width: 6%;">${l.createdAt }</td>
									<%-- <td style="width: 6%;">${l.due_on }</td> --%>
									<td style="width: 6%;">
									    ${l.due_on != null ? l.due_on : '<span style=\'font-size: 0.8rem;\'>No due date</span>'}
									</td>
									
									<td style="width: 6%;">${l.updatedAt }</td>
									
									<td>
										 <div class="progress" style="height:1rem;">
										    <div class="progress-bar" style="width:${(l.closedIssues / (l.openedIssues + l.closedIssues)) * 100}%;height:1rem;">${Math.round((l.closedIssues / (l.openedIssues + l.closedIssues)) * 100)}%</div>
										  </div>
									</td>
									
									<td style="width: 6%; text-align: center;">${l.openedIssues }</td>
									
									<td style="width: 6%; text-align: center;">${l.closedIssues }</td>
									
									<td style="width: 2%;">
										<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">

											<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="${l.creator }"><img src="${l.profile }" alt="" class="rounded-circle" /></li>

										</ul>
									</td>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
	
	
	
	</div>
	
	<script>
				const tooltipTriggerList = [].slice.call(document
						.querySelectorAll('[data-bs-toggle="tooltip"]'));
				tooltipTriggerList.map(function(tooltipTriggerEl) {
					return new bootstrap.Tooltip(tooltipTriggerEl);
				});

			
				
				
				$(function() {
					  $("#boardList>tbody>tr").click(function() {
					    var mno = $(this).find('input[name="mno"]').val();
					    location.href = "milestoneDetail?mno=" + mno;
					    console.log(mno);
					  });
					});

				

				
			</script>
		

		
		
		<%-- <c:forEach var="g" items="${list }">
			${g.title }
		</c:forEach> --%>
			</div>
</div>
<br><br><br>
<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>