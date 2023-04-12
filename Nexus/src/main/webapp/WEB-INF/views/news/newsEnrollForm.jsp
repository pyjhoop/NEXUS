<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css">
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/newsEnrollForm.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newsEnrollForm.css">
</head>
<body>

    <jsp:include page="../common/template.jsp"/>
    <div class="container-xxl flex-grow-1 container-p-y cpadding">
        <form action="insertNews" method="post" id="newsEnrollForm">
            <div class="card">
                <input type="text" class="form-control" id="newsTitle" name="newsTitle" placeholder="Title"  autofocus>
                <div id="editor"></div>
                <input type="hidden" name="userNo" value="${loginUser.userNo}">
                <input type="hidden" name="newsContent" id="newsContent">
                <button type="submit" class="btn btn-primary sbtn" onclick="return test();">제출</button>

            </div>
        </form>
    </div>



    

   
	
</body>
</html>