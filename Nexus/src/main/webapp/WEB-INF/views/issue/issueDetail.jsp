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


<!-- 테스트 중인 js,css -->

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/issue_test.css">
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-multiselect.css"> -->
<script src="${pageContext.request.contextPath}/resources/js/issue_test.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/comboTreePlugin.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap-multiselect2.js"></script>




</head>

<body>
    
    <jsp:include page="../common/template.jsp" />






        <div class="container total-box" style="margin-left: 0px; margin-right: 0px;">

            <form action="updateIssue" method="post" id="issueUpdateForm">

                <input type="text" class="form-control issuetitle" id="isTitle" name="issueTitle" placeholder="Title"
                    autofocus>


                <div class="why">
                    <div class="editor-wrapper">
                        <div id="editor">
                        </div>

                        <!-- 본인 글일때만 보이게 분기처리 ### -->
                        <div class="btn-box">
                            <br>
                            <a type="button" class="btn btn-outline-secondary" onclick="postFormSubmit(1);">수정하기</button>
                            <a type="button" class="btn btn-outline-danger" onclick="postFormSubmit(2);">삭제하기</a>

                        </div>
                    </div>

            </form>
        </div>


        <!-- 이슈 번호랑 사진있으면 그 사진경로 가져가야함!! ### -->
        <form id="postForm" action="" method="post">
            <input type="hidden" name="ino" value="">
            <input type="hidden" name="filePath" value="">
        </form>


        <!-- 구분선 -->
        <!-- 멀티 셀렉 되게 다 바꾸자! -->

        <div class="editor-label">


            <div class="mb-3">
                <label for="defaultSelect" class="form-label">이슈 담당자</label>
                <select id="defaultSelect" class="form-select">
                    <option>이슈 담당자 - 지정된사람 출력되게 (여럿일 경우 이름 순서대로)</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>
            </div>


            <div class="mb-3">
                <label for="defaultSelect" class="form-label">Default select</label>
                <select id="defaultSelect" class="form-select">
                    <option>Default select</option>
                    <option value="1">One</option>
                    <option value="2">Two</option>
                    <option value="3">Three</option>
                </select>
            </div>









            <br>
            <hr><br>

            <div class="mb-3">
                <label for="defaultSelect" class="form-label">테스트 담당자</label>

                <div class="profiles-list" style="display:none;">
                    <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
                        <!-- Add selected profile li elements here -->
                    </ul>
                </div>

                <select id="defaultSelect" class="form-select" multiple>
                    <option value="1">이혜민</option>
                    <option value="2">홍길동</option>
                    <option value="3">김철수</option>
                </select>

            </div>


            <!-- ---------------------------------------------- -->


<select multiple>
  <option value="option1">Option 1</option>
  <option value="option2">Option 2</option>
  <option value="option3">Option 3</option>
</select>








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