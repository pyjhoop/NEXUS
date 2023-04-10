<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css">
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

</head>
<body>
	<div id="editor"></div>
    <script>
        var editor = new toastui.Editor({
            el: document.querySelector('#editor'),
            height: '500px',
            initialEditType: 'markdown',
            previewStyle: 'vertical',
            initialValue: '# Hello, World!'
        });
        var markdownValue = editor.getMarkdown();	
        console.log(markdownValue); // Output: "# Hello, World!"
    </script>
	
</body>
</html>