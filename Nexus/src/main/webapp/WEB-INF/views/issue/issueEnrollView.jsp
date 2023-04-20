<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/jquery/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="js/comboTreePlugin.js"></script>
    <script type="text/javascript" src="js/icontains.js"></script>
<style>
</style>


<script>

	$(function(){
		console.log("Dd");
		init();
	});

	   function init(){
		console.log("ssss");
        var test1_JSON = new Array();
        var test2_JSON = new Array();

        jsonMaker(10, test1_JSON);

        test1 = $("#test1").comboTree({
          source : test1_JSON,
    			isMultiple: true,
    			cascadeSelect: false
        })

      }

      function jsonMaker(limit, arr){
        for(i=0; i<limit; i++){
          arr.push({id: "id"+i, title: "title"+i});
        }
      }
  function multiSelect(value){
   if(value=="OPEN") Div.style.visibility="visible";
   else Div.style.visibility="hidden";
  }

  



  
  </script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
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

			<input type="text" class="form-control issuetitle" id="isTitle" name="issueTitle" placeholder="Title" autofocus>


			<div class="why">
				<div class="editor-wrapper">
					<div id="editor"></div>

					<!-- 본인 글일때만 보이게 분기처리 ### -->
					<div class="btn-box">
						<br>
						<a type="submit" class="btn btn-outline-primary" onclick="return confirm();">제출하기</a>
					

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
				<option value="1" type="checkbox">One</option>
				<option value="2" type="checkbox">Two</option>
				<option value="3" type="checkbox">Three</option>
			</select>
		</div>


		<form name="form1">
			<table cellpadding="0" cellspacing="0" style="cursor: pointer" onClick="multiSelect('OPEN')">
				<tr>
					<td align="center" width="200" style="border: 1px solid; font-size: 12px;">다중선택 리스트</td>
					<td>
						<input type="button" value="▼" onclick="">
					</td>
				</tr>
			</table>

			<div id="Div" style="position: absolute; visibility: hidden; font-size: 12px;">
				<ul>
					<li><input type="checkbox" name="chk1" id="chk1">체크리스트1</li>
					<li><input type="checkbox" name="chk2" id="chk2">체크리스트2</li>
					<li><input type="checkbox" name="chk3" id="chk3">체크리스트3</li>
					<li><input type="checkbox" name="chk4" id="chk4">체크리스트4</li>
					<li><input type="checkbox" name="chk5" id="chk5">체크리스트5</li>
					<li><input type="checkbox" name="chk6" id="chk6">체크리스트6</li>
					<li><input type="checkbox" name="chk7" id="chk7">체크리스트7</li
				</ul>
				<div style="padding-top: 3px; text-align: right">
					<input type="button" value="확인" onClick="multiSelect('CLOSE')">
				</div>
			</div>
		</form>


		<div class="mb-3">
			<label for="defaultSelect" class="form-label" multiple="multiple">multiple select</label>
			<select id="defaultSelect" class="form-select">
				<option>Default select</option>
				<option value="1">One</option>
				<option value="2">Two</option>
				<option value="3">Three</option>
			</select>
		</div>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br>




<div class="line">
      <input type="text" id="test1" autocomplete="off" placeholder="Multiple Select">
    </div>
    <div class="line">
      <input type="text" id="test2" autocomplete="off" placeholder="Multiple Select">
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



        </script>

</body>

</html>