<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--  <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/css/bootstrap.min.css' /> -->
 <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/css/fontawesome.min.css' />
 <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/css/all.min.css' />
 <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/css/chat_style.css' />
 <style>
 .chat-window .chat-scroll 
 {
  height: calc(100vh - 255px);
  overflow-y: scroll;
  }
  .media-img-wrap {
    margin-right: 15px;
    position: relative;
}
  .media2 {
    border-bottom: 1px solid #e5e5e5;
    padding: 10px 15px;
    transition: all .2s ease 0s;
}
	.user-name {
    color: #333;
    text-transform: capitalize;
}
    .user-last-chat {
    color: #8a8a8a;
    font-size: 14px;
    line-height: 24px;
}
	.media-body2 {
    display: flex;
    justify-content: space-between;
    width: 100%;
}
	.chat-window {
    display: flex;
    flex-wrap: wrap;
    position: relative;
    margin-bottom: 1.875rem;
    box-shadow: 0 0 13px 0 rgba(82,63,105,.05);
    border-radius: 20px;
    overflow: hidden;
}
	.chat-cont-right {
    flex: 0 0 65%;
    max-width: 65%;
}	
	.chat-cont-left {
    border-right: 1px solid #e5e5e5;
    flex: 0 0 35%;
    left: 0;
    max-width: 35%;
    position: relative;
    z-index: 4;
}
	.card-body {
	background-color: white
	}
	.chat-window .chat-cont-left .chat-users-list {
    background-color:var(--bs-body-bg);
}
	#hidden-btn{
	display:none;
	}
	.chat-window .chat-cont-right .chat-footer {
	padding: 30px 15px;
	}
	.btn-icon2{
	position: absolute;
    right: 4px;
    top: 7px;
    z-index: 999;
    
	}
	#search-btn{
	border:none;
	background-color:#fff;
	border-radius: 20px;
}
a:hover { text-decoration:none !important }
 </style>
