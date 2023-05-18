<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- favicon-->
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/logo3.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body>
	<jsp:include page="common/template.jsp"/>
	<div class="container-xxl flex-grow-1 container-p-y">


        <div class="row mb-5">

            <div class="col-md-10 col-lg-10 mb-3">
              <div class="card mb-4" style="padding: 10px;">
                <h5 class="text-primary">Latest Repositories</h5>
                <div style="display: flex;"> 
                  <c:forEach var="i" items="${ list }">
  
                    <div class="col-lg-4 col-md-6 col-sm-6 mb-4">
                        <div class="card">
                          <div class="pl-3">
                            <a href="repoDetail.p?rNo=${ i.repoNo }">
                              <h4 class="fw-bold py-3 mb-3" style="overflow: hidden;">
                                  <span class="text-muted fw-light">${ i.userName } /</span><br> ${ i.repoName }
                              </h4>
                              ${ i.repoStatus }
            
                            </a>
  
                          </div>
                        </div>
                      </div>
  
                </c:forEach>

                </div>
    

              </div>

              <div class="card mt-4 issueTable" style="padding: 10px; height: 65%; overflow: auto;">
                <h5 class="text-primary">Latest issues</h5>
                
                  <table class="table" id="issueTable">
                    <thead>
                      <tr>
                        <th style="width: 20%;">타이틀</th>
                        <th style="width: 15%;">생성일</th>
                        <th style="width: 20%;">라벨</th>
                        <th>작성자</th>
                        <th>담당자</th>
                        <th style="width: 12%;">마일스톤</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0" id="issueTableBody">
                      <c:forEach var="i" items="${gList }">

                        <tr>

                          <td  >
                            <a href="issueDetail1.mini?ino=${i.number}&repository=${i.fullName}" class="textA">
                              <i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>${i.title}</strong>
                            </a>
                          </td>
        									<td>${i.createdAt }</td>


									<td>
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

									<td style="width: 10%;">
										<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">

											<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="${i.user }"><img src="${i.profile }" alt="" class="rounded-circle" /></li>

										</ul>
									</td>


									<td style="width: 13%;">
										<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
											<c:forEach items="${i.assignees}" var="assignee" varStatus="loop">
												<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="${assignee}"><img src="${i.assigneeProfiles[loop.index]}" alt="" class="rounded-circle" /></li>

											</c:forEach>
										</ul>
									</td>


									<td style="width: 10%;">
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
                    </tbody>
                  </table>
              </div>
            </div>

            <c:set var="bool" value="false"/>
            <c:set var="bool1" value="false"/>
            <c:set var="doneLoop" value="false"/>
            <div class="col-md-2 col-lg-2 mb-3">
              <div class="card mb-3" style="padding: 10px; height: 90%">
                <h5 class="text-primary">Friends</h5>
	                <c:forEach var="i" items="${fList }">
	                	
		                <c:forEach var="m" items="${ConnectMembers}">
		                	<c:set var="bool" value="false"/>
		                	<c:choose>
		                		<c:when test="${ m == i.userName }">
		                			<c:set var="bool1" value="true"/>
		                		</c:when>
		                		<c:otherwise>
		                			<c:set var="bool" value="false"/>
		                		</c:otherwise>
		                	</c:choose>
		                	
	                	</c:forEach>
	                	
	                	<c:set var="bool" value="${bool1}"/>
	                	
	                	<div style="width: 100%; display: flex">
	                		<c:choose>
	                			<c:when test="${ bool == true }">
	                				<div class="avatar avatar-online" style="width: 30px; height: 30px;" align="center">
	                			</c:when>
	                			<c:otherwise>
				                	<div class="avatar avatar-offline" style="width: 30px; height: 30px;" align="center">
	                			</c:otherwise>
	                		</c:choose>
								<img src="${i.profile }" alt="" class="w-px-30 h-px-30 rounded-circle">
							</div>
							<div class="mt-1 ml-3">
								<strong>${i.userName }</strong>
							</div>
						</div>
		                <br>
                </c:forEach>
                
                
              </div>
            </div>
            

         
          
        </div>

    </div>
</body>
</html>