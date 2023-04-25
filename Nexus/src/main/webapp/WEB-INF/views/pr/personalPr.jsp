<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/logo3.png" />
</head>
<style>
#mainBody{
	height: 1500px; 
	width: 100%;
	margin:auto;
	margin-top: 10px !important;
	margin-bottom: 0px !important;
}
#stacks{
	width:100%;
	margin:auto;
	padding-top:25px;
	padding-bottom:50px;
	padding-left:20px;
	padding-right:20px;
}
#prs{
	width:100%;
	height:2.5%;
	margin:auto;
	padding-top:10px;
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


/*       Just setting CSS for the page   */

* {
  margin: 0;
  padding: 0;
}

html,
css {
  width: 100%;
  height: 100%;
}

.position {
  margin-left: auto;
  margin-right: auto;
  text-align: center;
  margin-top: 15%;
}

#workarea {
  position: absolute;
  width: 100%;
  height: 100%;
  background-color: #1e1a3e;
  font-family: Raleway;
}

#personal {
  color:white;
  text-decoration:none;
  position:absolute;
  bottom:15px;
  right:2%;
}
/*    start code for the actual button:         */


/*   
    Spot is the span on the inside of the href that
    fills the parent and makes the hover and link work
    for the entire div
*/

.spot {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
}
/*
    This is the outer svg wrapper that the SVG itself will 
    fill. Multiple svg-wrapper classes can be put side by side.
*/

.svg-wrapper {
  margin-top: 0;
  position: relative;
  width: 150px;
  /*make sure to use same height/width as in the html*/
  height: 40px;
  display: inline-block;
  border-radius: 3px;
  margin-left: 5px;
  margin-right: 5px
}
/*
  This is where we define the fill, color, thickness,
  and stroke pattern of the SVG when there is no hover.
  The dasharray and offset together define the line position
  under the words. Here's also where the transition speed is set.
*/

#shape {
  stroke-width: 6px;
  fill: transparent;
  stroke: #009FFD;
  stroke-dasharray: 85 400;
  stroke-dashoffset: -220;
  transition: 1s all ease;
}
/* 
    Pushing the text up into the SVG. Without this the
    text would be below the div's.
*/

#text {
  margin-top: -35px;
  text-align: center;
}

#text a {
  color: white;
  text-decoration: none;
  font-weight: 100;
  font-size: 1.1em;
}
/* 
    Changing the shape on hover. I change the color of the stroke,
make it thinner, then set it to again wrap around the entire parent element.
*/

.svg-wrapper:hover #shape {
  stroke-dasharray: 50 0;
  stroke-width: 3px;
  stroke-dashoffset: 0;
  stroke: #06D6A0;
}

#stacks>button{
	margin-right:20px;
	margin-bottom:3px;
	border:none;
	background-color: #f5f5f9;;
	color: lightgray;
	font-size:25px;
	font-weight: 900;
	box-sizing:border-box;
}
#stacks>button:hover{
  font-size:25px;
  font-weight: bolder;
  color: #706482;
}
hr{
	margin-top:0px;
	margin-bottom:0px;
}
.card{
	margin: 10px;
	float: left;
}
#prList{
	width: 100%;
	height: 1500px !important;
}
.card{
	width: 264px;
	/* height: 229.984px; */
	height: 280px;
}
.card-body{
	display: block;
	padding-top: 15px !important;
	padding-right:10px !important;
	padding-bottom:25px !important;
	height: 241px;
}
.card-text{
	width: 216px;
	/* height: 103px; */
	overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box; 
  -webkit-line-clamp: 5;
  -webkit-box-orient: vertical;
  margin-bottom: 35px !important;
	
}
.card-title{
	width: 216px;
	/* height: 19.797px; */
	/* height:40px; */
	 overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box; 
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
}
#card-id{
	margin-bottom: 15px !important;
}
 .card-body:hover{
	cursor: pointer;
	box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
} 
/* .card-title:hover{
	cursor: pointer;
	box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
} 
.card-text:hover{
	cursor: pointer;
	box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
} 
.bx:hover{
	cursor: pointer;
	box-shadow: 0 0.125rem 0.25rem 0 rgba(105, 108, 255, 0.4);
} 
 */

.bx-bookmark::before{
	width: 30px;
	height: 30px;
}
.bx{
	font-size: 1.8rem !important;
}
#prs{
	width: 83%; 
	height: 50px;
	margin-bottom: 0px;
	padding-top: 3px;
}
#newBtn{
	float: right;
}
.pagination{
	width: 100%;
	text-align: center;
}
</style>
<body>
<jsp:include page="../common/template.jsp"/>

<div id="mainBody" style="width: 100%;">



