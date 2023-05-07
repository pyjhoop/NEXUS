<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Nexus!</title>
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/logo3.png" />
</head>
<style>
#mainBody{
	height: auto; 
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
	/* margin:auto; */
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
	margin-bottom: 0.8rem;
	float: right;
	margin-right: 1.5rem;
}
#newBtn{
	float: right;
	margin-right: 0rem !important;
}
.pagination{
	width: 100%;
	text-align: center;
}
.card-category{
	font-size: 12px;
}
.mt-5{
	ma
}
.LanguageBar_languages__2Ilqf li{
 transition: all 0.2s ease-in-out;
}
.LanguageBar_languages__2Ilqf li:not(.selected) {
  opacity: 0.5;
}
.LanguageBar_languages__2Ilqf li.selected {
 filter: blur(0);
transform: scale(1.1);
}
	
</style>
<body>
<jsp:include page="../common/template.jsp"/>


<div class="container-xxl flex-grow-1">
	<div id="mainBody" style="width: 100%; margin-right: 5rem;">
	
	<div id="prs" >
	<button type="button" class="btn btn-outline-primary" id="newBtn" onclick="location.href='enrollPsnPr.pr'">
	새 글 쓰기
</button>
</div>
	
	<div id="stacks" style="overflow: auto; padding: 0;">
<div class="col-xl-6" style="width: 100%; max-width: 100%;" >
                  <h6 class="text-muted"></h6>
                  <div class="nav-align-top mb-4" style="width: 100%;">
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
                    <div class="tab-content" style="overflow: auto; width: 100%;">
                      <div class="tab-pane fade active show" id="navs-justified-home" role="tabpanel">
                        <section class="desktopFilter_filterWrapper__1gwsT" style="box-sizing: border-box;">
							<ul class="LanguageBar_languages__2Ilqf">
							<li value="JavaScript" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/javascript.svg" alt="JavaScript"><span>JavaScript</span></li>
							<li value="TypeScript" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/typescript.svg" alt="TypeScript"><span>TypeScript</span></li>
							<li value="React" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/react.svg" alt="React"><span>React</span></li>
							<li value="Vue" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/vue.svg" alt="Vue"><span>Vue</span></li>
							<li value="Svelte" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/svelte.svg" alt="Svelte"><span>Svelte</span></li>
							<li value="Nextjs" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nextjs.svg" alt="Nextjs"><span>Nextjs</span></li>
							<li value="Nodejs" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nodejs.svg" alt="Nodejs"><span>Nodejs</span></li>
							<li value="Java" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/java.svg" alt="Java"><span>Java</span></li>
							<li value="Spring" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/spring.svg" alt="Spring"><span>Spring</span></li>
							<li value="Go" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/go.svg" alt="Go"><span>Go</span></li>
							<li value="Nestjs" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/nestjs.svg" alt="Nestjs"><span>Nestjs</span></li>
							<li value="Kotlin" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/kotlin.svg" alt="Kotlin"><span>Kotlin</span></li>
							<li value="Express" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/express.svg" alt="Express"><span>Express</span></li>
							<li value="MySQL" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/mysql.svg" alt="MySQL"><span>MySQL</span></li>
							<li value="MongoDB" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/mongodb.svg" alt="MongoDB"><span>MongoDB</span></li>
							<li value="Python" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/python.svg" alt="Python"><span>Python</span></li>
							<li value="Django" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/django.svg" alt="Django"><span>Django</span></li>
							<li value="php" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/php.svg" alt="php"><span>php</span></li>
							<li value="GraphQL" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/graphql.svg" alt="GraphQL"><span>GraphQL</span></li>
							<li value="Firebase" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/firebase.svg" alt="Firebase"><span>Firebase</span></li>
							<li value="Flutter" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/flutter.svg" alt="Flutter"><span>Flutter</span></li>
							<li value="Swift" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/swift.svg" alt="Swift"><span>Swift</span></li>
							<li value="ReactNative" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/reactnative.svg" alt="ReactNative"><span>ReactNative</span></li>
							<li value="Unity" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/unity.svg" alt="Unity"><span>Unity</span></li>
							<li value="AWS" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/aws.svg" alt="AWS"><span>AWS</span></li>
							<li value="Kubernetes" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/kubernetes.svg" alt="Kubernetes"><span>Kubernetes</span></li>
							<li value="Docker" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/docker.svg" alt="Docker"><span>Docker</span></li>
							<li value="Git" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/git.svg" alt="Git"><span>Git</span></li>
							<li value="Figma" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/figma.svg" alt="Figma"><span>Figma</span></li>
							<li value="Zeplin" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/zeplin.svg" alt="Zeplin"><span>Zeplin</span></li>
							<li value="Jest" class="LanguageBar_languageIcon__Um7GQ LanguageBar_full__3qQet"><img class="LanguageBar_logo__332tN" src="https://holaworld.io/images/languages/jest.svg" alt="Jest"><span>Jest</span></li></ul>
							</ul>
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
						</section>
                      </div>
                    </div>
                  </div>
                </div>
                
                <script>
                var val1 = "";
                $(document).on("click",".LanguageBar_languages__2Ilqf li", function(){
            		 val1 += $(this).attr('value');
					console.log(val1);
            	});
                
               
                
                const liItems = document.querySelectorAll('.LanguageBar_languages__2Ilqf li');

                liItems.forEach(li => {
                  li.addEventListener('click', () => {
                    if (li.classList.contains('selected')) {
                      li.classList.remove('selected');
                    } else {
                      li.classList.add('selected');
                    }
                  });
                });


                </script>
</div> 









<div id="shell" style="display: block; height: 1200px; width: 100%;">


<c:forEach var="p" items="${personalPrList }">
	 <div class="card" style="width: 15.9rem;">
	  <div class="card-body" style="padding-left: 10px;" >
	    <p class="card-category" style="float:left; width: 50%;">${p.createDate }</p>
	    <p class="card-category" style="float: right;">${p.category }</p>
	    <h5 class="card-title" style="margin-right: 0px; width: 235px; height: 39.794px;"><b>${p.psnPrTitle }</b></h5>
	    <p class="card-text" style="float: left; font-size: 13px; width: 240px; height: 99.375px;">${p.psnPrContent }</p>
	    <img  src="${p.profile}" alt="" style="width: 25px; border-radius: 100%;">
	    <span style="margin-bottom: 5px;">${p.userName}</span>
	    <div id="prCount" style="width: 0px; height: 0px;" hidden="">
	    	${p.psnPrNo }
	    </div>
	    <div style="float: right;">
	    	<i class='bx bx-show' style="margin-bottom: 5px;"></i> <p  style="display: inline-block; font-size: 1.1rem;">${p.count }</p> &nbsp;
	    	
	    <i class='bx bx-bookmark' style="float: right; "></i>
	    </div>
	  </div>
</div>
</c:forEach>

	<script>
            	$(function(){
            		$(".card-body").click(function(){
            			console.log("클릭은된");
            			location.href= 'personalPr.bo?pno=' + $(this).children("#prCount").text();
            			console.log("클릭이후");
            		})	
            	})
            </script> 




</div>


	
</div>

</body>
</html>