<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>


.input-group input{
	width:80px;
}

.total-box{
  display: flex;
   border-radius: 0.375rem;
    height: 80%;
}

 .input-top {
  display: flex;
  margin-top:50px;
 
 
  border-radius: 0.375rem;
} 

.why{
width:100%;
	height:88%;
	 background-color: white;
}

.editor-wrapper {
width:100%;
  flex: 1 1 68%;
  padding: 20px 20px;
  height:85%;
    background-color: white;
    border-radius: 0.375rem;
}


.editor{
	width:100%;
}

.btn-box{
	width:100%;

}

.btn-box button{
	
	float:right;
	margin-right:10px;
}



.editor-label {
  flex: 1 1 32%;
  padding: 20px 20px;
   background-color: white;
   border-radius: 0.375rem;
    margin-top: 50px;
}

 .issuetitle{
 
 margin-top: 50px;
 }





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

	<jsp:include page="../common/template.jsp"/>






 <div class="container total-box" style="margin-left: 0px; margin-right: 0px;">
  
   <form action="insertNews" method="post" id="newsEnrollForm">
  
    <input type="text" class="form-control issuetitle" id="newsTitle" name="newsTitle" placeholder="Title"  autofocus>
  
  
	<div class = "why">
  	<div class="editor-wrapper">
	    <div id="editor">
	    </div>
	    <div class="btn-box">
	    <br>
	    
	    <!-- 분기처리해서 디테일로 오면 수정하기랑 삭제하기만 보이게 하기 -->
                    <button type="submit" class="btn btn-outline-primary" onclick="return test();">제출하기</button>
  <button type="submit" class="btn btn-outline-secondary">수정하기</button>
                    <button type="submit" class="btn btn-outline-danger">삭제하기</button>
    
	    </div>
  	</div>
  	
  	</form>
  	</div>
  	
  	<!-- 구분선 -->
  	
  	<div class="editor-label">
  
<div class="wrapper">
  <div class="select">
    <span>나라를 선택해주세요</span>
    <span class="material-icons">expand_more</span>
  </div><!--select-->
  <div class="content">
    <div class="search-box">
      <span class="material-icons">search</span>     
      <input class="filter" type="text" placeholder="검색">
    </div><!--search box-->
    <ul class="options">
    </ul>
  </div><!--content-->
</div><!--wrapper-->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">







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
      
    
  </script>

</body>
</html>