<!-- <div id="stacks">
<div class="col-xl-6" style="width: 100% !important; margin: auto;" >
                  <h6 class="text-muted"></h6>
                  <div class="nav-align-top mb-4" >
                    <ul class="nav nav-tabs nav-fill" role="tablist" style="margin-bottom: 0;" >
                      <li class="nav-item" style="margin: 0;">
                        <button type="button" class="nav-link active" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-home" aria-controls="navs-justified-home" aria-selected="true">
                          <i class="tf-icons bx bx-home"></i>  &nbsp; <b style="font-size: 17px;">모두보기</b>
                          <span class="badge rounded-pill badge-center h-px-20 w-px-20 bg-label-danger"></span>
                        </button>
                      </li>
                      <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-profile" aria-controls="navs-justified-profile" aria-selected="false">
                          <i class='bx bx-desktop'></i> &nbsp; 프론트엔드
                        </button>
                      </li>
                      <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-messages" aria-controls="navs-justified-messages" aria-selected="false">
                          <i class='bx bxs-server'></i>  &nbsp; 백엔드
                        </button>
                      </li>
                        <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-mobile" aria-controls="navs-justified-messages" aria-selected="false">
                         <i class='bx bx-mobile-alt' ></i>  &nbsp; 모바일
                        </button>
                      </li>
                        <li class="nav-item">
                        <button type="button" class="nav-link" role="tab" data-bs-toggle="tab" data-bs-target="#navs-justified-etc" aria-controls="navs-justified-messages" aria-selected="false">
                          <i class='bx bxs-guitar-amp'></i>  &nbsp; 기타
                        </button>
                      </li>
                      
                    </ul>
                    <div class="tab-content" style="height: 350px;">
                      <div class="tab-pane fade active show" id="navs-justified-home" role="tabpanel">
                        <section class="desktopFilter_filterWrapper__1gwsT" style="box-sizing: border-box;">
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
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/kotlin.svg" alt="Kotlin"><span>Kotlin</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/express.svg" alt="Express"><span>Express</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/mysql.svg" alt="MySQL"><span>MySQL</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/mongodb.svg" alt="MongoDB"><span>MongoDB</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/python.svg" alt="Python"><span>Python</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/django.svg" alt="Django"><span>Django</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/php.svg" alt="php"><span>php</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/graphql.svg" alt="GraphQL"><span>GraphQL</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/firebase.svg" alt="Firebase"><span>Firebase</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/flutter.svg" alt="Flutter"><span>Flutter</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/swift.svg" alt="Swift"><span>Swift</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/reactnative.svg" alt="ReactNative"><span>ReactNative</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/unity.svg" alt="Unity"><span>Unity</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/aws.svg" alt="AWS"><span>AWS</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/kubernetes.svg" alt="Kubernetes"><span>Kubernetes</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/docker.svg" alt="Docker"><span>Docker</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/git.svg" alt="Git"><span>Git</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/figma.svg" alt="Figma"><span>Figma</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/zeplin.svg" alt="Zeplin"><span>Zeplin</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/jest.svg" alt="Jest"><span>Jest</span></li></ul>
							</ul>
						<div class="SelectedLanguage_selectedWrapper__2StUQ"><ul class="SelectedLanguage_selectedLanguages__DYJjl"></ul></div>
						<div class="search_container__2ExFE"><img class="search_searchImg__2ia6h" src="" alt="sub logo"></div>
						</section>
                      </div>
                      <div class="tab-pane fade" id="navs-justified-profile" role="tabpanel">
                      		 <section class="desktopFilter_filterWrapper__1gwsT">
							<ul class="LanguageBar_languages__2Ilqf">
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet">
							<img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/javascript.svg" alt="JavaScript"><span>JavaScript</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/typescript.svg" alt="TypeScript"><span>TypeScript</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/react.svg" alt="React"><span>React</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/vue.svg" alt="Vue"><span>Vue</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/svelte.svg" alt="Svelte"><span>Svelte</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nextjs.svg" alt="Nextjs"><span>Nextjs</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nodejs.svg" alt="Nodejs"><span>Nodejs</span></li>
							</ul>
						<div class="SelectedLanguage_selectedWrapper__2StUQ"><ul class="SelectedLanguage_selectedLanguages__DYJjl"></ul></div>
						<div class="search_container__2ExFE"><img class="search_searchImg__2ia6h" src="" alt="sub logo"></div>
						</section>
                      </div>
                      <div class="tab-pane fade" id="navs-justified-messages" role="tabpanel">
                         <section class="desktopFilter_filterWrapper__1gwsT" style="box-sizing: border-box;">
							<ul class="LanguageBar_languages__2Ilqf">
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/firebase.svg" alt="Firebase"><span>Firebase</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nestjs.svg" alt="Nestjs"><span>Nestjs</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/kotlin.svg" alt="Kotlin"><span>Kotlin</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/php.svg" alt="php"><span>php</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/django.svg" alt="Django"><span>Django</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/graphql.svg" alt="GraphQL"><span>GraphQL</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nextjs.svg" alt="Nextjs"><span>Nextjs</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nodejs.svg" alt="Nodejs"><span>Nodejs</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/java.svg" alt="Java"><span>Java</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/spring.svg" alt="Spring"><span>Spring</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/go.svg" alt="Go"><span>Go</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/express.svg" alt="Express"><span>Express</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/mysql.svg" alt="MySQL"><span>MySQL</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/mongodb.svg" alt="MongoDB"><span>MongoDB</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/python.svg" alt="Python"><span>Python</span></li>
							</ul>
						<div class="SelectedLanguage_selectedWrapper__2StUQ"><ul class="SelectedLanguage_selectedLanguages__DYJjl"></ul></div>
						<div class="search_container__2ExFE"><img class="search_searchImg__2ia6h" src="" alt="sub logo"></div>
						</section>
                      </div>
                      <div class="tab-pane fade" id="navs-justified-mobile" role="tabpanel">
                      		<section class="desktopFilter_filterWrapper__1gwsT" style="box-sizing: border-box;">
							<ul class="LanguageBar_languages__2Ilqf">
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet">
							<img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/javascript.svg" alt="JavaScript"><span>JavaScript</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/kotlin.svg" alt="Kotlin"><span>Kotlin</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/flutter.svg" alt="Flutter"><span>Flutter</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/swift.svg" alt="Swift"><span>Swift</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/reactnative.svg" alt="ReactNative"><span>ReactNative</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/unity.svg" alt="Unity"><span>Unity</span></li>
							</ul>
						<div class="SelectedLanguage_selectedWrapper__2StUQ"><ul class="SelectedLanguage_selectedLanguages__DYJjl"></ul></div>
						<div class="search_container__2ExFE"><img class="search_searchImg__2ia6h" src="" alt="sub logo"></div>
						</section>
                      </div>
                      <div class="tab-pane fade" id="navs-justified-etc" role="tabpanel">
                      		<section class="desktopFilter_filterWrapper__1gwsT" style="box-sizing: border-box;">
							<ul class="LanguageBar_languages__2Ilqf">
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/aws.svg" alt="AWS"><span>AWS</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/kubernetes.svg" alt="Kubernetes"><span>Kubernetes</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/docker.svg" alt="Docker"><span>Docker</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/git.svg" alt="Git"><span>Git</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/figma.svg" alt="Figma"><span>Figma</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/zeplin.svg" alt="Zeplin"><span>Zeplin</span></li>
							<li class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/jest.svg" alt="Jest"><span>Jest</span></li></ul>
							</ul>
						<div class="SelectedLanguage_selectedWrapper__2StUQ"><ul class="SelectedLanguage_selectedLanguages__DYJjl"></ul></div>
						<div class="search_container__2ExFE"><img class="search_searchImg__2ia6h" src="" alt="sub logo"></div>
						</section>
                      </div>
                    </div>
                  </div>
                </div>
