<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page errorPage="../common/error500.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script src="${ pageContext.request.contextPath }/resources/js/repository.js"></script>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/repository.css">
</head>
<body>
	<jsp:include page="../common/template.jsp"/>

    <div class="container-xxl flex-grow-1 container-p-y cpadding mt-5">
        <div class="row mb-5">
			<c:forEach var="i" items="${ list }">

          <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
              <div class="card">
                <div class="pl-3">
                  <a href="repoDetail.p?rNo=${ i.repoNo }">
                    <h4 class="fw-bold py-3 mb-3">
                        <span class="text-muted fw-light">${ i.userName } /</span> ${ i.repoName }
                    </h4>
                    ${ i.repoStatus }
  
                  </a>

                </div>
              </div>
            </div>

			</c:forEach>

        </div>
    </div>

    <!-- Modal -->

    <div class="modal fade" id="basicModal" tabindex="-1" style="display: none;" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <form action="enrollRepo.p" method="get">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel1">Repository 등록</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                  </div>
                  <div class="modal-body">
                    <div class="row">
                      <div class="col mb-3">
                        <label for="userName" class="form-label">User</label>
                        <input type="text" name="userName" id="userName" class="form-control" placeholder="Enter Name">
                      </div>
                    </div>
                    <div class="row g-2">
                      <div class="col mb-0">
                        <label for="repoName" class="form-label">Repository</label>
                        <input type="text" name="repoName" id="repoName" class="form-control" placeholder="Enter Repository">
                      </div>
      
                    </div>
                    <input type="hidden" name="userNo" value="${ loginUser.userNo }">
                    <input type="hidden" name="token" value="${ loginUser.token }">
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                      Close
                    </button>
                    <button type="submit" class="btn btn-primary">Save</button>
                  </div>
                </div>

            </form>
        </div>
      </div>
</body>
</html>