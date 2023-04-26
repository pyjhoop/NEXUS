<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>





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

<style>

</style>




</head>
<body>


	<jsp:include page="../common/template.jsp" />






	<!-- Content wrapper -->
	<div class="content-wrapper">
		<!-- Content -->

		<div class="container-xxl flex-grow-1 container-p-y">
			<h4 class="fw-bold py-3 mb-4">
				<span class="text-muted fw-light">Project /</span> NEXUS Project
			</h4>



			<br> <br>


			<!-- Basic Bootstrap Table -->
			<div class="card">
				<h5 class="card-header" style="padding-bottom: 0px;">NEXUS Project</h5>




				<div class="luda">
					<a class="btn btn-primary" href="issueEnroll.mini">이슈 등록</a>
				</div>
				<br>

				<div class="table-responsive text-nowrap">
					<table class="table" id="issueTable">
						<thead>
							<tr>
								<form action="" method="get" align="center">
									<th>
										<button type="submit" name="state" value="open" class="btn btn-outline-success btn-sm">진행 중</button>
									</th>
									<th>
										<button type="submit" name="state" value="closed" class="btn btn-outline-secondary btn-sm">종료</button>
									</th>
									<th>
										<button type="submit" name="state" value="all" class="btn btn-outline-primary btn-sm">전체</button>
									</th>

								</form>

								<th>생성일</th>

								<th>
									<form action="" method="get" align="center">
										<select class="form-select form-select-sm" aria-label="Default select example">
											<option selected>라벨</option>
											
											<c:forEach var="l" items="${lList }">
											<option value="${l.name }">${l.name }</option>
											</c:forEach>
										
										</select>
									</form>
								</th>


								<th>
									<form action="" method="get" align="center">
										<select class="form-select form-select-sm" aria-label="Default select example">
											<option selected>작성자</option>
											<c:forEach var="r" items="${RepoMembers }">
											<option value="${r.userName }">${r.userName}</option>
											</c:forEach>
										</select>
									</form>
								</th>

								<th>
									<form action="" method="get" align="center">
										<select class="form-select form-select-sm" aria-label="Default select example">
											<option selected>담당자</option>
										<c:forEach var="r" items="${RepoMembers }">
											<option value="${r.userName }">${r.userName}</option>
										
											</c:forEach>
										</select>
									</form>
								</th>
								<th>마일스톤</th>
							</tr>
						</thead>
						<tbody class="table-border-bottom-0">


							<!-- 한바퀴  -->

							<c:forEach var="i" items="${list }">

								<tr>
									<td colspan="3" style="width:26%" >
										<a href="issueDetail.mini?ino=${i.number}" class="textA">
											<i class="fab fa-angular fa-lg text-danger me-3"></i>
											<strong>${i.title}</strong>
											</a>
									</td>


									<td style="width:9%;">${i.createdAt }</td>

									<td style="width:32%;">
										<c:forEach items="${i.labels}" var="label">
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

									<td style="width:10%;">
										<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">

											<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="${i.user }"><img src="${i.profile }" alt="" class="rounded-circle" /></li>

										</ul>
									</td>


									<td style="width:13%;">
										<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
											<c:forEach items="${i.assignees}" var="assignee" varStatus="loop">
												<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="${assignee}"><img src="${i.assigneeProfiles[loop.index]}" alt="" class="rounded-circle" /></li>
											</c:forEach>
										</ul>
									</td>


									<td style="width:10%;">
									<!-- 마일스톤 클릭시 해당 마일스톤으로 이동 ###   -->
										<div class="dropdown">
										${i.milestone }
											<button type="button" class="btn p-0 dropdown-toggle hide-arrow ${empty i.milestone ? 'invisible' : ''}" data-bs-toggle="dropdown">
												<i class="bx bx-dots-vertical-rounded"></i>
											</button>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="javascript:void(0);">
													<i class="bx bx-send me-1"></i> 이동
												</a>
												<a class="dropdown-item" href="javascript:void(0);">
													<i class="bx bx-trash me-1"></i> 삭제
												</a>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
							<!-- 한바퀴  -->


						</tbody>
					</table>
				</div>
			</div>
			<!--/ Basic Bootstrap Table -->






			<script>
				const tooltipTriggerList = [].slice.call(document
						.querySelectorAll('[data-bs-toggle="tooltip"]'));
				tooltipTriggerList.map(function(tooltipTriggerEl) {
					return new bootstrap.Tooltip(tooltipTriggerEl);
				});

			
				
				
				$(function() {
					  $("#boardList>tbody>tr").click(function() {
					    var ino = $(this).find('input[name="ino"]').val();
					    location.href = "issueDetail.mini?ino=" + ino;
					  });
					});

				
				
			</script>






		







			<!-- ------------------------------------------------------------------------------------------------------------- -->




			<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>