</head>
<body>
	<jsp:include page="../common/template.jsp"/>
	
	<div class="container-wrapper">
	<div class="container-xxl flex-grow-1 container-p-y">
	<div class="row">
	<div class="col-sm-12">
	<div class="chat-window">
	<div class="chat-cont-left">
	<div class="chat-header">
	<span>Chats</span>
	<div class="chat-compose" id="create-room">
	<i class="bx bx-plus-circle" style="font-size: 1.3rem; cursor:pointer"></i>
	</div>
	</div>
	<div class="chat-search">
	<div class="input-group">
	<input type="text" class="form-control" name="search" placeholder="Search" id="selectUser">
	<div class="btn-icon2">
	<button class="bx bx-search-alt-2" id="search-btn"></button>
	</div>
	</div>
	</div>
	<div class="chat-users-list">
	<div class="chat-scroll" id="search-user">
	<c:if test="${not empty fList }">
	<c:forEach var="f" items="${ fList }">
	<div class="card-body d-flex">
	<div class="media-img-wrap">
	<div class="avatar">
	<img src="${f.profile }" alt="" class="avatar-img rounded-circle">
	</div>
	</div>
	<div class="media-body2">
	<div>
	<div class="user-name">
	${f.userName }
	</div>
	<div>
	userCode : ${f.userNo }
	</div>
	</div>
	<div>
	<input type="Checkbox" class="form-check-input" name="chat-check" value="${f.userNo }">
	</div>
	</div>
	</div>
	<hr class="m-0">
	</c:forEach>
	</c:if>
	</div>
	</div>
	</div>
	<div class="chat-cont-right" style="max-width: 65%; ">
	<div class="chat-header">
	<a id="back_user_list" href="" class="back-user-list">
	<i class="bx bx-chevron-left"></i>
	</a>
	<div class="media d-flex">
	<div class="media-img-wrap">
	<div class="avatar">
	<img src="${loginUser.profile }" alt="" class="avatar-img rounded-circle">
	</div>
	</div>
	<div class="media-body">
	<div class="user-name">${loginUser.userName }</div>
	</div>
	</div>
	</div>
	
	<div class="chat-users-list">
	<div class="chat-scroll" id="room-list">
	
	
	</div>
	</div>
	<div class="chat-footer">
	
	</div>
	</div>
	</div>
	</div>
	  <button
        type="button"
         class="btn btn-primary"
        data-bs-toggle="modal"
        data-bs-target="#modalCenter"
        id="hidden-btn"
         >
         </button>

                        <!-- Modal -->
                        <div class="modal fade" id="modalCenter" tabindex="-1" aria-hidden="true">
                          <div class="modal-dialog modal-dialog-centered" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="modalCenterTitle">단톡방 생성</h5>
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
                                  <form  action="groupRoom.ih" method="post"  enctype="multipart/form-data">
                                    <label for="nameWithTitle" class="form-label">단톡방 이름</label>
                                    <input
                                      type="text"
                                      id="nameWithTitle"
                                      class="form-control"
                                      name="roomTitle"
                                      placeholder="Enter Name"
                                      required
                                    />
                                  </div>
                                </div>
                                <div class="row g-2">
                                  <div class="col mb-0">
                                   <label for="formFile" class="form-label">단톡방 대표 이미지</label>
                       				 <input class="form-control" type="file" id="formFile" name="upfile"/>
                                  </div>
                                 <input type="hidden" name="uno" value="">
                                </div>
                              </div>
                              <div class="modal-footer">
                                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                                  Close
                                </button>
                                <button type="submit" class="btn btn-primary">Create</button>
                              </div>
                              </form>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
	
	
	<script>
	const userNo = "${loginUser.userNo}";
	
	let checkNo = new Array();
	let count = 0;
	$("#create-room").click(function(){
		if($('input:checkbox[name=chat-check]:checked').length >= 2){
			$('input:checkbox[name=chat-check]').each(function() {
				if($(this).is(":checked")==true){
			    	checkNo[count] = $(this).val();
			    	count++;
			    }
			});
				checkNo.push("${loginUser.userNo}");
				let uno = checkNo.join(",");
				$("input[name=uno]").val(uno);
			$("#hidden-btn").trigger("click");
		}else{
			$('input:checkbox[name=chat-check]').each(function() {
				if($(this).is(":checked")==true){
			    	checkNo = $(this).val();
			    	location.href = "createRoom.ih?checkNo="+checkNo;
			    }
			});
		}
	});
	
	$(function(){
		 updateRoom();
		
		setInterval(updateRoom, 2000);
		
	});
	
	function updateRoom(){
		$.ajax({
			url:"updateRoom.ih",
			success:function(result){
				console.log(1);
				let value = "";
				
				for(let i in result){
					value += "<a href=" 
					     + "roomDetail.ih?roomNo="
					     + result[i].roomNo
					     + "&changeName="
					     + result[i].changeName
					     + "&numberParticipants="
					     + result[i].numberParticipants
					     + "&roomTitle="
					     + result[i].roomTitle
					     + "&userNo="
					     + userNo
					 	 + " class='card-body d-flex'>"
						 + "<div class='media-img-wrap'>"
						 + "<div class='avatar'>"
						 + "<img src="
						 + result[i].changeName
						 + " class='avatar-img rounded-circle room-img'>"
						 + "</div>"
						 + "</div>"
						 + "<div class='media-body2'>"
					     + "<div>"
						 + "<div class='user-name room-title'>"
					     + result[i].roomTitle
						 + "</div>"
						 + "<div class='user-last-chat'>"
						 + result[i].lastChat
						 + "</div>"
						 + "</div>"
					 	 + "<div>"
					     + "<div class='last-chat-time block'>"
						 + result[i].lastDate
						 + "</div>"
						 + "<div class='badge badge-success badge-pill'>"
						 + result[i].count
						 + "</div>"
						 + "</div>"
						 + "</div>"
						 + "</a>"
						 + "<hr class='m-0'>";

					//$(".user-last-chat").eq(i).text(result[i].lastChat);
					//$(".last-chat-time block").eq(i).text(result[i].lastDate);
					//$(".badge-success").eq(i).text(result[i].count);
					
					
					
					}
				console.log(value);
				$("#room-list").html(value);
				for(let i in result){
					if(result[i].count != 0){
					$(".badge-success").eq(i).show();	
					}else{
					$(".badge-success").eq(i).hide();
					}
					if(result[i].lastChat != null){
					$(".last-chat-time").eq(i).show();	
					}else{
					$(".last-chat-time").eq(i).html("")	
					}
					if(result[i].lastChat != null){
					$(".user-last-chat").eq(i).show();	
					}else{
					$(".user-last-chat").eq(i).hide();	
					}
					if(result[i].createUserNo == userNo ){
					$(".room-title").eq(i).html(result[i].roomTitle2);
					$(".room-img").eq(i).attr("src",result[i].changeName2);
					}
				}
				}
				
		});
	}
	
	 $("#search-btn").click(function(){
     	console.log($("#selectUser").val());
     	$.ajax({
     		url:"search.ih",
     		data:{
     			search:$("#selectUser").val(),
     			userNo:'${loginUser.userNo}'
     		},
     		success:function(result){
     			console.log(result);
     			
     			let value = "";
     			
     			for(let i in result){
     				value += "<div class='card-body d-flex'>" +
     				   "<div class='media-img-wrap'>" +
     			       "<div class='avatar'>" +
     				   "<img src= " +
     				    result[i].profile + 
     				   " class='avatar-img rounded-circle'>" +
     				   "</div>"	+
     				   "</div>" +
     			       "<div class='media-body2'>" +
     				   "<div>" +
     				   "<div class='user-name'>" +
     				   result[i].userName +
     				   "</div>" + 
     				   "<div>" +
     				   "userCode : " + 
     				   result[i].userNo +
     				   "</div>" +
     				   "</div>" +
     				   "<div>" +
     				   "<input type='Checkbox' class= " +
     				   "'form-check-input'" +
     				   " name='chat-check' value=" +
     				   result[i].userNo +
     				   ">" +
     				   "</div>" +
     				   "</div>" +
     				   "</div>" +
     				   "<hr class='m-0'>";
     			}
     			
     			console.log(value);
     			
     		$("#search-user").html(value);
     		}, error:function(){
     			console.log('ajax 실패');
     		}
     	})
     });
	
	 $("#selectUser").on("keyup",function(key){
	        if(key.keyCode==13) {
	        	$("#search-btn").trigger('click');
	        }
	    });
	</script>
	
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	<!--<script src="${pageContext.request.contextPath}/resources/js/bootstrap.bundle.min.js"></script>-->
	 <script src="${pageContext.request.contextPath}/resources/js/feather.min.js"></script> 
	<script src="${pageContext.request.contextPath}/resources/js/jquery.slimscroll.min.js""></script>
	<!-- <script src="${pageContext.request.contextPath}/resources/js/chat_script.js"></script> -->
</body>
</html>