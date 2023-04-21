<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/logo3.png" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/template.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/personalPr.css">

<!-- ajax -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- jQuery 라이브러리 -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 





<!-- summernote -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/summernote-ko-KR.js"></script>

        

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
.note-editor>button{
	border-color: gray !important;
	width: 200px;
}
.dropdown-item{
	text-align: center;
	color: #697a8d;
}
.dropdown-toggle::after{
	border-color:#d9dee3 !important;
}
select {
    /* appearance:none;
    background:url('../img/icon_select_arrow.png') no-repeat right 1px center; */
}
</style>
</head>
<body>


<form action="insertPersonalPr" method="post" style="height: 100%;">
<div id="body" style="margin: 0px; margin-top: 30px;">
		<div class="col-md-6" style="width:97%; height:100%;  max-width: 100%; margin: auto; margin-left: 103px;">
                  <div class="card mb-4" style="width: 100%; margin: auto;">
                    <h4 class="card-header"  ><b>정보 입력</b></h4>
                    <div class="card-body demo-vertical-spacing demo-only-element" style="height: 1800px;"><br>
                    
                    <label><b>제목</b></label>
                      <div class="input-group" >
                       <!--  <span class="input-group-text" id="basic-addon11">@</span> -->
                        <input type="text" class="form-control" placeholder="제목을 입력해주세요" aria-label="Username" aria-describedby="basic-addon11" required>
                      </div> <br>
                      
                       <label ><b>프로젝트 참여 가능기간</b></label>
                      <div class="input-group" >
                       <!--  <span class="input-group-text" id="basic-addon11">@</span> -->
                        <input  style="margin-top:0px;" type="text" class="form-control" placeholder="프로젝트 참여 가능기간을 입력해주세요 (ex-5월말부터 가능 or 6월중순부터 6개월간 가능 등)" aria-label="Username" aria-describedby="basic-addon11" required>
                      </div><br>
                      
                      <label ><b>연락 수단</b></label>
                      <div class="input-group">
                       <!--  <span class="input-group-text" id="basic-addon11">@</span> -->
                        <input type="text" class="form-control" placeholder="핸드폰번호나 이메일, 오픈카톡방 링크 등 연락받기를 원하는 방법을 입력해주세요." aria-label="Username" aria-describedby="basic-addon11" required>
                      </div><br>
                      
                     
                     <label ><b>희망 분야</b></label> <br>
					<select style="background-color: transparent; color: #a4aab1; border-color: #d9dee3; width: 310px; height: 50px; box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4); border-radius: 6px; text-align: center;">
						<option value="" selected="selected" style="display: none;">희망하는 분야를 선택해주세요</option>
						<option value="FRONT-END">FRONT-END</option>
						<option value="BACK-END">BACK-END</option>
						<option value="FULL-STACK">FULL-STACK</option>
						<option value="MOBILE">MOBILE</option>
						<option value="ETC">ETC</option>
						<option value="선택안함">선택안함</option>
					</select><br><br>
					
					
                     
					
                    
                   <label ><b>기술 스택</b></label>  
 					
                   <div class="input-group" style="border: none; box-shadow: none;">
                   <multi-input>
			      <input id="stackInputCard" list="speakers" placeholder="사용가능한 자신의 기술 스택을 선택해주세요. 검색도 가능합니다."/>
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
                       <button id="get1" type="button">Get</button>
                       </div>
                       <p id="values" "></p>
                       <script src="${pageContext.request.contextPath}/resources/js/multi-input.js"></script>
						
                       
        <!-- summerNote 들어갈 자리 -->
              <label ><b>자기소개</b></label>
         <%--  <div class="container-xxl flex-grow-1 container-p-y cpadding" style="margin-right: 70px; padding: 0px; box-shadow: 0; border: 0px; margin-top: 0px !important; padding-top: 20px !important; ">
      	  

          <textarea name="newsContent" id="newsContent"></textarea>
          
          <c:if test="${ !empty news }">
          	<script>
          		
              let text = `${news.newsContent}`;
              $("#newsContent").summernote('code',text)
          	</script>
            <input type="hidden" name="newsNo", value="${news.newsNo }">
          </c:if>

          <input type="hidden" name="userNo" value="${loginUser.userNo}">
          <input type="hidden" name="personalPrContent" id="personalPrContent" required>
          <input type="hidden" name="thumbnail" id="thumbnail">
       
      	</div> --%>
      	<textarea id="prContent" name="prContent" ></textarea>
      	
      	
      	<script type="text/javascript">
      	$(document).ready(function() {
      	  $('#prContent').summernote();
      	});
      	</script>
      	 <input type="hidden" name="prNo", value="${personalPr.prNo }">
      	  <input type="hidden" name="userNo" value="${loginUser.userNo}">
          <input type="hidden" name="prContent" id="prContent">
          <input type="hidden" name="thumbnail" id="thumbnail">
      	
      	</div>
      	
      	<c:if test="${personalPr.prContent != null}">
      <script>
        let string = '${personalPr.prContent}';
        $("#"prContent").summernote('pasteHTML',string);
      </script>
    </c:if>
     
		
    </div>
    
        <script src="${pageContext.request.contextPath}/resources/js/script1.js"></script>
    
     <div id="buttonDiv" style="width:50%; height:200px; margin: auto; text-align: center; margin-top: 80px">
      	<button type="submit" id="submitButton" class="btn btn-outline-primary" style="font-size: 20px" onclick="return confirm();"><b>등록하기</b></button> &nbsp;
		<button type="submit" class="btn btn-outline-secondary" style="font-size: 20px"><b>취소</b></button>
      </div>
      
    </div>
    </div>
    </div>
    
    <!-- <script>
    const getButton = document.getElementById('get');
    const multiInput = document.querySelector('multi-input'); 
    const values = document.querySelector('#values'); 

    getButton.onclick = () => {
      if (multiInput.getValues().length > 0) {
        values.textContent = `${multiInput.getValues().join(',')}`;
      } else {
        values.textContent = 'Got noo12ne  :`^(.'; 
      }
    }

    document.querySelector('input').focus();
    
    </script> -->
    
	</form>
	
                      
  
                      
                      
                      
                      
                   
                 
               
                
                
  
	 
    
    
	



	






</body>
</html>