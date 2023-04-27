<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- favicon-->
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/image/logo3.png" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
</head>
<body>
	<jsp:include page="../common/template.jsp"/>
	
	<!-- Content wrapper -->
    <div class="content-wrapper">
	  <div class="container-xxl flex-grow-1 container-p-y">
        <h4 class="fw-bold py-3" style="padding-bottom: 0rem"><span class="text-muted fw-light">Tables /</span> Basic Tables</h4>
		
		<div class="mb-4" align="right">
		  <!-- Button ModalScrollable -->
          <button
            type="button"
            class="btn btn-primary"
            data-bs-toggle="modal"
            data-bs-target="#modalScrollable"
          >
            Add Friend
          </button>
          <br>
		</div>
		
		<!-- Modal -->
        <div class="modal fade" id="modalScrollable" tabindex="-1" aria-hidden="true">
          <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="modalScrollableTitle">Search Friend</h5>
                <button
                  type="button"
                  class="btn-close"
                  data-bs-dismiss="modal"
                  aria-label="Close"
                ></button>
              </div>
              <div class="modal-body">
                <!-- Basic Bootstrap Table -->
			    <!-- <div class="card"> -->
			      <!-- <h5 class="card-header">Table Basic</h5> -->
			      <div class="input-group input-group-merge">
                    <span class="input-group-text" id="basic-addon-search31"><i class="bx bx-search"></i></span>
                    <input
                      type="text"
                      class="form-control"
                      placeholder="Search..."
                      aria-label="Search..."
                      aria-describedby="basic-addon-search31"
                    />
                    <button class="btn btn-outline-primary" type="button" id="button-addon2">Search</button>
                  </div>
                  
                  <br/>
                      
			      <div class="table-responsive text-nowrap">
			        <table class="table">
			          <thead>
			            <tr>
			              <th>ID</th>
			              <th>Name</th>
			              <th>Status</th>
			              <th></th>
			            </tr>
			          </thead>
			          <tbody class="table-border-bottom-0">
			            <tr>
			              <td>
			              	<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
			                  <li
			                    data-bs-toggle="tooltip"
			                    data-popup="tooltip-custom"
			                    data-bs-placement="top"
			                    class="avatar avatar-xs pull-up"
			                    title="커햄1"
			                  >
			                    <img src="https://item.kakaocdn.net/do/da766714a9d8ac1bb328f653232c0e19effd194bae87d73dd00522794070855d" alt="Avatar" class="rounded-circle"/>
			                  </li>
			                  <strong>&nbsp;커햄1</strong>
			                </ul>
			                
			              </td>
			              <td>Albert Cook</td>
			              <td><span class="badge bg-label-primary me-1">Active</span></td>
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
			            <tr>
			              <td>
			              	<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
			                  <li
			                    data-bs-toggle="tooltip"
			                    data-popup="tooltip-custom"
			                    data-bs-placement="top"
			                    class="avatar avatar-xs pull-up"
			                    title="Lilian Fuller"
			                  >
			                    <img src="https://item.kakaocdn.net/do/da766714a9d8ac1bb328f653232c0e19effd194bae87d73dd00522794070855d" alt="Avatar" class="rounded-circle" />
			                  </li>
			                  <strong>&nbsp;커햄2</strong>
			                </ul>
			              </td>
			              <td>Barry Hunter</td>
			              <td><span class="badge bg-label-success me-1">Completed</span></td>
			              <td>
			                <div class="dropdown">
			                  <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
			                    <i class="bx bx-dots-vertical-rounded"></i>
			                  </button>
			                  <div class="dropdown-menu">
			                    <a class="dropdown-item" href="javascript:void(0);"
			                      ><i class="bx bx-edit-alt me-2"></i> Edit</a
			                    >
			                    <a class="dropdown-item" href="javascript:void(0);"
			                      ><i class="bx bx-trash me-2"></i> Delete</a
			                    >
			                  </div>
			                </div>
			              </td>
			            </tr>
			            <tr>
			              <td>
			              	<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
			                  <li
			                    data-bs-toggle="tooltip"
			                    data-popup="tooltip-custom"
			                    data-bs-placement="top"
			                    class="avatar avatar-xs pull-up"
			                    title="Lilian Fuller"
			                  >
			                    <img src="https://item.kakaocdn.net/do/da766714a9d8ac1bb328f653232c0e19effd194bae87d73dd00522794070855d" alt="Avatar" class="rounded-circle" />
			                  </li>
			                  <strong>&nbsp;커햄3</strong>
			                </ul>
			              </td>
			              <td>Trevor Baker</td>
			              <td><span class="badge bg-label-info me-1">Scheduled</span></td>
			              <td>
			                <div class="dropdown">
			                  <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
			                    <i class="bx bx-dots-vertical-rounded"></i>
			                  </button>
			                  <div class="dropdown-menu">
			                    <a class="dropdown-item" href="javascript:void(0);"
			                      ><i class="bx bx-edit-alt me-2"></i> Edit</a
			                    >
			                    <a class="dropdown-item" href="javascript:void(0);"
			                      ><i class="bx bx-trash me-2"></i> Delete</a
			                    >
			                  </div>
			                </div>
			              </td>
			            </tr>
			            <tr>
			              <td>
			              	<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
			                  <li
			                    data-bs-toggle="tooltip"
			                    data-popup="tooltip-custom"
			                    data-bs-placement="top"
			                    class="avatar avatar-xs pull-up"
			                    title="Lilian Fuller"
			                  >
			                    <img src="https://item.kakaocdn.net/do/da766714a9d8ac1bb328f653232c0e19effd194bae87d73dd00522794070855d" alt="Avatar" class="rounded-circle" />
			                  </li>
			                  <strong>&nbsp;커햄1</strong>
			                </ul>
			              </td>
			              <td>Jerry Milton</td>
			              <td><span class="badge bg-label-warning me-1">Pending</span></td>
			              <td>
			                <div class="dropdown">
			                  <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
			                    <i class="bx bx-dots-vertical-rounded"></i>
			                  </button>
			                  <div class="dropdown-menu">
			                    <a class="dropdown-item" href="javascript:void(0);"
			                      ><i class="bx bx-edit-alt me-2"></i> Edit</a
			                    >
			                    <a class="dropdown-item" href="javascript:void(0);"
			                      ><i class="bx bx-trash me-2"></i> Delete</a
			                    >
			                  </div>
			                </div>
			              </td>
			            </tr>
			          </tbody>
			        </table>
			      </div>
			    <!-- </div> -->
			    <!--/ Basic Bootstrap Table -->
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                  Close
                </button>
                <button type="button" class="btn btn-primary">Save changes</button>
              </div>
            </div>
          </div>
        </div>
		
		<!-- Basic Bootstrap Table -->
	    <div class="card">
	      <h5 class="card-header">Table Basic</h5>
	      <div class="table-responsive text-nowrap">
	        <table class="table">
	          <thead>
	            <tr>
	              <th>ID</th>
	              <th>Name</th>
	              <th>Status</th>
	              <th></th>
	            </tr>
	          </thead>
	          <tbody class="table-border-bottom-0">
	          	<c:forEach var="friend" items="${list}">
	            <tr>
	              <td>
	              	<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
	                  <li
	                    data-bs-toggle="tooltip"
	                    data-popup="tooltip-custom"
	                    data-bs-placement="top"
	                    class="avatar avatar-xs pull-up"
	                    title="커햄1"
	                  >
	                    <img src="https://item.kakaocdn.net/do/da766714a9d8ac1bb328f653232c0e19effd194bae87d73dd00522794070855d" alt="Avatar" class="rounded-circle"/>
	                  </li>
	                  <strong>&nbsp;${ friend.userNick }</strong>
	                </ul>
	                
	              </td>
	              <td>Albert Cook</td>
	              <td><span class="badge bg-label-primary me-1">Active</span></td>
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
	            </c:forEach>
	            <tr>
	              <td>
	              	<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
	                  <li
	                    data-bs-toggle="tooltip"
	                    data-popup="tooltip-custom"
	                    data-bs-placement="top"
	                    class="avatar avatar-xs pull-up"
	                    title="Lilian Fuller"
	                  >
	                    <img src="https://item.kakaocdn.net/do/da766714a9d8ac1bb328f653232c0e19effd194bae87d73dd00522794070855d" alt="Avatar" class="rounded-circle" />
	                  </li>
	                  <strong>&nbsp;커햄2</strong>
	                </ul>
	              </td>
	              <td>Barry Hunter</td>
	              <td><span class="badge bg-label-success me-1">Completed</span></td>
	              <td>
	                <div class="dropdown">
	                  <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
	                    <i class="bx bx-dots-vertical-rounded"></i>
	                  </button>
	                  <div class="dropdown-menu">
	                    <a class="dropdown-item" href="javascript:void(0);"
	                      ><i class="bx bx-edit-alt me-2"></i> Edit</a
	                    >
	                    <a class="dropdown-item" href="javascript:void(0);"
	                      ><i class="bx bx-trash me-2"></i> Delete</a
	                    >
	                  </div>
	                </div>
	              </td>
	            </tr>
	            <tr>
	              <td>
	              	<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
	                  <li
	                    data-bs-toggle="tooltip"
	                    data-popup="tooltip-custom"
	                    data-bs-placement="top"
	                    class="avatar avatar-xs pull-up"
	                    title="Lilian Fuller"
	                  >
	                    <img src="https://item.kakaocdn.net/do/da766714a9d8ac1bb328f653232c0e19effd194bae87d73dd00522794070855d" alt="Avatar" class="rounded-circle" />
	                  </li>
	                  <strong>&nbsp;커햄3</strong>
	                </ul>
	              </td>
	              <td>Trevor Baker</td>
	              <td><span class="badge bg-label-info me-1">Scheduled</span></td>
	              <td>
	                <div class="dropdown">
	                  <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
	                    <i class="bx bx-dots-vertical-rounded"></i>
	                  </button>
	                  <div class="dropdown-menu">
	                    <a class="dropdown-item" href="javascript:void(0);"
	                      ><i class="bx bx-edit-alt me-2"></i> Edit</a
	                    >
	                    <a class="dropdown-item" href="javascript:void(0);"
	                      ><i class="bx bx-trash me-2"></i> Delete</a
	                    >
	                  </div>
	                </div>
	              </td>
	            </tr>
	            <tr>
	              <td>
	              	<ul class="list-unstyled users-list m-0 avatar-group d-flex align-items-center">
	                  <li
	                    data-bs-toggle="tooltip"
	                    data-popup="tooltip-custom"
	                    data-bs-placement="top"
	                    class="avatar avatar-xs pull-up"
	                    title="Lilian Fuller"
	                  >
	                    <img src="https://item.kakaocdn.net/do/da766714a9d8ac1bb328f653232c0e19effd194bae87d73dd00522794070855d" alt="Avatar" class="rounded-circle" />
	                  </li>
	                  <strong>&nbsp;커햄1</strong>
	                </ul>
	              </td>
	              <td>Jerry Milton</td>
	              <td><span class="badge bg-label-warning me-1">Pending</span></td>
	              <td>
	                <div class="dropdown">
	                  <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
	                    <i class="bx bx-dots-vertical-rounded"></i>
	                  </button>
	                  <div class="dropdown-menu">
	                    <a class="dropdown-item" href="javascript:void(0);"
	                      ><i class="bx bx-edit-alt me-2"></i> Edit</a
	                    >
	                    <a class="dropdown-item" href="javascript:void(0);"
	                      ><i class="bx bx-trash me-2"></i> Delete</a
	                    >
	                  </div>
	                </div>
	              </td>
	            </tr>
	          </tbody>
	        </table>
	      </div>
	    </div>
	    <!--/ Basic Bootstrap Table -->
	
	    <hr class="my-5" />
	    
	   
	  </div>
	</div>
</body>
</html>