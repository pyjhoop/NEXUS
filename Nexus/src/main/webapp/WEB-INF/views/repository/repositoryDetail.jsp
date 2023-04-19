<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% String[] arr = {"bg-primary","bg-success", "bg-danger", "bg-warning", "bg-info"}; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/repositoryDetail.css">

<script src="${ pageContext.request.contextPath }/resources/js/repositoryDetail.js"></script>

</head>
<body>
	<jsp:include page="../common/template.jsp"/>
	
	<script>
		console.log('${map}')
		console.log("hhh")
	</script>
	
	<c:set var="array" value="${fn:split('bg-primary,bg-success,bg-danger,bg-warning,bg-info',',')}" />
	<c:set var="textarray" value="${fn:split('text-primary,text-success,text-danger,text-warning,text-info',',')}" />
    <div class="container-xxl flex-grow-1 container-p-y cpadding mt-5">
        <div class="row">
            <div class="col-lg-8 col-md-8 col-sm-8">
                <div class="card mb-5">
                    <div class="row">
                        <div class="col-lg-7 col-md-7 col-sm-7">
                            <img src="resources/image/github_repo.png" id="repoImg" alt="">
                            <br>
                            <span id="repoPath">${repo.userName }/${repo.repoName }</span>
                        </div>
                        <div class="col-lg-5 col-md-5 col-sm-5">
                            <br>
                            <div class="progress mb-3">
                            <c:forEach var="value" items="${map.values() }" varStatus="status">
                                <div class="progress-bar ${array[status.index] } shadow-none" role="progressbar" style="width: ${value}%" aria-valuenow="15" aria-valuemin="0" aria-valuemax="100"></div>
                            </c:forEach>
                            </div>
                            
                            <c:forEach var="i" items="${map }" varStatus="status">
                            
                            	<p class="circle ${array[status.index] }"></p>
                                <h4> ${ i }%</h4>
                            
                            </c:forEach>
               
                        </div>

                    </div>
                </div>
                <input type="hidden" name="hiddenpath" id="hiddenpath" value="">
                <div class="card mb-5">
                    <div id="pathWrap">
                    	<span id="totalPath">${repo.userName}/<span class="origin" id="${repo.userName}/${repo.repoName}/contents">${repo.repoName}</span></span>
                        <br> <br>
                        
                       	<div class="clear">

                            <c:forEach var="i" items="${ list }">
                                
                                <c:choose>
                                    <c:when test="${i.type eq 'file' }">
                                        <div>
                                            <div class="row">
                                                <div class="col-lg-8">
                                                    <img alt="파일 이미지" src="resources/image/file.png" width="30px">
                                                    <a class="clcik1" href="${i.download_url }" target="_blank">${i.name }</a>

                                                </div>
                                                <div class="col-lg-4">
                                                    <span>${i.size}</span>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div>
                                            <img alt="폴더 이미지" src="resources/image/folder.png" width="30px">
                                            <span class="folder">${i.name }</span>
                                            
                                        </div>
                                    </c:otherwise>
                                
                                </c:choose>
                                <hr>
                            </c:forEach> 

                        </div>

                       
                    </div>
                </div>

                <div class="card mdFile">

                    <div>

                        ${text}

                    </div>

                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4">
                <div class="card mb-5">
                    <h2>NEXUS</h2>
                    <p>설명충 ....</p>
                </div>

                <div class="card mb-5">

                    <div style="width: 90%; margin: auto; margin-top: 10px; margin-bottom: 10px;">
                        <h3>프로젝트 관리자</h3>
                        <c:forEach var="i" items="${mList }">
                            <c:if test="${i.rollName eq 'admin' }">
                                <div style="display:flex; margin-left: 20px;">
                                    <img src="${i.profile}" alt="" width="50px" height="50px" style="border-radius: 100%; float: left; display: block;">
                                    <span style="line-height: 50px; margin-left: 10px;">${i.userName}</span>
    
                                </div>
    
                            </c:if>
                        </c:forEach>

                    </div>
                </div>

                <div class="card mb-5">

                    <div style="width: 90%; margin: auto; margin-top: 10px; margin-bottom: 10px;">
                        <h3>참여 멤버</h3>
                        <c:forEach var="i" items="${mList }">
                            
                            <div style="display:flex; margin-left: 20px;">
                                <img src="${i.profile}" alt="" width="50px" height="50px" style="border-radius: 100%; float: left; display: block;">
                                <span style="line-height: 50px; margin-left: 10px;">${i.userName}</span>

                            </div>
                            <br>
    
                          
                        </c:forEach>

                    </div>

                </div>
                
            </div>
        </div>
    </div>
   
</body>
</html>