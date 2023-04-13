<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>





    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />


  



<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.18/dist/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript 한국어 번역 파일 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/i18n/defaults-ko_KR.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../../../resources/css/core_issue_mini.css">
<link rel="stylesheet" href="../../../resources/css/apex-charts.css">
<link rel="stylesheet" href="../../../resources/css/theme-default.css">



<style>

.luda {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.luda a {
  margin-left: auto;
  margin-right: 5vw;
}



</style>




</head>
<body>


	<jsp:include page="../common/template.jsp"/>

     
     
     
     
     
          <!-- Content wrapper -->
          <div class="content-wrapper">
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Project /</span> NEXUS Project </h4>


          
                <br><br>


              <!-- Basic Bootstrap Table -->
              <div class="card">
                <h5 class="card-header" style="padding-bottom: 0px;">NEXUS Project</h5>
                
                
                
            
                  <div class="luda">
                      
                      <a class="btn btn-primary" href="issueEnroll.mini">이슈 등록</a>
                 
            	</div><br>
            	
                <div class="table-responsive text-nowrap">
                  <table class="table">
                    <thead>
                      <tr>
                      	<th><button type="button" class="btn btn-outline-primary">전체</button></th>
                      	<th><button type="button" class="btn btn-outline-success">진행 중</button></th>
                      	<th><button type="button" class="btn btn-outline-secondary">종료</button></th>
                        <th>
			                <select class="form-select" aria-label="Default select example">
							  <option selected>라벨</option>
							  <option value="1">버그</option>
							  <option value="2">문서작성</option>
							  <option value="3">베포 관려</option>
							  <option value="4">기능</option>
							  <option value="5">개발 환경</option>
							  <option value="6">기타 등등</option>
							</select>
                        </th>
                        
                        
                        <th>
                            <select class="form-select" aria-label="Default select example">
							  <option selected>작성자</option>
							  <!-- 프로젝트 사람 반복문으로 불러오기 + 값으로 그사람 아이디 넘기고 정렬? -->
							  <option value="mini">혜민</option>
							  <option value="jun">연준</option>
							  <option value="ho">인호</option>
							  <option value="hyeon">철현</option>
							  <option value="jun">준호</option>
							</select>
                        </th>
                        <th>
                              <select class="form-select" aria-label="Default select example">
							  <option selected>우선순위</option>
							  <option value="1">젤 먼저</option>
							  <option value="2">되도록이면 빨리</option>
							  <option value="3">중간</option>
							  <option value="4">천천히</option>
							</select>
                        </th>
                        <th>
                          <select class="form-select" aria-label="Default select example">
							  <option selected>담당자</option>
							  <!-- 프로젝트 사람 반복문으로 불러오기 + 값으로 그사람 아이디 넘기고 정렬? -->
							  <option value="mini">혜민</option>
							  <option value="jun">연준</option>
							  <option value="ho">인호</option>
							  <option value="hyeon">철현</option>
							  <option value="jun">준호</option>
							</select>
                        </th>
                        <th>마일스톤</th>
                      </tr>
                    </thead>
                    <tbody class="table-border-bottom-0">
                    
                    
                    <!-- 한바퀴  -->
                    
                      <tr>
                        <td colspan="3"><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>이슈 제목</strong></td>
                        
                         <td><span class="badge bg-label-primary me-1">버그</span></td>
                        
                         <td>
                          <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
                            <li
                              data-bs-toggle="tooltip"
                              data-popup="tooltip-custom"
                              data-bs-placement="top"
                              class="avatar avatar-xs pull-up"
                              title="이혜민"
                            >
                              <img src="../assets/img/avatars/5.png" alt="" class="rounded-circle" />
                            </li>
                          
                          </ul>
                        </td>
                       
                        <td><span class="badge bg-label-primary me-1">Active</span></td>
                         <td>
                          <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
                            <li
                              data-bs-toggle="tooltip"
                              data-popup="tooltip-custom"
                              data-bs-placement="top"
                              class="avatar avatar-xs pull-up"
                              title="이혜민"
                            >
                              <img src="../assets/img/avatars/5.png" alt="" class="rounded-circle" />
                            </li>
                            <li
                              data-bs-toggle="tooltip"
                              data-popup="tooltip-custom"
                              data-bs-placement="top"
                              class="avatar avatar-xs pull-up"
                              title="왈왈왈"
                            >
                              <img src="../assets/img/avatars/6.png" alt="" class="rounded-circle" />
                            </li>
                            <li
                              data-bs-toggle="tooltip"
                              data-popup="tooltip-custom"
                              data-bs-placement="top"
                              class="avatar avatar-xs pull-up"
                              title="테스트"
                            >
                              <img src="../assets/img/avatars/7.png" alt="" class="rounded-circle" />
                            </li>
                          </ul>
                        </td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-1"></i> Edit</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-1"></i> Delete</a
                              >
                            </div>
                          </div>
                        </td>
                      </tr>
                      
                      <!-- 한바퀴  -->
                      
                       <!-- 한바퀴  -->
                    
                      <tr>
                        <td colspan="3"><i class="fab fa-angular fa-lg text-danger me-3"></i> <strong>이슈 제목</strong></td>
                        
                         <td><span class="badge bg-label-primary me-1">개발환경</span></td>
                        
                         <td>
                          <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
                            <li
                              data-bs-toggle="tooltip"
                              data-popup="tooltip-custom"
                              data-bs-placement="top"
                              class="avatar avatar-xs pull-up"
                              title="닉네임"
                            >
                              <img src="../assets/img/avatars/5.png" alt="" class="rounded-circle" />
                            </li>
                          
                          </ul>
                        </td>
                       
                        <td><span class="badge bg-label-primary me-1">Active</span></td>
                         <td>
                          <ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
                            <li
                              data-bs-toggle="tooltip"
                              data-popup="tooltip-custom"
                              data-bs-placement="top"
                              class="avatar avatar-xs pull-up"
                              title="벌써"
                            >
                              <img src="../assets/img/avatars/5.png" alt="" class="rounded-circle" />
                            </li>
                            <li
                              data-bs-toggle="tooltip"
                              data-popup="tooltip-custom"
                              data-bs-placement="top"
                              class="avatar avatar-xs pull-up"
                              title="12시"
                            >
                              <img src="../assets/img/avatars/6.png" alt="" class="rounded-circle" />
                            </li>
                            <li
                              data-bs-toggle="tooltip"
                              data-popup="tooltip-custom"
                              data-bs-placement="top"
                              class="avatar avatar-xs pull-up"
                              title="오예"
                            >
                              <img src="../assets/img/avatars/7.png" alt="" class="rounded-circle" />
                            </li>
                          </ul>
                        </td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-1"></i> Edit</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-1"></i> Delete</a
                              >
                            </div>
                          </div>
                        </td>
                      </tr>
                      
                      <!-- 한바퀴  -->
                    </tbody>
                  </table>
                </div>
              </div>
              <!--/ Basic Bootstrap Table -->
     
     
     
     
     
     
     <script>

      const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        tooltipTriggerList.map(function (tooltipTriggerEl) {
          return new bootstrap.Tooltip(tooltipTriggerEl);
        });

     </script>
     
     
     
  
     
     
    <script src="../../../resources/js/issue_mini.js"></script>
     
     
     
     
     
     
     
     <!-- ------------------------------------------------------------------------------------------------------------- -->    	
     
     
     
  
    <script async defer src="https://buttons.github.io/buttons.js"></script>
     

</body>
</html>