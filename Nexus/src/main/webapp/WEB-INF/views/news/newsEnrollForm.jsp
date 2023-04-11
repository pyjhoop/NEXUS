<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css">
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newsEnrollForm.css">


</head>
<body>


    <form action="" method="get" id="newsEnrollForm">
        <div id="editor"></div>
    </form>





    <script>
        var editor = new toastui.Editor({
            el: document.querySelector('#editor'),
            height: '500px',
            initialEditType: 'markdown',
            initialValue: '# Hello, World!',
            codeBlock: false
        });

        editor.removeToolbarItem("Code",false);
        var markdownValue = editor.getMarkdown();	
        console.log(markdownValue); // Output: "# Hello, World!"
    </script>
	
</body>
</html>