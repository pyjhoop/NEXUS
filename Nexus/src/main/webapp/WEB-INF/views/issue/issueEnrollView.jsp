<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/jquery/jquery-3.1.1.min.js"></script>

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

<style>
	.assClose:hover{
		cursor: pointer;
	}
	.labelClose:hover{
		cursor: pointer;
	}
</style>


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






		<div class="mb-3 test">
			<label for="defaultSelect1" class="form-label">이슈 담당자</label>

			<select id="defaultSelect1" class="form-select assigneesSelect" name="issueAss" onchange="selectAss();">
				<option>이슈 담당자</option>
				<c:forEach var="r" items="${RepoMembers }">
					<option  value="${r.profile}">${r.userName}</option>
				</c:forEach>
			</select>
			<br>
			
		</div>


		<div class="mb-3 test1">
			<label for="defaultSelect" class="form-label">라벨</label>
			<select id="defaultSelect" class="form-select labelSelect" name="issueLabel" onchange="selectLabel();">
				<option>라벨</option>
				<c:forEach var="l" items="${lList }">
					<option value="${l.name }">${l.name }</option>
				</c:forEach>
			</select>
			<br>
			
		</div>













	</div>
	<!-- editor-label -->

	</div>








	<script>

		function selectAss(){

		var numSelect = document.getElementById("defaultSelect1");
		var userName = numSelect.options[document.getElementById("defaultSelect1").selectedIndex].text;
		var profile = numSelect.options[document.getElementById("defaultSelect1").selectedIndex].value;
		var assignees = $("input[name=assignee]");

		if(userName == "이슈 담당자") return;

		let ass = $(".test ul");
		
		let boolean = "";
		
		for(let i=0; i<ass.length; i++){
			boolean = "false";
			var check = $(ass[i]).prop("id");
			if(userName == check){
				boolean = "true";
				break;
			}
		}

		if(boolean == "true") return;
			var str = '<ul id="'+userName+'" class="mb-1 list-unstyled users-list m-0 avatar-group d-flex align-items-center">'
			+'<li class="avatar avatar-xs pull-up"><img src="'+ profile+'" alt="" class="rounded-circle"></li>'
			+ userName+'<i i class="bx bx-x-circle mt-1 ml-1 assClose"></i>';
			
			if(ass.length==0){
				assignees.val(userName);
			}else{
				assignees.val(assignees.val()+","+userName);
			}
			$(".test").append(str)
		}

		function selectLabel(){
			var numSelect = document.getElementById("defaultSelect");
			var label = numSelect.options[document.getElementById("defaultSelect").selectedIndex].value;
			var labelStr = $("input[name=label]");

			if(label == "라벨") return;

			let str = createLabel(label);

			let labels = $(".labelSpan");
		

			let boolean1 = "";

			for(let i=0; i<labels.length; i++){
				boolean1 = "false";
				var check1 = $(labels[i]).prop("id");
				if(label == check1){
					boolean1 = "true";
					break;
				}
			}

			if(boolean1 == "true") return;

			if(labels.length ==0){
				labelStr.val(label);
			}else{
				labelStr.val(labelStr.val()+","+label);
			}
			$(".test1").append(str);



		}

		function createLabel(label){
			let str = "";
			if(label == "bug"){
				str = '<span class="labelSpan mr-1" id="'+label+'"><span class="badge rounded-pill bg-label-danger">bug</span><i class="bx bx-x-circle ml-1 labelClose"></i></span>'
			}else if(label == "enhancement"){
				str = '<span class="labelSpan mr-1" id="'+label+'"><span class="badge rounded-pill bg-label-info">enhancement</span><i class="bx bx-x-circle ml-1 labelClose"></i></span>'
			}else if(label == "duplicate"){
				str = '<span class="labelSpan mr-1" id="'+label+'"><span class="badge rounded-pill bg-label-dark">duplicate</span><i class="bx bx-x-circle ml-1 labelClose"></i></span>'
			}else if(label == "documentation"){
				str = '<span class="labelSpan mr-1" id="'+label+'"><span class="badge rounded-pill bg-label-primary">documentation</span><i class="bx bx-x-circle ml-1 labelClose"></i></span>'
			}else if(label == "invalid"){
				str = '<span class="labelSpan mr-1" id="'+label+'"><span class="badge rounded-pill bg-label-warning">invalid</span><i class="bx bx-x-circle ml-1 labelClose"></i></span>'
			}else if(label == "help wanted"){
				str = '<span class="labelSpan mr-1" id="'+label+'"><span class="badge rounded-pill bg-label-success">help wanted</span><i class="bx bx-x-circle ml-1 labelClose"></i></span>'
			}else{
				str = '<span class="labelSpan mr-1" id="'+label+'"><span class="badge rounded-pill bg-label-secondary">'+label+'</span><i class="bx bx-x-circle ml-1 labelClose"></i></span>'
			}

			return str;
		}


	

		
  


            
	$(document).ready(function() {

		$(document).on("click",".assClose",function(){
			console.log($(this));
			$(this).parent("ul").remove();
		})

		$(document).on("click",".labelClose",function(){
			$(this).parent(".labelSpan").remove();
		})



	    $('#issueEnrollForm').submit(function() {
	    	
	    	
	      
	    	
	        
	        console.log("aaaaaaaa")
	    	
	      

	        return true;
	    });
	});


		

            
        </script>

</body>

</html>


