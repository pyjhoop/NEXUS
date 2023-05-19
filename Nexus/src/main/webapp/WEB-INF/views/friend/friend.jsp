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
	<script>
		$(function(){
	
		// active 클래스 를 repository로 옮기기
		$(".active").removeClass("active");
		$("#frrrr").addClass("active");
	
		})
	
	 </script>
	
	<!-- Content wrapper -->
    <div class="content-wrapper">
	  <div class="container-xxl flex-grow-1 container-p-y">
		
		<div align="right" style="overflow: hidden; height: 50px;">
	      <h4 class="fw-bold py-3" style="padding-bottom: 0rem; display: inline-block; float: left;"><span class="text-muted fw-light"></span> 친구 관리</h4>
		  <!-- Button ModalScrollable -->
          <button
            type="button"
            class="btn btn-primary"
            data-bs-toggle="modal"
            data-bs-target="#modalScrollable"
          >
            친구찾기
          </button>
          <br>
		</div>
		
		<!-- Modal -->
        <div class="modal fade" id="modalScrollable" tabindex="-1" aria-hidden="true">
          <div class="modal-dialog modal-dialog-scrollable" role="document">
            <div class="modal-content" style="height: calc(100% - 3.5rem)">
              <div class="modal-header">
                <h5 class="modal-title" id="modalScrollableTitle">친구찾기</h5>
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
                      id="keyword"
                      style="height: inherit;"
                    />
                    <button class="btn btn-outline-primary" type="button" id="button-addon2">검색</button>
                  </div>
                  
                  <br/>
                      
			      <div class="table-responsive text-nowrap" style="height: calc(100% - 3.5rem)">
			        <table class="table" id="searchTable">
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
			          		<th colspan="3" style="text-align: center">아이디 키워드를 입력하세요</th>
			          	</tr>
			          </tbody>
			        </table>
			      </div>
			    <!-- </div> -->
			    <!--/ Basic Bootstrap Table -->
			    <script type="text/javascript">
					$(function(){
							$(document).ready(selectFriend);
							$("#button-addon2").click(searchFriend);
						});
						
						function selectFriend(){
							$.ajax({
								url:"selectFriend.me",
								success:function(list){
									let value="";
									if(list.length == 0){
										value += "<tr><th colspan= '3' style='text-align: center'>친구찾기로 친구를 만들어봐요</th></tr>"
									}
									else{
										for(let i in list){
											console.log(list[i]);
											value += "<tr>"
												   + "<td>"
												   + "<ul class='list-unstyled users-list m-0 avatar-group d-flex align-items-center'>"
									               + "<li data-bs-toggle='tooltip' data-popup='tooltip-custom' data-bs-placement='top' class='avatar avatar-xs pull-up' title='" + list[i].userId + "'>"
									               + "<img src='" + list[i].profile + "' alt='Avatar' class='rounded-circle'/>"
									               + "</li>"
									               + "<strong>&nbsp;" + list[i].userId + "</strong>"
									               + "</ul>"
									               + "</td>"
									               + "<td>" + list[i].userName + "</td>"
									               
									               if(list[i].blockI == 'N' && list[i].blockMe == 'N')
									               		value += "<td><span class='badge bg-label-success me-1'>친구</span></td>"
									               else if(list[i].blockI == "Y")
									            	   value += "<td><span class='badge bg-label-danger me-1'>차단</span></td>"
							            		   else if(list[i].blockI == "N" && list[i].blockMe == null)
									            	   value += "<td><span class='badge bg-label-warning me-1'>친추보냄</span></td>"
							            		   else if(list[i].blockMe == "N" && list[i].blockI == null)
									            	   value += "<td><span class='badge bg-label-info me-1'>친추받음</span></td>"
									               else
									            	   value += "<td><span class='badge bg-label-primary me-1'>친구아님</span></td>"
									               
									         value += "<td>"
									               + "<div class='dropdown'>"
									               + "<button type='button' class='btn p-0 dropdown-toggle hide-arrow' data-bs-toggle='dropdown'>"
									               + "<i class='bx bx-dots-vertical-rounded'></i>"
									               + "</button>"
									               + "<div class='dropdown-menu'>"
									               
									               if(list[i].blockI == 'N' && list[i].blockMe == 'N') 
									            	   // 친구
									               	   value += "<a class='dropdown-item' href='javascript:void(0);' onclick='banFriend("+ list[i].userNo +",  &#39;N&#39;, &#39;Y&#39;);'><i class='bx bx-user-minus me-1'></i>차단</a>"
									               			  + "<a class='dropdown-item' href='javascript:void(0);' onclick='delFriend("+ list[i].userNo +");'><i class='bx bx-user-x me-1'></i>친구삭제</a>"
									               else if(list[i].blockI == "Y") 
									            	   // 차단
									            	   value += "<a class='dropdown-item' href='javascript:void(0);' onclick='banFriend("+ list[i].userNo +", &#39;Y&#39;, &#39;Y&#39;);'><i class='bx bx-user-check me-1'></i>차단해제</a>"
							            		   else if(list[i].blockI == "N" && list[i].blockMe == null)
							            			   //친추보냄
									            	   value += "<a class='dropdown-item' href='javascript:void(0);' onclick='banFriend("+ list[i].userNo +", &#39;N&#39;, &#39;Y&#39;);'><i class='bx bx-user-minus me-1'></i>차단</a>"
									               			  + "<a class='dropdown-item' href='javascript:void(0);' onclick='delFriend("+ list[i].userNo +");'><i class='bx bx-user-x me-1'></i>친추취소</a>"
							            		   else if(list[i].blockMe == "N" && list[i].blockI == null)
							            			   // 친추받음
									            	   value += "<a class='dropdown-item' href='javascript:void(0);' onclick='banFriend("+ list[i].userNo +", &#39;N&#39;, &#39;N&#39;);'><i class='bx bx-user-minus me-1'></i>차단</a>"
									               			  + "<a class='dropdown-item' href='javascript:void(0);' onclick='addFriend("+ list[i].userNo +");'><i class='bx bx-user-plus me-1'></i>친추수락</a>"
									               else
									            	   // 친구아님
									            	   value += "<a class='dropdown-item' href='javascript:void(0);' onclick='banFriend("+ list[i].userNo +", &#39;N&#39;, &#39;N&#39;);'><i class='bx bx-user-minus me-1'></i>차단</a>"
									               			  + "<a class='dropdown-item' href='javascript:void(0);' onclick='addFriend("+ list[i].userNo +");'><i class='bx bx-user-plus me-1'></i>친구추가</a>"
									               
									               + "</div>"
									               + "</div>"
									               + "</td>"
									               + "</tr>"
										}
									}
									$("#selectTable tbody").html(value);
								},
								error:function(){
									console.log("ajax 통신 실패");
								}
							});
						}
					
						function searchFriend(){
							
							if($("#keyword").val() == ""){
								$("#searchTable tbody").html("<tr><th colspan= '3' style='text-align: center'>아이디 키워드를 입력하세요</th></tr>");
							}
							else{
								$.ajax({
									url:"searchFriend.me",
									data:{keyword:$("#keyword").val()},
									success:function(list){
										let value="";
										console.log(list);
										console.log($("#keyword").val());
										if(list.length == 0){
											value += "<tr><th colspan= '3' style='text-align: center'>" + $("#keyword").val() + "에 대한 검색결과가 없습니다</th></tr>"
										}
										else{
											for(let i in list){
												console.log(list[i]);
												value += "<tr>"
													   + "<td>"
													   + "<ul class='list-unstyled users-list m-0 avatar-group d-flex align-items-center'>"
										               + "<li data-bs-toggle='tooltip' data-popup='tooltip-custom' data-bs-placement='top' class='avatar avatar-xs pull-up' title='" + list[i].userId + "'>"
										               + "<img src='" + list[i].profile + "' alt='Avatar' class='rounded-circle'/>"
										               + "</li>"
										               + "<strong>&nbsp;" + list[i].userId + "</strong>"
										               + "</ul>"
										               + "</td>"
										               + "<td>" + list[i].userName + "</td>"
										               
										               if(list[i].blockI == 'N' && list[i].blockMe == 'N')
										               		value += "<td><span class='badge bg-label-success me-1'>친구</span></td>"
										               else if(list[i].blockI == "Y")
										            	   value += "<td><span class='badge bg-label-danger me-1'>차단</span></td>"
								            		   else if(list[i].blockI == "N" && list[i].blockMe == null)
										            	   value += "<td><span class='badge bg-label-warning me-1'>친추보냄</span></td>"
								            		   else if(list[i].blockMe == "N" && list[i].blockI == null)
										            	   value += "<td><span class='badge bg-label-info me-1'>친추받음</span></td>"
										               else
										            	   value += "<td><span class='badge bg-label-primary me-1'>친구아님</span></td>"
										               
										         value += "<td>"
										               + "<div class='dropdown'>"
										               + "<button type='button' class='btn p-0 dropdown-toggle hide-arrow' data-bs-toggle='dropdown'>"
										               + "<i class='bx bx-dots-vertical-rounded'></i>"
										               + "</button>"
										               + "<div class='dropdown-menu'>"
										               
										               if(list[i].blockI == 'N' && list[i].blockMe == 'N') 
										            	   // 친구
										               	   value += "<a class='dropdown-item' href='javascript:void(0);' onclick='banFriend("+ list[i].userNo +",  &#39;N&#39;, &#39;Y&#39;);'><i class='bx bx-user-minus me-1'></i>차단</a>"
										               			  + "<a class='dropdown-item' href='javascript:void(0);' onclick='delFriend("+ list[i].userNo +");'><i class='bx bx-user-x me-1'></i>친구삭제</a>"
										               else if(list[i].blockI == "Y") 
										            	   // 차단
										            	   value += "<a class='dropdown-item' href='javascript:void(0);' onclick='banFriend("+ list[i].userNo +", &#39;Y&#39;, &#39;Y&#39;);'><i class='bx bx-user-check me-1'></i>차단해제</a>"
								            		   else if(list[i].blockI == "N" && list[i].blockMe == null)
								            			   //친추보냄
										            	   value += "<a class='dropdown-item' href='javascript:void(0);' onclick='banFriend("+ list[i].userNo +", &#39;N&#39;, &#39;Y&#39;);'><i class='bx bx-user-minus me-1'></i>차단</a>"
										               			  + "<a class='dropdown-item' href='javascript:void(0);' onclick='delFriend("+ list[i].userNo +");'><i class='bx bx-user-x me-1'></i>친추취소</a>"
								            		   else if(list[i].blockMe == "N" && list[i].blockI == null)
								            			   // 친추받음
										            	   value += "<a class='dropdown-item' href='javascript:void(0);' onclick='banFriend("+ list[i].userNo +", &#39;N&#39;, &#39;N&#39;);'><i class='bx bx-user-minus me-1'></i>차단</a>"
										               			  + "<a class='dropdown-item' href='javascript:void(0);' onclick='addFriend("+ list[i].userNo +");'><i class='bx bx-user-plus me-1'></i>친추수락</a>"
										               else
										            	   // 친구아님
										            	   value += "<a class='dropdown-item' href='javascript:void(0);' onclick='banFriend("+ list[i].userNo +", &#39;N&#39;, &#39;N&#39;);'><i class='bx bx-user-minus me-1'></i>차단</a>"
										               			  + "<a class='dropdown-item' href='javascript:void(0);' onclick='addFriend("+ list[i].userNo +");'><i class='bx bx-user-plus me-1'></i>친구추가</a>"
										               
										               + "</div>"
										               + "</div>"
										               + "</td>"
										               + "</tr>"
											}
										}
										$("#searchTable tbody").html(value);
									},
									error:function(){
										console.log("ajax 통신 실패");
									}
								});
							}
						}
						
						function addFriend(addUserNo){
							$.ajax({
								url:"addFriend.me",
								data:{addUserNo:addUserNo},
								success:function(result){
									if(result > 0){
										searchFriend();
										selectFriend();
									}
								},
								error:function(){
									console.log("ajax 통신 실패!");
								}
							});
						}
						
						function delFriend(delUserNo){
							$.ajax({
								url:"delFriend.me",
								data:{delUserNo:delUserNo},
								success:function(result){
									if(result > 0){
										searchFriend();
										selectFriend();
									}
								},
								error:function(){
									console.log("ajax 통신 실패!");
								}
							});
						}
						
						function banFriend(banUserNo, isBanned, isFriend){
							console.log('clicked');
							console.log(banUserNo);
							console.log(isBanned);
							console.log(isFriend);
							
							$.ajax({
								url:"banFriend.me",
								data:{banUserNo:banUserNo, isBanned:isBanned, isFriend:isFriend},
								success:function(result){
									console.log('success?');
									console.log(result);
									if(result > 0){
										searchFriend();
										selectFriend();
									}
								},
								error:function(){
									console.log("ajax 통신 실패!");
								}
							});
						}
						
				</script>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                  닫기
                </button>
                <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
              </div>
            </div>
          </div>
        </div>
        
		<div class="">
		<!-- Basic Bootstrap Table -->
	    <div class="card">
	      <h5 class="card-header">친구 목록</h5>
	      <div class="table-responsive text-nowrap" style="min-height: 200px; padding-bottom: 50px; padding-left: 50px; padding-right: 50px">
	        <table class="table" id="selectTable">
	          <thead>
	            <tr>
	              <th>ID</th>
	              <th>Name</th>
	              <th>Status</th>
	              <th></th>
	            </tr>
	          </thead>
	          <tbody class="table-border-bottom-0">
	          	
	          </tbody>
	        </table>
	      </div>
	    </div>
	    <!--/ Basic Bootstrap Table -->
	    </div>

	  </div>
	</div>
</body>
</html>