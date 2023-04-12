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
	height:100%;
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
	float:right;
	margin-right:10px;
}



.editor-label {
  flex: 1 1 32%;
  padding: 20px 20px;
   background-color: white;
   border-radius: 0.375rem;
}

 
/* 셀렉트 박스 css */

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

.wrapper {
    width: 360px;
    margin: 20px auto 0;
}

.select,
.options li {
    display: flex;
    cursor: pointer;
    align-items: center;
}

.select {
    height: 60px;
    padding: 0 20px;
    background: #4285f4;
    border-radius: 10px;
    color: #ffffff;
    justify-content: space-between;
}

.content {
    display: none;
    background: #ffffff;
    margin-top: 5px;
    padding: 15px;
    border-radius: 10px;
      height: 300px;
}

.active .content {
    display: block;
   
}

.content .search-box {
    position: relative;
}

.search-box .material-icons {
    left: 15px;
    line-height: 53px;
    position: absolute;
}

.search-box input {
    height: 53px;
    width: 100%;
    outline: none;
    font-size: 17px;
    padding: 0 10px 0 43px;
    border: 1px solid #aabb;
    border-radius: 10px;
}

.content .options {
    margin-top: 10px;
    max-height: 250px;
    overflow-y: auto;
}

.options::-webkit-scrollbar-track {
    background-color: #f1f1f1;
    border-radius: 25px;
}

.options::-webkit-scrollbar-thumb {
    background-color: #ccc;
    border-radius: 25px;
}

.options li {
    height: 50px;
    padding: 0 13px;
    border-radius: 7px;
}

.options li:hover {
    background: #f2f2f2;
}


/* 만든거 css*/




</style>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/bootstrap-select.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/js/i18n/defaults-*.min.js"></script>

<link rel="stylesheet" href="../../../resources/css/issue_select.css">
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css">
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script src="../../../resources/js/issue_mini.js"></script>
</head>
<body>

	<jsp:include page="../common/template.jsp"/>




<div class="container input-top" style="margin-left: 0px; margin-right: 0px; height:70px;">
  <div class="input-group mb-3" style="width: calc(100% - 5px);  display: flex;">
    <span class="input-group-text" id="inputGroup-sizing-default" style="width: 100px;">이슈 제목</span>
    <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default" style="flex: 1;"
    	name="issueTitle" id="title" required>
  </div>
</div>


 <div class="container total-box" style="margin-left: 0px; margin-right: 0px;">
  
	<div class = "why">
  	<div class="editor-wrapper">
	    <div id="editor">
	    </div>
	    <div class="btn-box">
	    <br>
	    <button type="submit" class="btn btn-outline-primary">등록</button>
	    </div>
  	</div>
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
      
      
      // 나라검색 ----------
      
      const wrapper = document.querySelector('.wrapper');
      const select = document.querySelector('.select');
      const options = document.querySelector('.options');
      const input = document.querySelector('.filter');//input element 

      let countries =
          ["가나", "가봉", "감비아", "과테말라", "그레나다", "그리스", "기니", "네덜란드", "대한민국"];

      select.addEventListener('click', function () {
          let c = wrapper.className;
          wrapper.classList.toggle('active');
      });

      input.addEventListener('keyup', function () {//input에 글자를 적을 때마다 event발생.
          let arr = [];//사용자가 적은 값과 일치하는 국가명을 집어넣을 새로운 배열.
          let searchWord = input.value;//사용자 입력값

          if (searchWord.length > 0) {//사용자 입력값이 존재하는 경우

              arr = countries.filter(data => { //filter메서드를 사용해서 arr로 보내는데 
                  return data.startsWith(searchWord);
              }).map(data => `<li onclick="changeClickedName(this)">${data}</li>`).join("");
              //map을 사용해서 데이터를 <li>태그로 감싼 것처럼 처리함.
              //join함수를 사용해서 새배열(arr)에서 출력되는','를 없앰
              options.innerHTML = arr ? arr : '<p>조회된 나라가 없습니다.</p>';
              //조회되는 아이템이 없는 경우 보여주는 글귀 설정.
          } else {
              //사용자 입력값이 존재하지않는 경우
              options.innerHTML = "";//조회아이템이 없는 경우 보여주는 태그 비워주고
              addLi();//모든 국가명 보여주기
          }


      });//input keyup event.

      addLi();

      function addLi() {
    	  options.innerHTML = ""; // 기존 옵션들을 모두 제거
    	  countries.forEach(country => {
    	    let li = `<li onclick="changeClickedName(this)">${country}</li>`;
    	    options.insertAdjacentHTML("beforeend", li);
    	  });
    	}


      function changeClickedName(li) {//옵션(국가명) 선택시
          input.value = "";//input 초기화.
          addLi();//모든 국가명 보여주기
          wrapper.classList.remove('active');//classList사용해서 active 클래스명 삭제. 
          select.firstElementChild.innerText = li.innerText;//선택된 옵션 값이 선택영역에 적용되도록 함
      }
      
      
      

      
  </script>

</body>
</html>
