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
			<input type="hidden" name="assignee" value="">
			<input type="hidden" name="mileHidden" value="">
			<input type="hidden" name="label" value="">

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
			<div class="mb-3 test">
				<label for="defaultSelect1" class="form-label">이슈 담당자</label>
	
				<select id="defaultSelect1" class="form-select assigneesSelect" name="issueAss" onchange="selectAss();">
					<option>이슈 담당자</option>
					<c:forEach var="r" items="${RepoMembers }">
						<option  value="${r.profile}">${r.userName}</option>
					</c:forEach>
				</select>
				<br>
				<div>
					<c:forEach var="assignee" items="${assignees}">
						<ul id="${assignee.userName}" class="mb-1 list-unstyled users-list m-0 avatar-group d-flex align-items-center">
						<li class="avatar avatar-xs pull-up"><img src="${assignee.profile}" alt="" class="rounded-circle"></li>
						${assignee.userName}<i i class="bx bx-x-circle mt-1 ml-1 assClose"></i></ul>
						<script>
							var assignees = $("input[name=assignee]");
							if(assignees.val().length == 0){
								assignees.val("${assignee.userName}");
							}else{
								assignees.val(assignees.val()+","+"${assignee.userName}");
							}
						</script>
					</c:forEach>
				</div>
				
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
				<c:forEach items="${labels}" var="label">
					<c:choose>
						<c:when test="${label eq 'bug'}">
							<span class="labelSpan mr-1" id="${label}"><span class="badge rounded-pill bg-label-danger">bug</span><i class="bx bx-x-circle ml-1 labelClose"></i></span>
						</c:when>
						<c:when test="${label eq 'enhancement'}">
							<span class="labelSpan mr-1" id="${label}"><span class="badge rounded-pill bg-label-info">enhancement</span><i class="bx bx-x-circle ml-1 labelClose"></i></span>
						</c:when>
						<c:when test="${label eq 'duplicate'}">
							<span class="labelSpan mr-1" id="${label}"><span class="badge rounded-pill bg-label-dark">duplicate</span><i class="bx bx-x-circle ml-1 labelClose"></i></span>
						</c:when>
						<c:when test="${label eq 'documentation'}">
							<span class="labelSpan mr-1" id="${label}"><span class="badge rounded-pill bg-label-primary">documentation</span><i class="bx bx-x-circle ml-1 labelClose"></i></span>
						</c:when>
						<c:when test="${label eq 'invalid'}">
							<span class="labelSpan mr-1" id="${label}"><span class="badge rounded-pill bg-label-warning">invalid</span><i class="bx bx-x-circle ml-1 labelClose"></i></span>
						</c:when>
						<c:when test="${label eq 'help wanted'}">
							<span class="labelSpan mr-1" id="${label}"><span class="badge rounded-pill bg-label-success">help wanted</span><i class="bx bx-x-circle ml-1 labelClose"></i></span>
						</c:when>
						<c:otherwise>
							<span class="labelSpan mr-1" id="${label}"><span class="badge rounded-pill bg-label-secondary">${label}</span><i class="bx bx-x-circle ml-1 labelClose"></i></span>
						</c:otherwise>
					</c:choose>
					<script>
						var labelStr = $("input[name=label]");
						console.log(assignees)
						if(labelStr.val().length == 0){
							labelStr.val("${label}");
						}else{
							labelStr.val(labelStr.val()+","+"${label}");
						}
					</script>
				</c:forEach>
			</div>

		</div>



<script>




document.getElementById('issueAssignees').addEventListener('change', function() {
  const selectedOptions = Array.from(this.selectedOptions).map(option => option.value);
  const assigneeList = document.getElementById('assigneeList');
  
  // Remove existing assignees
  const assignees = assigneeList.querySelectorAll('li');
  assignees.forEach(assignee => {
    assignee.remove();
  });
  
  // Add selected assignees
  const assigneeDropdown = this.options;
  for (let i = 0; i < assigneeDropdown.length; i++) {
    const option = assigneeDropdown[i];
    const userName = option.value;
    if (option.selected) {
      const newAssignee = document.createElement('li');
      newAssignee.setAttribute('data-bs-toggle', 'tooltip');
      newAssignee.setAttribute('data-popup', 'tooltip-custom');
      newAssignee.setAttribute('data-bs-placement', 'top');
      newAssignee.classList.add('avatar', 'avatar-m', 'pull-up');
      newAssignee.setAttribute('title', userName);
      
      const img = document.createElement('img');
      img.src = option.getAttribute('data-profile');
      img.alt = '';
      img.classList.add('rounded-circle');
      
      newAssignee.appendChild(img);
      assigneeList.appendChild(newAssignee);
    }
  }
});

</script>



	</div>
	<!-- editor-label -->

	</div>

	<script>

	$(document).on("click",".assClose",function(){
			console.log($(this));
			$(this).parent("ul").remove();
		})

		$(document).on("click",".labelClose",function(){
			$(this).parent(".labelSpan").remove();
		})

	function selectAss(){

		var numSelect = document.getElementById("defaultSelect1");
		var userName = numSelect.options[document.getElementById("defaultSelect1").selectedIndex].text;
		var profile = numSelect.options[document.getElementById("defaultSelect1").selectedIndex].value;

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
			+ userName+'<i class="bx bx-x-circle mt-1 ml-1 assClose"></i></ul>';
			
			$(".test").append(str)
	}

	function selectLabel(){
			var numSelect = document.getElementById("defaultSelect");
			var label = numSelect.options[document.getElementById("defaultSelect").selectedIndex].value;
			

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
        	    	
        	        // assignees
					var assignees = $("input[name=assignee]");
					var uls = $(".test ul");
					console.log(uls);
					var str1 = "";
					console.log($(uls[0]).prop("id"));
					for(let i=0; i<uls.length; i++){
						if(i==0){
							str1+=$(uls[i]).prop("id");
						}else{
							str1+= ","+$(uls[i]).prop("id");
						}
					}
					console.log(str1);
					assignees.val(str1);

					// labels
					var spans = $(".test1").children("label").siblings("span");
					var labelStr = $("input[name=label]");
					console.log(spans);
					var str2 = "";
					for(let i=0; i<spans.length; i++){
						if(i==0){
							str2 += $(spans[0]).prop("id");
						}else{
							str2 += ","+$(spans[i]).prop("id");
						}
					}
					labelStr.val(str2);
        	    	
        	        return true;
        	    });
        	});
            
      
            

        </script>

</body>

</html>