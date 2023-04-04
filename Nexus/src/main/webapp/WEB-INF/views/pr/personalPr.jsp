<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/logo3.png" />
</head>
<style>
#mainBody{
	height: 2500px;
	width: 85%;
	border:1px solid black;
	margin:auto;
}
#stacks{
	width:89%;
	height:20%;
	border:1px solid black;
	margin:auto;
	padding-top:25px;
	padding-bottom:50px;
	padding-left:20px;
	padding-right:20px;
}
#prs{
	width:89%;
	height:80%;
	border:1px solid black;
	margin:auto;
	padding-top:50px;
}
#stackCategory>li{
	display:flex;
	float:left;
}

.Category_categoryItem__1ko8V {
    display: flex;
    font-weight: 700;
    font-size: 26px;
    line-height: 126.5%;
    color: #848484;
    cursor: pointer;
    position: relative;
}

.Category_categories__3bwPA {
    display: flex;
    grid-gap: 50px;
    gap: 50px;
    border-bottom: 3px solid #f2f2f2;
    padding-bottom: 20px;
    padding-left: 16px;
    margin-bottom: 30px
}

.Category_categoryItem__1ko8V {
    display: flex;
    font-weight: 700;
    font-size: 26px;
    line-height: 126.5%;
    color: #848484;
    cursor: pointer;
    position: relative
}

.Category_selectedCategory__1J7es {
    color: #333
}

.Category_selectedCategory__1J7es:after {
    content: "";
    position: absolute;
    height: 5px;
    width: calc(100% + 26px);
    background: #ffe579;
    left: -13px;
    bottom: -22px
}

.LanguageBar_languages__2Ilqf {
    display: flex;
    flex-wrap: wrap;
    width: 100%;
    grid-gap: 15px;
    gap: 15px;
    margin-bottom: 40px
}

.LanguageBar_languageIcon__Um7GQ {
    display: flex;
    grid-gap: 10px;
    gap: 10px;
    align-items: center;
    border: 1px solid #d0d0d0;
    border-radius: 100px;
    padding: 12px 20px 12px 15px;
    transition: all .1s ease-in;
    cursor: pointer
}

.LanguageBar_logo__332tN {
    width: 36px;
    height: 36px
}

.LanguageBar_languageIcon__Um7GQ:hover {
    -webkit-transform: scale(1.05);
    transform: scale(1.05)
}

.LanguageBar_full__3qQet {
    opacity: 1;
    -webkit-transform: scale(1.02);
    transform: scale(1.02)
}

.LanguageBar_transparent__3wlZf {
    opacity: .3
}

.SelectedLanguage_selectedLanguages__DYJjl,.SelectedLanguage_selectedWrapper__2StUQ {
    display: flex;
    flex-wrap: wrap;
    align-items: center;
    grid-gap: 30px;
    gap: 30px
}

.SelectedLanguage_selectedLanguage__3AUIy {
    display: flex;
    grid-gap: 10px;
    gap: 10px;
    background: #f2f2f2;
    padding: 8px 15px;
    height: 41px;
    border-radius: 10px;
    font-weight: 500;
    font-size: 20px;
    color: #313131;
    justify-content: center;
    align-items: center;
    cursor: pointer;
    transition: all .1s ease-in
}

.SelectedLanguage_selectedLanguage__3AUIy:hover {
    -webkit-transform: scale(1.02);
    transform: scale(1.02)
}

.SelectedLanguage_resetFilter__2EZuH {
    font-size: 20px;
    color: #333;
    cursor: pointer
}
.LanguageBar_languages__2Ilqf{
	padding-left:0;
}


</style>
<body>
<jsp:include page="../common/template.jsp"/>

<h1>우효-----------------------------------------------------------------------------------------------------------------------</h1>
<div id="mainBody">

<div id="stacks">



<section class="desktopFilter_filterWrapper__1gwsT">
<ul class="Category_categories__3bwPA">
<li class="Category_categoryItem__1ko8V Category_selectedCategory__1J7es">인기</li>
<li class="Category_categoryItem__1ko8V ">프론트엔드</li>
<li class="Category_categoryItem__1ko8V ">백엔드</li>
<li class="Category_categoryItem__1ko8V ">모바일</li>
<li class="Category_categoryItem__1ko8V ">기타</li>
<li class="Category_categoryItem__1ko8V ">모두보기</li>
</ul>
<ul class="LanguageBar_languages__2Ilqf">
<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet">
<img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/javascript.svg" alt="JavaScript"><span>JavaScript</span></li>
<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/typescript.svg" alt="TypeScript"><span>TypeScript</span></li>
<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/react.svg" alt="React"><span>React</span></li>
<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/vue.svg" alt="Vue"><span>Vue</span></li>
<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/svelte.svg" alt="Svelte"><span>Svelte</span></li>
<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nextjs.svg" alt="Nextjs"><span>Nextjs</span></li>
<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nodejs.svg" alt="Nodejs"><span>Nodejs</span></li>
<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/java.svg" alt="Java"><span>Java</span></li>
<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/spring.svg" alt="Spring"><span>Spring</span></li>
<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/go.svg" alt="Go"><span>Go</span></li>
<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nestjs.svg" alt="Nestjs"><span>Nestjs</span></li>
</ul>
<div class="SelectedLanguage_selectedWrapper__2StUQ"><ul class="SelectedLanguage_selectedLanguages__DYJjl"></ul></div>
<div class="search_container__2ExFE"><img class="search_searchImg__2ia6h" src="" alt="sub logo"></div>
</section>

</ul>

</div>

<div id="prs">

</div>








</div>





</body>
</html>