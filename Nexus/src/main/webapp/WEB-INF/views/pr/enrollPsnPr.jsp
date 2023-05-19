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
 


<script src="${pageContext.request.contextPath}/resources/js/personalPrBoard.js"></script>


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
	width: 40rem;;
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
 multi-input input::-webkit-calendar-picker-indicator {
      display: inline;
    }
    /* NB use of pointer-events to only allow events from the × icon */
    multi-input div.item::after {
      color: black;
      content: '×';
      cursor: pointer;
      font-size: 18px;
      pointer-events: auto;
      position: absolute;
      right: 5px;
      top: -1px;
      float: right;
    }
    .note-modal-content{
    	height: 400px;
    }
</style>
</head>
<body>

	<script>
		
	
		// active 클래스 를 repository로 옮기기
		$(".active").removeClass("active");
		$("#pr123").addClass("active");
		// $("#total1").addClass("active");
	
	
	
	 </script>

<div class="container-xxl flex-grow-1"> 
<form action="insertPersonalPr" method="post" style="height: 100%;">
<div id="body" style="margin: 0px; margin-top: 30px; width: 100%">
		<div class="col-md-6" style="width:150rem; height:100%;  max-width: 100%; margin: auto;">
                  <div class="card mb-4" style="width: 100%; margin: auto;">
                    <h4 class="card-header"  ><b>정보 입력</b></h4>
                    <div class="card-body demo-vertical-spacing demo-only-element" style="height: 1500px; overflow: auto; "><br>
                    
                    <label><b>제목</b></label>
                      <div class="input-group" >
                       <!--  <span class="input-group-text" id="basic-addon11">@</span> -->
                        <input type="text" class="form-control" id="psnPrTitle" name="psnPrTitle" placeholder="제목을 입력해주세요" aria-label="Username" aria-describedby="basic-addon11" required>
                      </div> <br>
                      
                      <script type="text/javascript">
                      	$(document).ready(function() {
                    	    $('#psnPrTitle').focus();
                    	});
                      </script>
                      
                       <label ><b>프로젝트 참여 가능기간</b></label>
                      <div class="input-group" >
                       <!--  <span class="input-group-text" id="basic-addon11">@</span> -->
                        <input  style="margin-top:0px;" type="text" class="form-control" name="psnPrAvlPrd" placeholder="프로젝트 참여 가능기간을 입력해주세요 (ex-5월말부터 가능 or 6월중순부터 6개월간 가능 등)" aria-label="Username" aria-describedby="basic-addon11" required>
                      </div><br>
                      
                      <label ><b>연락 수단</b></label>
                      <div class="input-group">
                       <!--  <span class="input-group-text" id="basic-addon11">@</span> -->
                        <input type="text" class="form-control" name="psnPrContact" placeholder="핸드폰번호나 이메일, 오픈카톡방 링크 등 연락받기를 원하는 방법을 입력해주세요. Nexus채팅으로 연락받기를 원하시면 유저코드 혹은 닉네임을 입력해주세요." aria-label="Username" aria-describedby="basic-addon11" required>
                      </div><br>
                      
                     
                     <label ><b>희망 분야</b></label> <br>
					<select name="category" style="background-color: transparent;  color: #a4aab1; border-color: #d9dee3; width: 310px; height: 50px; box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4); border-radius: 6px; text-align: center;">
						<option value="" selected="selected" style="display: none;">희망하는 분야를 선택해주세요</option>
						<option value="FRONT-END">FRONT-END</option>
						<option value="BACK-END">BACK-END</option>
						<option value="FULL-STACK">FULL-STACK</option>
						<option value="MOBILE">MOBILE</option>
						<option value="ETC">ETC</option>
					</select><br><br>
					
					
                     
					
                    
                   <label ><b>기술 스택</b></label>  
 					
                   <div class="input-group" style="border: none; box-shadow: none;" onchange="dataListChange()">
                   <multi-input id="multi-input">
			      <input id="stackInputCard" list="speakers"  placeholder="사용가능한 자신의 기술 스택을 선택해주세요. 검색도 가능합니다."/>
			      <datalist id="speakers">
			        <option value="AWS" class="item"></option>
			        <option value="Django" class="item"></option>
			        <option value="Docker" class="item"></option>
			        <option value="Express" class="item"></option>
			        <option value="Figma" class="item"></option>
			        <option value="Firebase" class="item"></option>
			        <option value="Flutter" class="item"></option>
			        <option value="Git" class="item"></option>
			        <option value="Go" class="item"></option>
			        <option value="GraphQL" class="item"></option>
			        <option value="Java" class="item"></option>
			        <option value="JavaScript" class="item"></option>
			        <option value="Kotlin" class="item"></option>
			        <option value="Kubernetes" class="item"></option>
			        <option value="MongoDB" class="item"></option>
			        <option value="MySQL" class="item"></option>
			        <option value="Nestjs" class="item"></option>
			        <option value="Nextjs" class="item"></option>
			        <option value="NodeJs" class="item"></option>
			        <option value="php"class="item"></option>
			        <option value="Python" class="item"></option>
			        <option value="TypeScript" class="item"></option>
			        <option value="React" class="item"></option>
			        <option value="ReactNative" class="item"></option>
			        <option value="Spring" class="item"></option>
			        <option value="Svelte" class="item"></option>
			        <option value="Swift" class="item"></option>
			        <option value="Unity" class="item"></option>
			        <option value="Vue" class="item"></option>
			        <option value="Zeplin" class="item"></option>
			        <option value="Jest" class="item"></option>
			      </datalist>
			    </multi-input>
                       </div>
                       <input  id="selecteds" name="psnPrStack" type="hidden"> <br>
                       <script src="${pageContext.request.contextPath}/resources/js/multi-input.js"></script>
        				
         <script type="text/javascript">
         const multiInput= document.getElementById('multi-input'); 
         var selecteds = document.getElementById('selecteds'); 

        function dataListChange(){
          	console.log(multiInput.getValues());
           document.getElementById('selecteds').value =multiInput.getValues();
        }
        </script> 
        
        <label style="float: left;" ><b>자기소개</b></label><br><br>
        <!-- summerNote 들어갈 자리 -->
        
        <div class="container" style="padding-left: 0px; float: left;">
  		<textarea class="summernote" id="summernote" name="editordata"></textarea>    
		</div>
		
		 <input type="hidden" name="userNo" value="${loginUser.userNo}">
		
		<script>
		$('.summernote').summernote({
			  height: 600,
			  lang: "ko-KR"
			});
		</script>
  
      
      	</div>
    
     <div id="buttonDiv" style="width:50%; height:200px; margin: auto; text-align: center;">
      	<button type="submit" id="enrollPsnPr" class="btn btn-outline-primary"  style="font-size: 20px" onclick="returnFunction()"><b>등록하기</b></button> &nbsp;   <!-- 버튼 클래스  class="btn btn-outline-primary"   -->
		<button type="reset" class="btn btn-outline-secondary" style="font-size: 20px"><b>취소</b></button>
      </div>
        		
      
     
      
    </div>
    
     
    </div>
    </div>
	</form>
	
</body>
</html>