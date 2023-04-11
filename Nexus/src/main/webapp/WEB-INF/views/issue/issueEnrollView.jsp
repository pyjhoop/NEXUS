<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>


 .container {
  display: flex;
  height: 500px;
  margin-top : 50px;

} 

.mini_plz{
  display: flex;
  flex-direction: row;
  margin: 0 auto;
  width: 100%;
  max-width: 1000px;
}

.editor-wrapper {
  flex: 1 1 80%;
  padding: 10px;
}

.editor-label {
  flex: 1 1 20%;
  padding: 10px;
}

 

</style>

<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css">
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

</head>
<body>

	<jsp:include page="../common/template.jsp"/>

 <div class="container" style="margin-left: 0px; margin-right: 0px;">
  
  	<div class="mini_plz">
  	<div class="editor-wrapper">
	    <div id="editor">
	
	    </div>
  	</div>
  	<div class="editor-label">
  		<h4>라벨</h4>
  		<input type="checkbox" id="checkbox1" name="checkbox1">
  		<label for="checkbox1">체크박스1</label>
  		<input type="checkbox" id="checkbox2" name="checkbox2">
  		<label for="checkbox2">체크박스2</label>
  	</div>
  	</div>
  </div>

  <script>
      var editor = new toastui.Editor({
          el: document.querySelector('#editor'),
          height: '100%',
          initialEditType: 'markdown',
          initialValue: '# Hello, World!'
      });
      var markdownValue = editor.getMarkdown();   
      console.log(markdownValue); // Output: "# Hello, World!"
  </script>

</body>
</html>
