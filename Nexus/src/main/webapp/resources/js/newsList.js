$(function(){


    // 무한 스크롤
    const $observer = document.getElementById('observer');
    let page = 1;
           
    const io = new IntersectionObserver((entries) => {
       if (entries[0].isIntersecting) {
           page+=1;
       
       $.ajax({
           url:"ajaxNewsList.p",
           data: {"page":page},
           success:function(data){
               console.log(data);

               insertNews(data);
               if(data.length == 0){
                   page-=1;
               }

           }, error:function(){
               console.log("ajax 오류 발생")
           }
       })

       }else{
       }
       });
    io.observe($observer);

    //rePage클릭시 기본적으로 처음에 12개 긁어오고 무한스크롤도 해야함.
    // session에 상태를 집어넣고 마이바티스에서 조건문을 사용하자


    $(".rePage").click(function(){
        $(".mainContents").empty();
        $(this).siblings().removeClass("text-primary");
        $(this).addClass("text-primary");
       
        page = 1;
        let state = $(this).attr("id");

        $.ajax({
            url:"ajaxRepage.p",
            data:{state:state},
            success:function(data){
                insertNews(data)
            }, error:function(){
                console.log("ajax 통신 실패")
            }
        })
    })

    $(".news").addClass("active");
    
    //위로가기 버튼
    $(".rounded-pill").click(function(){
                
        var location = document.querySelector("body").offsetTop;
        window.scrollTo({top: location, behavior: 'smooth'});

    })

    //작성버튼시 이동 url
    $(document).on("click","#enroll",function(){
        location.href="newsEnrollForm.p";

    })

     

})



function insertNews(data){

    let value = "";


    for(let i in data){
        
        value += '<div class="col-md-4 col-sm-6 col-lg-3 mb-5 cardWrap" onclick="location.href=\'newsDetail.p?nNo='+data[i].newsNo+'\'">'+
        '<div class="card h-100">'
        if(data[i].thumbnail == undefined){
        value +='<img class="card-img-top" src="resources/image/logo3.png" alt="Card image cap">'
        }else{
        value +='<img class="card-img-top" src="'+data[i].thumbnail+'" alt="Card image cap">' }
        value+=
        '<div class="card-body">' +
        '    <h5 class="card-title">'+data[i].newsTitle+'</h5>' +
        '    <p class="card-text'+data[i].newsNo+' card-text1">' 
        

            var htmlString =data[i].newsContent;
            var $html = $(htmlString);
            if($html.find("img").length >0){
                $html.find("img").remove();
                }
            if($html.find("iframe").length>0){
            $html.find("iframe").remove();
            }
            data[i].newsContent = $html.html();
value+=
        // '<scipt>'+
        // '$(".card-text'+data[i].newsNo+'").html('+data[i].newsContent+');' +
        // '</script>'+
        data[i].newsContent+
        '    </p>' +
                data[i].createDate +
        '    <hr>' +
        
        '    <div class="userInfo">' +
        
        '        <div>' +
        '            <!-- 프로필 이미지-->' +
        '            <img  src="'+data[i].profile+' alt="" style="width: 25px; border-radius: 100%;">' +
        '            &nbsp;by <span class="userName">'+data[i].userNo+'</span>' +
        '        </div>' +
        
        '        <div class="heartwrap">' +
        
        '            <i class=\'bx bxs-heart-circle\'></i>' +
        '            <span class="zzim${i.newsNo}">'+data[i].likeCount+'</span>' +
        
        '        </div>' +
        
        '    </div>' +
        '</div>'+
        '</div>'+
        '</div>';


    }
    $(".mainContents").append(value);


}