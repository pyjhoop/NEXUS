<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/news2.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/newsList.js"></script>
</head>
<body>
	<jsp:include page="../common/template.jsp"/>
    <button type="button" class="btn btn-lg rounded-pill btn-icon btn-outline-primary">
        <span class="tf-icons bx bx-chevrons-up"></span>
      </button>
    <div class="sub">
        <button type="button" class="btn btn-primary" id="enroll">뉴스작성</button>
    </div>
    <div class="container-xxl flex-grow-1 container-p-y cpadding">
        <script>
            const Viewer = toastui.Editor;
        </script>
		<c:forEach var="i" items="${list }" varStatus="status">
	        <div class="card mb-5 ct">
	            <div class="firstrow" style="display: flex;">
	                <div class="col-md-2 col-4 profile1" style="display: flex;">
	                    <img src="${i.profile}" alt="프로필" class="profile rounded-circle">
	                    <span class="username d-flex align-items-center justify-content-center">${i.userNo}</span>
	                </div>
	                <div class="col-md-5 col-4 d-flex align-items-center justify-content-center title">${ i.newsTitle }</div>
	                <div class="col-md-5 col-4 d-flex align-items-center justify-content-center">${ i.createDate }</div>
                
	            </div>
                
	            
	            <div class="row row-bordered g-0">
	                <div class="col-md-6 contents" style="padding-right: 0px;">
                        <div>
                            ${i.newsContent}
                        </div>
                    </div>

	                <div class="col-md-6" style="padding: 40px;">
	                    
	                    <div class="reply re${i.newsNo}">

                            <c:forEach var="j" items="${allList[status.count - 1]}" varStatus="loop">
                                <div style="display: flex;">
                                    <img alt="" src="${pageContext.request.contextPath}/resources/image/laoh.jpg" class="reImg">
                                    <div class="rediv">
                                        <span class="reWriter">${ j.commentWriter }</span>
                                        <span class="reDate">${ j.commentDate }</span>
                                        <br>
                                        <span class="reComment">
                                            ${ j.commentContent }
                                        </span>
                                    </div>
                                </div>
                                <br>
                                
                            </c:forEach>
	                    	
	                    </div>
	                    <div class="inputreply">
	                        <img src="${loginUser.profile}" alt="">
	                        <input type="text" class="form-control inputtext"  placeholder="댓글 작성" aria-describedby="defaultFormControlHelp">
                            <input type="hidden" name="userNo" class="userNo" value="${loginUser.userNo}">
	                        <button type="button" class="${i.newsNo} btn btn-primary ">
                                <span class="tf-icons bx bx-subdirectory-left"></span>
                            </button>
	                    </div>
	                </div>
	
	            </div>
	        </div>
		</c:forEach>
      
       
            
    </div>
    
    <div id="observer" class="card" style="visibility: hidden;">더보기</div>



    <!-- 자바스크립트 영역-->
    <!-- 프로필 이미지 때문에 js 파일안씀-->

    <script>
        $(function(){

            //위로가기 버튼
            $(".rounded-pill").click(function(){
                
                var location = document.querySelector("body").offsetTop;
                window.scrollTo({top: location, behavior: 'smooth'});

            })


            let page = 1;

            // active 설정
            $(".active").removeClass("active");
            $(".news").addClass("active")

            //작성버튼시 이동 url
            $(document).on("click","#enroll",function(){
                location.href="newsEnrollForm.p";

            })

            // 무한 스크롤
            const $observer = document.getElementById('observer');
            
            const io = new IntersectionObserver((entries) => {
                
            if (entries[0].isIntersecting) {
            
            page+=1;
            
            $.ajax({
                url:"ajaxNewsList.p",
                data: {"page":page},
                success:function(data){
                    if(data.length == 0){
                        page-=1;
                    }
                    let value = "";
    
                    let list = "";
                    for(let i in data){
                        list += data[i].newsNo +" "
                    }
                    
    
                    $.ajax({
                        url:"ajaxNewsReplyList.p",
                        data:{list:list.trim()},
                        success:function(data1){
                            
                            $.each(data, function(index, item) {
                                console.log("--------"+index);
                                console.log(data1[index].length)
                                value+="<div class=\"card mb-5 ct\">" +
                                "<div class=\"firstrow\" style=\"display: flex;\">" +
                                    "<div class=\"col-md-2 col-4 profile1\" style=\"display: flex;\">" +
                                        "<img src=\"" + item.profile + "\" alt=\"프로필\" class=\"profile rounded-circle\">" +
                                        "<span class=\"username d-flex align-items-center justify-content-center\">" + item.userNo + "</span>" +
                                    "</div>" +
                                    "<div class=\"col-md-5 col-4 d-flex align-items-center justify-content-center title\">" + item.newsTitle + "</div>" +
                                    "<div class=\"col-md-5 col-4 d-flex align-items-center justify-content-center\">" + item.createDate + "</div>" +
                                "</div>" +
                                "<div class=\"row row-bordered g-0\">" +
                                    "<div class=\"col-md-6 contents\" style=\"padding-right: 0px;\">" +
                                        "<div>" + item.newsContent + "</div>" +
                                    "</div>" +
                                    "<div class=\"col-md-6\" style=\"padding: 40px;\">" +
                                        "<div class=\"reply re" + item.newsNo + "\">";
                                            if(data1[index].length != 0){
            
                                                for(let j in data1[index]){
                                                    value += "<div style=\"display: flex;\">" +
                                                            "<img alt=\"\" src=\"" + data1[index][j].profile + "/resources/image/laoh.jpg\" class=\"reImg\">" +
                                                            "<div class=\"rediv\">" +
                                                                "<span class=\"reWriter\">" + data1[index][j].commentWriter + "</span>" +
                                                                "<span class=\"reDate\">" + data1[index][j].commentDate + "</span>" +
                                                                "<br>" +
                                                                "<span class=\"reComment\">" + data1[index][j].commentContent + "</span>" +
                                                            "</div>" +
                                                        "</div>" +
                                                        "<br>";
            
                                                }
                                            }
                                        
                                       value+= "</div>" +
                                        "<div class=\"inputreply\">" +
                                            "<img src=\"${loginUser.profile}\" alt=\"\">" +
                                            "<input type=\"text\" class=\"form-control inputtext\"  placeholder=\"댓글 작성\" aria-describedby=\"defaultFormControlHelp\">" +
                                            "<input type='hidden' name='userNo' class='userNo' value='${loginUser}.userNo'>" +
                                            "<button type=\"button\" class=\"" + item.newsNo + " btn btn-primary \">"+
                                                "<span class=\"tf-icons bx bx-subdirectory-left\"></span>"
                                                +" </button>" +
                                        "</div>" +
                                    "</div>" +
                                "</div>" +
                            "</div>";
            
                            });
                            $(".cpadding").html($(".cpadding").html()+value);
                            
                        }, error:function(){
    
                        }
                    })
    
                }, error:function(){
                    console.log("ajax 오류 발생")
                }
            })
    
            }
            });
            io.observe($observer);
    
            $(document).on("keyup",".inputtext",function(event){
            if(event.which == 13){
               ($(this).siblings(".btn"))
                $(this).siblings(".btn").click();
            }
        })

        })
  </script>

  <script>
    $(function(){
        // 제출 버튼에 이벤트 할당 및 버튼클릭시 
        // 댓글 insert > 해당 글에 대한 모든 댓글 불러오기 > 스크롤 맨 아래로 내리기
        $(document).on("click",".inputreply button",function(){
            let no = $(this)[0].classList[0];
            let userNo = '${loginUser.userNo}';
            let value = $(this).siblings(".inputtext").val();

            console.log("zzzzzzzzzzzzzz")
            let replyNode = $(this).parent(".inputreply").siblings(".reply");
            console.log(replyNode);

            let height = replyNode[0].scrollHeight;
            console.log(height);
            

            let $input = $(this).siblings(".inputtext");

            let reply = $(".re"+no); 
        
            $.ajax({
                url:"nrinsert.p",
                data:{
                    newsNo:no,
                    commentWriter:userNo,
                    commentContent:value
                },
                success:function(data){
                    $input.val("");

                    let val = "";

                    for(let i in data){
                        val += "<div style=\"display: flex;\">" +
                                "<img alt=\"\" src=\"" + data[i].profile + "/resources/image/laoh.jpg\" class=\"reImg\">" +
                                "<div class=\"rediv\">" +
                                    "<span class=\"reWriter\">" + data[i].commentWriter + "</span>" +
                                    "<span class=\"reDate\">" + data[i].commentDate + "</span>" +
                                    "<br>" +
                                    "<span class=\"reComment\">" + data[i].commentContent + "</span>" +
                                "</div>" +
                            "</div>" +
                            "<br>";
                    }
                    //console.log(val);
                    reply.html(val);

                    replyNode.scrollTop(height);

                }, error:function(){
                    console.log("ajax 오류")
                }
            })
        
        })
        
    })
  </script>

</body>
</html>
