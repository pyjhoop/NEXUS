<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/news.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/newsList.js"></script>
</head>
<body>
	<jsp:include page="../common/template.jsp"/>
    <div class="container-xxl flex-grow-1 container-p-y cpadding">
        <button type="button" class="btn btn-primary" id="enroll">뉴스작성</button>
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
	                        <input type="text" class="form-control" id="inputtext" placeholder="댓글 작성" aria-describedby="defaultFormControlHelp">
                            <input type="hidden" name="userNo" id="userNo" value="${loginUser.userNo}">
	                        <button type="button" class="${i.newsNo} btn btn-primary ">submit</button>
	                    </div>
	                </div>
	
	            </div>
	        </div>
		</c:forEach>
      
       
            
    </div>
    
    <div id="observer" class="card">더보기</div>
    <script>
        let timer;
        let page = 1;
        const $observer = document.getElementById('observer');
        const io = new IntersectionObserver((entries) => {
        clearTimeout(timer);
        if (entries[0].isIntersecting) {
        //timer = setTimeout(() => makeListElement(), 1000);
        //let page = Number($("#page").val())+1;
        page+=1;
        //console.log(page);
        var data2;
        $.ajax({
            url:"ajaxNewsList.p",
            data: {"page":page},
            success:function(data){
                if(data.length == 0){
                    page-=1;
                }
                let value = "";
                let val = "";

                let list = "";
                for(let i in data){
                    list += data[i].newsNo +" "
                }

                $.ajax({
                    url:"ajaxNewsReplyList.p",
                    data:{list:list.trim()},
                    success:function(data1){
                        console.log(data1)
                        data2 = data1;
                        console.log(data2);
                        
                    }, error:function(){

                    }
                })

                $.each(data, function(index, item) {
                    console.log(index)
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
                                
                                    for(let j in data2[0][j]){
                                        value += "<div style=\"display: flex;\">" +
                                                "<img alt=\"\" src=\"" + data2[i].profile + "/resources/image/laoh.jpg\" class=\"reImg\">" +
                                                "<div class=\"rediv\">" +
                                                    "<span class=\"reWriter\">" + data2[i].commentWriter + "</span>" +
                                                    "<span class=\"reDate\">" + data2[i].commentDate + "</span>" +
                                                    "<br>" +
                                                    "<span class=\"reComment\">" + data2[i].commentContent + "</span>" +
                                                "</div>" +
                                            "</div>" +
                                            "<br>";

                                    }
                    
                            
                           value+= "</div>" +
                            "<div class=\"inputreply\">" +
                                "<img src=\"${loginUser.profile}\" alt=\"\">" +
                                "<input type=\"text\" class=\"form-control\" id=\"inputtext\" placeholder=\"댓글 작성\" aria-describedby=\"defaultFormControlHelp\">" +
                                "<input type=\"hidden\" name=\"userNo\" id=\"userNo\" value=\"" + "${loginUser}.userNo" + "\">" +
                                "<button type=\"button\" class=\"" + item.newsNo + " btn btn-primary \">submit</button>" +
                            "</div>" +
                        "</div>" +
                    "</div>" +
                "</div>";

                });

                $(".cpadding").html($(".cpadding").html()+value);
                

                

                
                
            }, error:function(){
                console.log("ajax 오류 발생")
            }
        })

       

       
        
        
        }
        });
        io.observe($observer);

        $("body").on("keyup","#inputtext",function(event){
        if(event.which == 13){
            console.log($(this).siblings(".btn"))
            $(this).siblings(".btn").click();
        }
    })
  </script>

		



</body>
</html>
