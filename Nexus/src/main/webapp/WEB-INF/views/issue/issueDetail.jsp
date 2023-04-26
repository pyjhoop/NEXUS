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
						현재 이슈의 ${state } 상태를 변경합니다
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
			<label for="defaultSelect" class="form-label">이슈 담당자</label>

			<div>
				<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
					<c:forEach items="${assignees}" var="a">
						<p>${assignees}</p>
						<p>${a }</p>
						<li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="${assignee}"><img src="${assigneeProfiles[loop.index]}" alt="" class="rounded-circle" /></li>
					</c:forEach>
				</ul>
			</div>

			<select id="issueAssignees" class="form-select" name="assignees">
				<option>이슈 담당자</option>
				<c:forEach var="r" items="${RepoMembers }">
					<option value="${r.userName }">${r.userName}</option>
				</c:forEach>
			</select>
		</div>


		<div class="mb-3">
			<label for="defaultSelect" class="form-label">라벨</label>
			<select id="issueLabel" class="form-select" name="labels">
				<option>라벨</option>
				<c:forEach var="l" items="${lList }">
					<option value="${l.name }">${l.name }</option>
				</c:forEach>
			</select>
		</div>



		<div class="mb-3">
			<label for="defaultSelect" class="form-label">프로젝트</label>
			<select id="issueProject" class="form-select" name="project">
				<option>프로젝트</option>
				<option value="1" type="checkbox">One</option>
				<option value="2" type="checkbox">Two</option>
				<option value="3" type="checkbox">Three</option>
			</select>
		</div>


		<div class="mb-3">
			<label for="defaultSelect" class="form-label">마일스톤</label>
			<select id="issueMile" class="form-select" name="milestone">
				<option>마일스톤</option>
				<option value="1" type="checkbox">One</option>
				<option value="2" type="checkbox">Two</option>
				<option value="3" type="checkbox">Three</option>
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


            /*----------------------------------------------------*/


// Get references to the select and hidden input elements
const selectEl = document.getElementById('issueAssignees');
const hiddenEl = document.querySelector('#issueUpdateForm input[name="assigneesHidden"]');

// Listen for change events on the select element
selectEl.addEventListener('change', (event) => {
  // Get the selected value and update the hidden input value
  const selectedValue = event.target.value;
  hiddenEl.value = selectedValue;
});

            
const selectE2 = document.getElementById('issueLabel');
const hiddenE2 = document.querySelector('#issueUpdateForm input[name="labelHidden"]');

// Listen for change events on the select element
selectE2.addEventListener('change', (event) => {
  // Get the selected value and update the hidden input value
  const selectedValue = event.target.value;
  hiddenE2.value = selectedValue;
});          
            
const selectE3 = document.getElementById('issueProject');
const hiddenE3 = document.querySelector('#issueUpdateForm input[name="projectHidden"]');

// Listen for change events on the select element
selectE3.addEventListener('change', (event) => {
  // Get the selected value and update the hidden input value
  const selectedValue = event.target.value;
  hiddenE3.value = selectedValue;
});  

const selectE4 = document.getElementById('issueMile');
const hiddenE4 = document.querySelector('#issueUpdateForm input[name="mileHidden"]');

// Listen for change events on the select element
selectE4.addEventListener('change', (event) => {
  // Get the selected value and update the hidden input value
  const selectedValue = event.target.value;
  hiddenE4.value = selectedValue;
});  
            
$("#btn1").click(function(){
    var markdown = editor.getMarkdown();
    $("input[name='body']").val(markdown);
});        
            
            

        </script>

</body>

</html>