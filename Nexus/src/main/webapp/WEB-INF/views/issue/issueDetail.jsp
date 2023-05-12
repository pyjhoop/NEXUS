<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
</style>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/i18n/defaults-*.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/issue_select.css">
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css">
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/issue_mini.js"></script>






</head>

<body>

	<jsp:include page="../common/template.jsp" />






	<div class="container total-box" style="margin-left: 0px; margin-right: 0px;">

		<form action="updateIssue.mi" method="post" id="issueUpdateForm">

			<input type="text" class="form-control issuetitle" name="title" placeholder="Title" value="${title }" autofocus>
			<input type="hidden" name="ino" value="${ino }">
			<input type="hidden" name="assigneesHidden" value="">
			<input type="hidden" name="projectHidden" value="">
			<input type="hidden" name="mileHidden" value="">
			<input type="hidden" name="labelHidden" value="">

			<div class="why">
				<div class="editor-wrapper">
					<div id="editor">${body }</div>
					<input type="hidden" name="body" value="">
					<!-- 본인 글일때만 보이게 분기처리 ### -->
					<div class="btn-box">
						<br>
						<button type="submit" class="btn btn-outline-primary" id="btn1">수정하기</button>
						<button type="button" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#myissueModal">상태 수정</button>

					</div>


				</div>
		</form>
	</div>



	<!-- Modal -->
	<form action="issueState.mi" method="post">
		<div class="modal fade" id="myissueModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">이슈 상태 변경</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<input type="hidden" name="ino" value="${ino}">
						 "${title}" 이슈의 ${state } 상태를 변경합니다
					</div>
					<div class="modal-footer">
						<!-- 상태에 따라 종료 / open 버튼 text 바뀌게 ### -->
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
						<c:choose>
							<c:when test="${state eq 'open' }">
								<button type="submit" class="btn btn-primary" name="state" value="closed">이슈 종료</button>
							</c:when>
							<c:otherwise>
								<button type="submit" class="btn btn-primary" name="state" value="open">이슈 재오픈</button>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</form>



	<div class="editor-label">
	
	
		<div class="mb-3">
			<label for="defaultSelect" class="form-label">이슈 담당자</label> <br>
			<div>

				<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
					<c:forEach var="assignee" items="${assignees}">
						<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-m pull-up" title="${assignee.userName}"><img src="${assignee.profile}" alt="" class="rounded-circle" /></li>
					</c:forEach>
				</ul>


			</div>

			<br>

			<select id="issueAssignees" class="form-select" name="assignees" multiple>
			
				<c:forEach var="r" items="${RepoMembers}">
				<c:if test="${empty r }">			
				<option>이슈 담당자</option>
</c:if>

					<option value="${r.userName}" <c:forEach var="assignee" items="${assignees}">
            <c:if test="${r.userName == assignee.userName}">
                selected
            </c:if>
        </c:forEach>>${r.userName}</option>
				</c:forEach>


			</select>
		</div>







		<div class="mb-3">
			<label for="defaultSelect" class="form-label">라벨</label>
			
			
			<div>
			
		<c:forEach items="${labels}" var="label">
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
		
			
			
			</div>
			
			<br>
			<select id="defaultSelect" class="form-select labelSelect" name="issueLabel" multiple>
				<c:forEach var="l" items="${lList }">
				<c:if test="${empty l }">
				<option>라벨</option>
				</c:if>
					<option value="${l.name }" <c:forEach items="${labels}" var="label"> <c:if test="${l.name == label }"> selected </c:if></c:forEach>>${l.name }</option>
				</c:forEach>
			</select>
		</div>












	</div>
	<!-- editor-label -->

	</div>

	<script>

            var editor = new toastui.Editor({
                el: document.querySelector('#editor'),
                height: '100%',
                initialEditType: 'markdown'

            });
            var markdownValue = editor.getMarkdown();
            console.log(markdownValue); // Output: "# Hello, World!"


            $(document).ready(function() {
        	    $('#issueUpdateForm').submit(function() {
        	    	
        	    	
        	    	  var markdown = editor.getMarkdown();
        	    	    $("input[name='body']").val(markdown);
        	    	
        	        
        	    	
        	      

        	        return true;
        	    });
        	});
            
      
            

        </script>

</body>

</html>