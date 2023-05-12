<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/jquery/jquery-3.1.1.min.js"></script>
<style>
</style>




</style>



<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/i18n/defaults-*.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/issue_select.css">
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css">
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/issue_mini.js"></script>



<!-- 알람 종 js -->
<script src="${pageContext.request.contextPath}/resources/js/alarm.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/alarmSocket.js"></script>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>


</head>

<body>

	<jsp:include page="../common/template.jsp" />

	<div class="container total-box" style="margin-left: 0px; margin-right: 0px;">

		<form action="createIssue.mi" method="post" id="issueEnrollForm">

			<input type="text" class="form-control issuetitle" name="title" placeholder="이슈 제목 입력" autofocus required>



			<input type="hidden" name="userName" value="${loginUser.userName}">
			<input type="hidden" name="userNo" value="${loginUser.userNo}">
			<input type="hidden" name="assignee" value="">
			<input type="hidden" name="label" value="">
			<input type="hidden" name="newTitle" value="">


			<div class="why">
				<div class="editor-wrapper">

					<div id="editor">에디터활성안돼 씨앙</div>

					<input type="hidden" name="body" value="">


				</div>
				<div class="btn-box">
					<br>
					<button type="submit" class="btn btn-outline-primary" id="btn1">제출하기</button>

				</div>
		</form>
	</div>




	<div class="editor-label">






		<div class="mb-3">
			<label for="defaultSelect" class="form-label">이슈 담당자</label>

			<select id="defaultSelect" class="form-select assigneesSelect" name="issueAss">
				<option>이슈 담당자</option>
				<c:forEach var="r" items="${RepoMembers }">
					<option value="${r.userName }">${r.userName}</option>
				</c:forEach>
			</select>
		</div>


		<div class="mb-3">
			<label for="defaultSelect" class="form-label">라벨</label>
			<select id="defaultSelect" class="form-select labelSelect" name="issueLabel">
				<option>라벨</option>
				<c:forEach var="l" items="${lList }">
					<option value="${l.name }">${l.name }</option>
				</c:forEach>
			</select>
		</div>













	</div>
	<!-- editor-label -->

	</div>








	<script>

	 $('.assigneesSelect').change(function() {
		 var selectedAssignee = $(this).val();
		 console.log(selectedAssignee); // 선택된 이슈 담당자 출력

		 $('input[name="assignee"]').val(selectedAssignee);

		 });

		 $('.labelSelect').change(function() {
		 var selectedLabel = $(this).val();
		 console.log(selectedLabel); // 선택된 라벨 출력

		 $('input[name="label"]').val(selectedLabel);  
		 });
  


            
	$(document).ready(function() {
	    $('#issueEnrollForm').submit(function() {
	    	
	    	
	      
	    	
	        
	        console.log("aaaaaaaa")
	    	
	      

	        return true;
	    });
	});


		

            
        </script>

</body>

</html>