</div> -->




<div id="prs" >
	<button type="button" class="btn btn-outline-primary" id="newBtn" onclick="location.href='enrollPsnPr.pr'">
	새 글 쓰기
</button>
</div>

<div id="shell" style="margin-left: 50px; display: block; height: 1200px; width: 100%;">


<c:forEach var="p" items="${personalPrList }">
	 <div class="card" style="width: 16.5rem;">
	  <div class="card-body" style="padding-left: 10px;" >
	    <p class="card-category" style="float:left; width: 50%;">${p.createDate }</p>
	    <p class="card-category" style="float: right;">${p.category }</p>
	    <h5 class="card-title" style="margin-right: 0px; width: 235px; height: 39.794px;"><b>${p.psnPrTitle }</b></h5>
	    <p class="card-text" style="float: left; font-size: 13px; width: 240px; height: 99.375px;">${p.psnPrContent }</p>
	    <!-- <p>아이디 들어갈자리</p> -->
	    <span style="margin-bottom: 5px;"><%-- ${p.userNo } --%>아이디 들어갈 자리</span>
	    <i class='bx bx-bookmark' style="float: right; "></i>
	  </div>
</div>
</c:forEach>




</div>


	
</div>

</div> <!-- main body div -->


<!-- <script>
		var seeAll = document.getElementById( "seeAll" );
		var seeFront1 = document.getElementById("seeFront");
		var seeBack = document.getElementById("seeBack");
		var seeMobile = document.getElementById("seeMobile");
		var seeEtc = document.getElementById("seeEtc");
		seeAll.style.color = "#706482";
		seeAll.style.fontSize = "28px";
		

	
	function seeFront(){
        seeFront1.style.color = "#706482";
        seeFront1.style.fontSize = "28px";
       	seeAll.style.color="lightgray";  
        seeAll.style.fontSize="25px";
    }
 
</script> -->





</body>
</html>