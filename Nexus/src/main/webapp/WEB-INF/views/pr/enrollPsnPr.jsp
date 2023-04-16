<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/logo3.png" />
<jsp:include page="../common/template.jsp"/>

<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- jQuery 라이브러리 -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 

<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/newsEnrollForm.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newsEnrollForm.css">



        
        

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
	font-size: 16px;
}
#stackInputCard::placeholder {
  color: #a4aab1;
}
#buttonDiv>button{
	margin:auto;
	width: 170px;
	height: 60px;
}
</style>
</head>
<body>


	<form action="insertNews" method="post" style="height: 100%;">
<div id="body">
		<div class="col-md-6" style="width:94%; height:100%; margin: auto;">
                  <div class="card mb-4" style="width: 100%; margin: auto;">
                    <h4 class="card-header"  ><b>정보 입력</b></h4>
                    <div class="card-body demo-vertical-spacing demo-only-element" style="height: 1800px;"><br>
                    
                    <label><b>제목</b></label>
                      <div class="input-group" >
                       <!--  <span class="input-group-text" id="basic-addon11">@</span> -->
                        <input type="text" class="form-control" placeholder="제목을 입력해주세요" aria-label="Username" aria-describedby="basic-addon11">
                      </div> <br>
                      
                       <label ><b>프로젝트 참여 가능기간</b></label>
                      <div class="input-group" >
                       <!--  <span class="input-group-text" id="basic-addon11">@</span> -->
                        <input  style="margin-top:0px;" type="text" class="form-control" placeholder="프로젝트 참여 가능기간을 입력해주세요 (ex-5월말부터 가능 or 6월중순부터 6개월간 가능 등)" aria-label="Username" aria-describedby="basic-addon11">
                      </div><br>
                      
                      <label ><b>연락 수단</b></label>
                      <div class="input-group">
                       <!--  <span class="input-group-text" id="basic-addon11">@</span> -->
                        <input type="text" class="form-control" placeholder="핸드폰번호나 이메일, 오픈카톡방 링크 등 연락받기를 원하는 방법을 입력해주세요." aria-label="Username" aria-describedby="basic-addon11">
                      </div><br>
					
                    
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
                       </div><br>
                       
                       
                       
                       
        <!-- quill 들어갈 자리 -->
              <label ><b>자기소개</b></label>
          <div class="container-xxl flex-grow-1 container-p-y cpadding" style="margin-right: 70px; padding: 0px; box-shadow: 0; border: 0px; margin-top: 0px;">
      	  

          <textarea name="newsContent" id="newsContent"></textarea>

          <input type="hidden" name="userNo" value="${loginUser.userNo}">
          <input type="hidden" name="newsContent" id="newsContent">
          <input type="hidden" name="thumbnail" id="thumbnail">
       
      	</div>
      	</div>
     
		
    </div>
          <div class="btns"  align="right">

              <button type="submit" class="btn btn-outline-secondary">수정하기</button>
              <button type="submit" class="btn btn-outline-danger">삭제하기</button>

              <button type="submit" class="btn btn-outline-primary" onclick="return confirm();">제출하기</button>

          </div>
    
     <div id="buttonDiv" style="width:50%; height:200px; margin: auto; text-align: center; margin-top: 80px">
      	<button type="button" class="btn btn-outline-primary" style="font-size: 20px"><b>등록하기</b></button> &nbsp;
		<button type="button" class="btn btn-outline-secondary" style="font-size: 20px"><b>취소</b></button>
      </div>
      
    </div>
    </div>
    </div>
    
	</form>
	
                      
  
                      
                      
                      
                      
                   
                 
               
                
                
  
	 
    
    
	



	




<script src="./././resources/js/multi-input.js"></script>
  <script src="./././resources/js/script.js"></script>

</body>
</html>