<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<!-- css, js-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/newsDetailPage.css">
<script src="${pageContext.request.contextPath}/resources/js/newsDetailPage.js"></script>


</head>
<body>
	<jsp:include page="../common/template.jsp"/>

	<button type="button" class="btn btn-lg rounded-pill btn-icon btn-outline-primary up">
        <span class="tf-icons bx bx-chevrons-up"></span>
    </button>

	<div class="container-xxl flex-grow-1 container-p-y cpadding">
		<div class="row">

			<div class="zzimWrap col-md-1">
				<c:choose>
				
					<c:when test="${ check eq 1 }">
						<i class='bx bxs-heart-circle text-primary'></i>
					</c:when>
					
					<c:otherwise>
					
						<i class='bx bxs-heart-circle'></i>
					</c:otherwise>
				</c:choose>
				<br>
				<span class="likeCount">${ total }</span>
	
			</div>
	
			<div class="card col-lg-10 col-md-12 col-sm-12">
				<div class="wrap">
					<h1>${news.newsTitle }</h1>
					<br>
		
					<div class="subtitle">
						<div>
							<span class="userNo">${news.userNo }</span>
							<span>${news.createDate}</span>
						</div>
						<c:choose>
							<c:when test="${ loginUser.userName eq news.userNo }">
								<div>
									<a href="updateNews.p?nNo=${ news.newsNo }">수정하기</a>
									
									<a href="#" data-bs-toggle="modal" data-bs-target="#basicModal">삭제하기</a>
									
								</div>
							</c:when>
						</c:choose>
					</div>
					<br> <br>
		
					<p>${ news.newsContent }</p>
				</div>

				<div id="profileWrap">

					<img src="${news.profile}" alt="작성자 프로필" id="profile">
					<span>${news.userNo}</span>

				</div>
				<br> <br>
				<hr>
				<div id="replyWrap">

					<span id="replyCount"><span>${count}</span>개의 댓글</span>
					
				</div>

				<input type="hidden" name="commentWriter" value="${loginUser.userNo}" class="commentWriter">
				<input type="hidden" name="newsNo" value="${news.newsNo}" class="newsNo">
				<textarea name="reply" id="reply" class="form-control"></textarea>
				
				<div id="btnWrap">
					<button class="btn btn-primary btnSubmit">댓글작성</button>
				</div>

				<div id="replyWrap1">
					<c:forEach var="r" items="${ rlist }">
						<div class="replyProfile">
							<img src="${ r.profile }" alt="댓글작성자 프로필">
							<div class="time">
								<span class="writer">${ r.commentWriter }</span>
								<span>${r.commentDate }</span>
	
							</div>
						</div>
						<div class="replyContent">
							${r.commentContent }
						</div>
						<hr>
					</c:forEach>
				</div>
			</div>
		</div>

	
	</div>

	<!-- 삭제 모달-->

	<div class="modal fade" id="basicModal" tabindex="-1" style="display: none;" aria-hidden="true">
		<div class="modal-dialog" role="document">
		  <div class="modal-content">
			<div class="modal-header">
			  <h5 class="modal-title" id="exampleModalLabel1">뉴스 삭제</h5>
			  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			  <h3>정말로 삭제하시겠습니까?</h3>
			</div>
			
			<div align="center">

				<form action="deleteNews" method="post">

					<input type="hidden" name="newsNo" value="${news.newsNo}">
					<button type="submit" class="btn btn-outline-danger">확인</button>
					<button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">
						취소
					</button>

				</form>
					
			</div>
			<div class="modal-footer">
			  
			</div>
		  </div>
		</div>
	  </div>

</body>
</html>