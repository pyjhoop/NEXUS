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





            <input type="hidden" name="state" id="state" value="${state }">


            <div class="luda">

               <a class="btn btn-primary" href="issueEnroll.mini">이슈 등록</a>
            </div>
            <br>
            <div class="btnBox">
               <div class="btnGroup1">
                  <c:set var="isButtonDisplayed" value="false" scope="page" />

                  <c:forEach items="${list}" var="i" varStatus="loop">
                     <c:if test="${i.userId eq loginUser.userId }">
                        <button class="btn btn-outline-dark btn-sm issueauthor" name="author" value="${i.user }">내가 작성한 이슈 ${i.userId }</button>
                     </c:if>
                  </c:forEach>



               </div>
               <div class="btnGroup2">
                  <button class="btn btn-outline-dark btn-sm issueassign" name="assign" value="myIssue">내 담당 이슈</button>
               </div>
            </div>

            <br>

            <div class="table-responsive text-nowrap">
               <table class="table" id="issueTable">
                  <thead>
                     <tr>
                        <th style="width: 5%;">번호</th>
                        <form action="" method="get" align="center">
                           <th>
                              
                                    <c:choose>
                           <c:when test="${state eq 'open' }">
                              <button type="submit" name="state" value="open" class="btn btn-success btn-sm">진행 중</button>
                              </c:when>
                              <c:when test="${ empty state  }">
                              <button type="submit" name="state" value="open" class="btn btn-success btn-sm">진행 중</button>
                              </c:when>
                              <c:otherwise>
                              
                              <button type="submit" name="state" value="open" class="btn btn-outline-success btn-sm">진행 중</button>
                              </c:otherwise>
                              </c:choose>
                              
                              
                           </th>
                           <th>
                           <c:choose>
                           <c:when test="${state eq 'closed' }">
                              <button type="submit" name="state" value="closed" class="btn btn-secondary btn-sm">종료</button>
                              </c:when>
                              <c:otherwise>
                              <button type="submit" name="state" value="closed" class="btn btn-outline-secondary btn-sm">종료</button>
                              </c:otherwise>
                              </c:choose>
                           </th>
                           <th>
                              
                                    <c:choose>
                           <c:when test="${state eq 'all' }">
                              <button type="submit" name="state" value="all" class="btn btn-primary btn-sm">전체</button>
                              </c:when>
                              <c:otherwise>
                              <button type="submit" name="state" value="all" class="btn btn-outline-primary btn-sm">전체</button>
                              </c:otherwise>
                              </c:choose>
                           </th>

                        </form>

                        <th style="width: 9%;">생성일</th>

                        <th style="width: 28%;">
                           <form action="issueShow.mini" method="get" align="center">
                              <select onchange="this.form.submit()" class="form-select form-select-sm" name="label" aria-label="Default select example">
                                 <option selected value="noChoice">라벨</option>
                                 <c:forEach var="l" items="${lList }">
                                    <option value="${l.name }">${l.name }</option>
                                 </c:forEach>

                              </select>
                           </form>
                        </th>


                        <th>작성자</th>

                        <th>담당자</th>
                        <th>마일스톤</th>
                     </tr>


                     <input type="hidden" id="page" value="1">


                  </thead>
                  <tbody class="table-border-bottom-0" id="issueTableBody">


                     <!-- 한바퀴  -->
                     <c:forEach var="i" items="${list }">

                        <tr>
                           <td>${i.number }</td>

                           <td colspan="3" style="width: 26%">
                              <a href="issueDetail.mini?ino=${i.number}" class="textA">
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
                     <!-- 한바퀴  -->


                  </tbody>
               </table>
            </div>
         </div>
         <!--/ Basic Bootstrap Table -->


         <div id="observer" class="card" style="visibility: hidden;">더보기</div>



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

            
            
            
            
            
            
            document.addEventListener('DOMContentLoaded', function() {
                 var authorButton = document.querySelector('.issueauthor');
                 var assignButton = document.querySelector('.issueassign');

                 if (authorButton) {
                   authorButton.addEventListener('click', function() {
                     var author = this.value;
                     console.log(author);
                     window.location.href = 'issueShow.mini?author=' + author;
                   });
                 }

                 if (assignButton) {
                   assignButton.addEventListener('click', function() {
                     console.log('가나염??');
                     window.location.href = 'issueShow.mini?assign=myIssue';
                   });
                 }
               });


            
            
      
            
            
            
            
            
            var stateValue = document.getElementById('state').value;
            
             const $observer = document.getElementById('observer');
                let page = 1;
                       
                const io = new IntersectionObserver((entries) => {
                   if (entries[0].isIntersecting) {
                       page+=1;
                       
                       
                  if(stateValue == 'closed'){
             
                   $.ajax({
                       url:"ajaxIssue",
                       data: {"page":page,
                                "state" : stateValue},
                       success:handleAjaxSuccess  

                       , error:function(){
                           console.log("ajax 오류 발생")
                       }
                   })

                   }else if(stateValue == 'all'){
                      $.ajax({
                          url:"ajaxIssue",
                          data: {"page":page,
                                   "state" : stateValue},
                          success:handleAjaxSuccess  

                          , error:function(){
                              console.log("ajax 오류 발생")
                          }
                      })
                   }else{
                      $.ajax({
                          url:"ajaxIssue",
                          data: {"page":page},
                          success:handleAjaxSuccess  
                          , error:function(){
                              console.log("ajax 오류 발생")
                          }
                      })
                   }
                  
                  
                   }
                   });
                io.observe($observer);
            
            
            
            
                function handleAjaxSuccess(data) {
                     var tableBody = $("#issueTableBody");

                     for (var i = 0; i < data.length; i++) {
                       var item = data[i];

                       var row = $("<tr></tr>");

                       var number = $("<td></td>").text(item.number);
                       row.append(number);

                       var titleColumn = $("<td></td>").attr("colspan", "3").css("width", "26%");
                       var anchorElement = $("<a></a>")
                         .attr("href", "issueDetail.mini?ino=" + item.number)
                         .addClass("textA");
                       var iconElement = $("<i></i>").addClass(
                         "fab fa-angular fa-lg text-danger me-3"
                       );
                       var strongElement = $("<strong></strong>").text(item.title);
                       anchorElement.append(iconElement, strongElement);
                       titleColumn.append(anchorElement);
                       row.append(titleColumn);

                       var createAt = $("<td></td>").text(item.createdAt);
                       row.append(createAt);

                       var labelsColumn = $("<td></td>").css("width", "28%");
                       $.each(item.labels, function (index, label) {
                         var badge = $("<span></span>").addClass("badge rounded-pill");

                         if (label === "bug") {
                           badge.addClass("bg-label-danger");
                         } else if (label === "enhancement") {
                           badge.addClass("bg-label-info");
                         } else if (label === "duplicate") {
                           badge.addClass("bg-label-dark");
                         } else if (label === "documentation") {
                           badge.addClass("bg-label-primary");
                         } else if (label === "invalid") {
                           badge.addClass("bg-label-warning");
                         } else if (label === "help wanted") {
                           badge.addClass("bg-label-success");
                         } else {
                           badge.addClass("bg-label-secondary");
                         }

                         badge.text(label);
                         labelsColumn.append(badge);
                       });
                       row.append(labelsColumn);

                       var userColumn = $("<td></td>").css("width", "10%");
                       var userAvatar = $("<ul></ul>").addClass(
                         "list-unstyled users-list m-0 avatar-group d-flex align-items-center"
                       );
                       var userAvatarItem = $("<li></li>")
                         .addClass("avatar avatar-xs pull-up")
                         .attr("data-bs-toggle", "tooltip")
                         .attr("data-popup", "tooltip-custom")
                         .attr("data-bs-placement", "top")
                         .attr("title", item.user);
                       var userAvatarImage = $("<img>")
                         .attr("src", item.profile)
                         .attr("alt", "")
                         .addClass("rounded-circle");
                       userAvatarItem.append(userAvatarImage);
                       userAvatar.append(userAvatarItem);
                       userColumn.append(userAvatar);
                       row.append(userColumn);

                       var assigneesColumn = $("<td></td>").css("width", "13%");
                       var assigneesList = $("<ul></ul>").addClass(
                         "list-unstyled users-list m-0 avatar-group d-flex align-items-center"
                       );
                       $.each(item.assignees, function (index, assignee) {
                         var assigneeItem = $("<li></li>")
                           .addClass("avatar avatar-xs pull-up")
                           .attr("data-bs-toggle", "tooltip")
                           .attr("data-popup", "tooltip-custom")
                           .attr("data-bs-placement", "top")
                           .attr("title", assignee);
                         var assigneeImage = $("<img>")
                           .attr("src", item.assigneeProfiles[index])
                           .attr("alt", "")
                           .addClass("rounded-circle");
                         assigneeItem.append(assigneeImage);
                         assigneesList.append(assigneeItem);
                       });
                       assigneesColumn.append(assigneesList);
                       row.append(assigneesColumn);

                       var milestoneColumn = $("<td></td>").css("width", "10%");
                       var milestoneContent = $("<div></div>").addClass("dropdown");
                       var milestoneText = $("<span></span>").text(item.milestone);
                       var milestoneButton = $("<button></button>")
                         .addClass("btn p-0 dropdown-toggle hide-arrow")
                         .attr("type", "button")
                         .attr("data-bs-toggle", "dropdown");
                       var milestoneIcon = $("<i></i>").addClass("bx bx-dots-vertical-rounded");
                       var milestoneMenu = $("<div></div>").addClass("dropdown-menu");
                       var moveMenuItem = $("<a></a>")
                         .addClass("dropdown-item")
                         .attr("href", "javascript:void(0)")
                         .html('<i class="bx bx-send me-1"></i> 이동');
                       var deleteMenuItem = $("<a></a>")
                         .addClass("dropdown-item")
                         .attr("href", "javascript:void(0)")
                         .html('<i class="bx bx-trash me-1"></i> 삭제');

                       // Check if milestone is empty and add the 'invisible' class
                       if (!item.milestone) {
                         milestoneContent.addClass("invisible");
                       }

                       milestoneContent.append(
                         milestoneText,
                         milestoneButton.append(milestoneIcon),
                         milestoneMenu.append(moveMenuItem, deleteMenuItem)
                       );
                       milestoneColumn.append(milestoneContent);
                       row.append(milestoneColumn);

                       tableBody.append(row);
                       // 데이터 처리 로직
                     }
                   }
   
            
            
            
            
            
            
            
         
         </script>


         <c:if test="${not empty newTitle }">

            <script>
               $(function() {
                  issueWeb();
               });
            </script>

         </c:if>




         <!-- ------------------------------------------------------------------------------------------------------------- -->



			<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>