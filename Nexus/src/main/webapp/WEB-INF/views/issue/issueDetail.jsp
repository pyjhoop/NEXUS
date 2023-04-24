<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>

        <style>
         
        </style>


<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">
<script
src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/i18n/defaults-*.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/issue_select.css">
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css">
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/issue_mini.js"></script>






</head>

<body>
    
    <jsp:include page="../common/template.jsp" />






        <div class="container total-box" style="margin-left: 0px; margin-right: 0px;">

            <form action="updateIssue" method="post" id="issueUpdateForm">

                <input type="text" class="form-control issuetitle" name="title" placeholder="Title" value="${title }"
                    autofocus>


                <div class="why">
                    <div class="editor-wrapper">
                        <div id="editor">
                        ${body }
                        </div>

                        <!-- 본인 글일때만 보이게 분기처리 ### -->
                        <div class="btn-box">
                            <br>
                            <button type="button" class="btn btn-outline-secondary" >수정하기</button>
                            <button type="button" class="btn btn-outline-danger">종료하기</button>

                        </div>
                    </div>

            </form>
        </div>


 

    

        <div class="editor-label">


         



		<div class="mb-3">
			<label for="defaultSelect" class="form-label">이슈 담당자</label>
			
			<div>

   <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
  <c:forEach items="${assignees}" var="a">
  <p>${assignees}</p>
  <p>${a }</p>
    <li data-bs-toggle="tooltip" data-popup="tooltip-custom" data-bs-placement="top" class="avatar avatar-xs pull-up" title="${assignee}">
      <img src="${assigneeProfiles[loop.index]}" alt="" class="rounded-circle" />
    </li>
  </c:forEach>
</ul>

</ul>





			</div>
			
			<select id="defaultSelect" class="form-select" name="assignees">
				<option>이슈 담당자</option>
				<option value="libiho" type="checkbox">One</option>
				<option value="pyjhoop" type="checkbox">Two</option>
				<option value="kanginho1" type="checkbox">Three</option>
			</select>
		</div>


	<div class="mb-3">
			<label for="defaultSelect" class="form-label">라벨</label>
			<select id="defaultSelect" class="form-select" name="labels">
				<option>라벨</option>
				<option value="1" type="checkbox">One</option>
				<option value="2" type="checkbox">Two</option>
				<option value="3" type="checkbox">Three</option>
			</select>
		</div>





	<div class="mb-3">
			<label for="defaultSelect" class="form-label">프로젝트</label>
			<select id="defaultSelect" class="form-select" name="">
				<option>프로젝트</option>
				<option value="1" type="checkbox">One</option>
				<option value="2" type="checkbox">Two</option>
				<option value="3" type="checkbox">Three</option>
			</select>
		</div>


	<div class="mb-3">
			<label for="defaultSelect" class="form-label">마일스톤</label>
			<select id="defaultSelect" class="form-select" name="milestone">
				<option>마일스톤</option>
				<option value="1" type="checkbox">One</option>
				<option value="2" type="checkbox">Two</option>
				<option value="3" type="checkbox">Three</option>
			</select>
		</div>





         







        </div> <!-- editor-label -->

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



        </script>

    </body>

    </html>