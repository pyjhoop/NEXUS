<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/logo3.png" />
<!-- jQuery 라이브러리 -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Main Quill library -->
<script src="//cdn.quilljs.com/1.3.6/quill.js"></script>
<script src="//cdn.quilljs.com/1.3.6/quill.min.js"></script>

<!-- Theme included stylesheets -->
<link href="//cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
<link href="//cdn.quilljs.com/1.3.6/quill.bubble.css" rel="stylesheet">

<!-- Core build with no theme, formatting, non-essential modules -->
<link href="//cdn.quilljs.com/1.3.6/quill.core.css" rel="stylesheet">
<script src="//cdn.quilljs.com/1.3.6/quill.core.js"></script>
<style>

#body{
	height: 2000px;
	width: 90%;
	margin:auto;
	/* border:1px solid black; */
	margin-top:20px;
	margin-bottom:50px;
}
#body1{
	height:45%;
	width:90%;
	margin:auto;
	border:1px solid black;
}
#body2{
	height:55%;
	width:90%;
	margin:auto;
	border:1px solid black;
}
#body1Ment{
	margin-top:25px;
	color:black;
}
input{
	width:300px;
}
#psnInfoInput li{
	

}
#toolbar-container{
	width:90%;
}
#editor-container{
	width:90%;
	height:70%;
}
multi-input {
  display: inline-block;
  margin: 0 20px 20px 0;
   
}

button {
  background-color: #eee;
  border: 1px solid #ddd;  
  font-size: 16px;
  height: 30px;
  margin: 0 10px 20px 0;
}
#h4Letter{
	float:left;
}
.col-md-4{
	width:100%;
}
.col-md-6{
	width:100%;
}
#stackInputCard{
	width: 700px;
}
.form-control{
	height: 60px;
}
.input-group{
	margin-top:50px;
}
label{
	font-size: 20px;
}
</style>
</head>
<body>
<jsp:include page="../common/template.jsp"/>

<div id="body">

	
	<div class="col-md-6" style="width:100%; height:100%">
                  <div class="card mb-4">
                    <h4 class="card-header"><b>기본 정보 입력</b></h4>
                    <div class="card-body demo-vertical-spacing demo-only-element">
                    
                    <label><b>제목</b></label>
                      <div class="input-group">
                       <!--  <span class="input-group-text" id="basic-addon11">@</span> -->
                        <input type="text" class="form-control" placeholder="제목을 입력해주세요" aria-label="Username" aria-describedby="basic-addon11">
                      </div>
                      
                       <label ><b>프로젝트 참여 가능기간</b></label>
                      <div class="input-group" style="margin-top: 90px;">
                       <!--  <span class="input-group-text" id="basic-addon11">@</span> -->
                        <input  style="margin-top:0px;" type="text" class="form-control" placeholder="프로젝트 참여 가능기간을 입력해주세요 (ex-5월말부터 가능 or 6월중순부터 6개월간 가능 등)" aria-label="Username" aria-describedby="basic-addon11">
                      </div>
                      
                      <label ><b>연락 수단</b></label>
                      <div class="input-group">
                       <!--  <span class="input-group-text" id="basic-addon11">@</span> -->
                        <input type="text" class="form-control" placeholder="핸드폰번호나 이메일, 오픈카톡방 링크 등 연락받기를 원하는 방법을 입력해주세요." aria-label="Username" aria-describedby="basic-addon11">
                      </div>
					
                    
                   <label ><b>기술 스택</b></label>    
                   <div class="input-group">
                       		<multi-input>
			      <input id="stackInputCard" list="speakers" placeholder="사용가능한 자신의 기술 스택을 선택해주세요.">
			      <datalist id="speakers">
			        <option value="AWS"></option>
			        <option value="Django"></option>
			        <option value="Docker"></option>
			        <option value="Express"></option>
			        <option value="Figma"></option>
			        <option value="Firebase"></option>
			        <option value="Flutter"></option>
			        <option value="Git"></option>
			        <option value="Go"></option>
			        <option value="GraphQL"></option>
			        <option value="Java"></option>
			        <option value="JavaScript"></option>
			        <option value="Kotlin"></option>
			        <option value="Kubernetes"></option>
			        <option value="MongoDB"></option>
			        <option value="MySQL"></option>
			        <option value="Nestjs"></option>
			        <option value="Nextjs"></option>
			        <option value="NodeJs"></option>
			        <option value="php"></option>
			        <option value="Python"></option>
			        <option value="TypeScript"></option>
			        <option value="React"></option>
			        <option value="ReactNative"></option>
			        <option value="Spring"></option>
			        <option value="Svelte"></option>
			        <option value="Swift"></option>
			        <option value="Unity"></option>
			        <option value="Vue"></option>
			        <option value="Zeplin"></option>
			        <option value="Zest"></option>
			      </datalist>
			    </multi-input>
			    <button id="get">Get</button>
                       		<p id="values"></p>
                       </div>
                      
                    </div>
                  </div>
                </div>
                <div id="standalone-container">
      <div id="toolbar-container">
        <span class="ql-formats">
          <select class="ql-font"></select>
          <select class="ql-size"></select>
        </span>
        <span class="ql-formats">
          <button class="ql-bold"></button>
          <button class="ql-italic"></button>
          <button class="ql-underline"></button>
          <button class="ql-strike"></button>
        </span>
        <span class="ql-formats">
          <select class="ql-color"></select>
          <select class="ql-background"></select>
        </span>
        <span class="ql-formats">
          <button class="ql-script" value="sub"></button>
          <button class="ql-script" value="super"></button>
        </span>
        <span class="ql-formats">
          <button class="ql-header" value="1"></button>
          <button class="ql-header" value="2"></button>
          <button class="ql-blockquote"></button>
        </span>
        <span class="ql-formats">
          <button class="ql-list" value="ordered"></button>
          <button class="ql-list" value="bullet"></button>
          <button class="ql-indent" value="-1"></button>
          <button class="ql-indent" value="+1"></button>
        </span>
        <span class="ql-formats">
          <button class="ql-direction" value="rtl"></button>
          <select class="ql-align"></select>
        </span>
        <span class="ql-formats">
          <button class="ql-link"></button>
          <button class="ql-image"></button>
          <button class="ql-video"></button>
        </span>
        <span class="ql-formats">
          <button class="ql-clean"></button>
        </span>
      </div>
      <div id="editor-container"></div>
    </div>
                
                
    <!-- body태그 --></div> 
	 
    
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
	



	

</div>

<script>
var quill = new Quill('#editor-container', {
	  modules: {
	    formula: true,
	    syntax: true,
	    toolbar: '#toolbar-container'
	  },
	  placeholder: '게시물을 작성해주세요.',
	  theme: 'snow'
	});
</script>

<script src="./././resources/js/multi-input.js"></script>
  <script src="./././resources/js/script.js"></script>

</body>
</html>
