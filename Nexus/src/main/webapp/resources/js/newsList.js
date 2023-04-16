$(function(){
    //위로가기 버튼
    $(".rounded-pill").click(function(){
                
        var location = document.querySelector("body").offsetTop;
        window.scrollTo({top: location, behavior: 'smooth'});

    })

    //작성버튼시 이동 url
    $(document).on("click","#enroll",function(){
        location.href="newsEnrollForm.p";

    })

     // 무한 스크롤
     const $observer = document.getElementById('observer');
            
     const io = new IntersectionObserver((entries) => {
         let page = 1;
        if (entries[0].isIntersecting) {
            page+=1;
        
        $.ajax({
            url:"ajaxNewsList.p",
            data: {"page":page},
            success:function(data){
                console.log(data);

            }, error:function(){
                console.log("ajax 오류 발생")
            }
        })

        }else{
        }
        });
     io.observe($observer);

})