<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../common/template.jsp" />
	
	<div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <div class="row">
                <div class="col-md-12">
                
                  <div class="card mb-4">
                    <h5 class="card-header">My Profile</h5>
                    <!-- Account -->
                    <div class="card-body">
                      <div class="d-flex align-items-start align-items-sm-center gap-4">
                        <img
                          src="${loginUser.profile }"
                          alt="user-avatar"
                          class="d-block rounded"
                          height="100"
                          width="100"
                          id="uploadedAvatar"
                        />
                      <form id="formAccountSettings" method="POST" action="myUpdate.ih" enctype="multipart/form-data">
                      	<input type="hidden" name="userNo" value="${loginUser.userNo }">
                      	<input type="hidden" name="profile" value="${loginUser.profile }">
                        <div class="button-wrapper">
                          <label for="upload" class="btn btn-primary me-2 mb-4" tabindex="0">
                            <span class="d-none d-sm-block">프로필 사진업로드</span>
                            <i class="bx bx-upload d-block d-sm-none"></i>
                            <input
                              type="file"
                              id="upload"
                              name="upfile"
                              class="account-file-input"
                              hidden
                              accept="image/png, image/jpeg"
                            />
                          </label>

                          <p class="text-muted mb-0">Allowed JPG, GIF or PNG. Max size of 800K</p>
                        </div>
                      </div>
                    </div>
                    <hr class="my-0" />
                    <div class="card-body">
                          <div class="mb-3 col-md-6">
                            <label for="firstName" class="form-label">User ID</label>
                            <input
                              class="form-control"
                              type="text"
                              id="firstName"
                              name="userId"
                              value="${loginUser.userId }"
                              autofocus
                              readonly
                            />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="lastName" class="form-label">User Name</label>
                            <input class="form-control" type="text" name="userName" id="lastName" value="${loginUser.userName }" required />
                          </div>
                          <div class="mb-3 col-md-6">
                            <label for="email" class="form-label">E-mail</label>
                            <input
                              class="form-control"
                              type="text"
                              id="email"
                              name="email"
                              value="${loginUser.email }"
                              placeholder=""
                            />
                          </div>
                         <div class="mb-3 col-md-6">
                            <label for="token" class="form-label">Token</label>
                            <input class="form-control" type="password" name="token" id="token" value="${loginUser.token }"/>
                          </div>

                        <br><br>
                        <div class="mt-2">
                          <button type="submit" class="btn btn-primary me-2">수정하기</button>
                          <button type="reset" class="btn btn-outline-secondary">취소</button>
                        </div>
                      </form>
                    </div>
                    <!-- /Account -->
                  </div>
                  <div class="card">
                    <h5 class="card-header">회원 탈퇴</h5>
                    <div class="card-body">
                      <div class="mb-3 col-12 mb-0">
                        <div class="alert alert-warning">
                          <h6 class="alert-heading fw-bold mb-1">회원 탈퇴를 원하십니까?</h6>
                          <p class="mb-0">계정을 삭제하면 되돌릴 수 없습니다. 신중하게 결정해주세요.</p>
                        </div>
                      </div>
                        <div class="form-check mb-3">
                          <input
                            class="form-check-input"
                            type="checkbox"
                            name="accountActivation"
                            id="accountActivation"
                          />
                          <label class="form-check-label" for="accountActivation"
                            >회원 탈퇴에 동의합니다.</label
                          >
                        </div>
                        <c:choose>
                        <c:when test="${ loginUser.social != 'O' }">
                        <a href="myDelete.ih?userNo=${loginUser.userNo }&social=${loginUser.social}" class="btn btn-danger deactivate-account" onclick="return checkConfirm();">회원 탈퇴</a>
                        </c:when>
                        <c:otherwise>
                        <button type="button" class="btn btn-danger deactivate-account" id="delete-btn">회원 탈퇴</button>
                        </c:otherwise>
                        </c:choose>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- / Content -->


            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
 
 	 <!-- Button trigger modal -->
                        <button
                          type="button"
                          class="btn btn-primary"
                          data-bs-toggle="modal"
                          data-bs-target="#modalCenter"
                          id="hidden-btn"
                          style="display:none;"
                        >
                         hidden btn
                        </button>
 	
 
 	  <!-- Modal -->
                        <div class="modal fade" id="modalCenter" tabindex="-1" aria-hidden="true">
                          <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="modalCenterTitle">비밀번호 입력</h5>
                                <button
                                  type="button"
                                  class="btn-close"
                                  data-bs-dismiss="modal"
                                  aria-label="Close"
                                ></button>
                              </div>
                              <div class="modal-body">
                                <div class="row">
                                  <div class="col mb-3">
                                  <form  method="POST" action="myDelete.ih">
                                  <input type="hidden" name="userNo" value="${loginUser.userNo }">
                                  <input type="hidden" name="userPwd" value="${loginUser.userPwd }">
                                    <label for="nameWithTitle" class="form-label">password</label>
                                    <input
                                      type="password"
                                      id="nameWithTitle"
                                      name="inputPassword"
                                      class="form-control"
                                      placeholder="Enter Password"
                                      required
                                    />
                                  </div>
                                </div>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                  Close
                                </button>
                                <button type="submit" class="btn btn-primary">탈퇴하기</button>
                                </form>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
	<script>
	

		$('#upload').change(function(){
			setImageFromFile(this, '#uploadedAvatar');
			});
			 
			function setImageFromFile(input, expression) {
			    if (input.files && input.files[0])
			    {
			        var reader = new FileReader();
			 
			            reader.onload = function (e) {
			                $(expression).attr('src', e.target.result);
			           }
			           reader.readAsDataURL(input.files[0]);
			     }
			}
		
		$("#delete-btn").click(function(){
			if(!$("#accountActivation").is(':checked')){
				alertify.alert('탈퇴 동의 항목에 체크해주세요!');
			}else{
				$("#hidden-btn").trigger('click');
			}
		})	
	
		function checkConfirm(){
			if(!$("#accountActivation").is(':checked')){
				alertify.alert('탈퇴 동의 항목에 체크해주세요!');
				return false;
			}
		}
	</script>

</body>
</html>