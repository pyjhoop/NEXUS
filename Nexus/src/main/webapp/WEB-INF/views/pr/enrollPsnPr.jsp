<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/logo3.png" />
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
	height: 1000px;
	width: 78%;
	margin:auto;
	border:1px solid black;
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
	margin-top:15px;
	color:black;
}
input{
	background-color:#f1eef5
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
</style>
</head>
<body>
<jsp:include page="../common/template.jsp"/>

<div id="body">

<div id="body1">
	<div id="body1Ment">
		<H4><b>개인 홍보 기본정보를 입력해주세요</b></H4>
	</div>
	<div id="psnInfoInput">
		<ul>
			<li>
				이름<br><input type=text >
			</li>
			<li>
				기술스택<br><input type=text>
			</li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ul>
	</div>
</div>

<div id="body2">

<div id="body2Ment">
		<H4><b>프로젝트에 대해 소개해주세요</b></H4>
	</div>
	
<body>
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
    
    <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
    
    </body>
</div>

	
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

</body>
</html>
