$(function(){
    $(".news").addClass("active");

    $(".rounded-pill").click(function(){
                
        var location = document.querySelector("body").offsetTop;
        window.scrollTo({top: location, behavior: 'smooth'});

    })

    $(".bxs-heart-circle").click(function(){
        console.log($(".text-primary"))
        if($(".zzimWrap .text-primary").length ==0){
            like();
            $(this).addClass("text-primary")
        }else{
            unlike();
            $(this).removeClass("text-primary")
        }
    })



    $(".btnSubmit").click(function(){
        let consize = $("#reply").val().trim().length;

        if(consize>0){

            $.ajax({
                url:"nrinsert.p",
                data:{
                    newsNo:$(".newsNo").val(),
                    commentWriter:$(".commentWriter").val(),
                    commentContent:$("#reply").val()
                },
                success:function(data){
                    console.log(data);
                    insertReply(data);
                }, error:function(){
                    console.log("ajax 데이터 통신 실패")
                }
            })
            
        }else{

        }

    })


    $("#reply").keyup(function(e){

        if (e.which === 13 && !e.shiftKey) {
            $(".btnSubmit").click();
    
    }
    })

    $("#reply").bind('keypress', function(event) {
        if( event.which === 13 && event.shiftKey ) {
            let text = $("#reply");
            text.val(text.val()+'\n');
        }
    });

})



// 뉴스 좋아요 클릭시 실행되는 함수
function like(){
    let newsNo1 = $(".newsNo").val();
    let userNo1 = $(".commentWriter").val();

    $.ajax({
        url:"newsLike",
        data:{
            newsNo:newsNo1,
            userNo:userNo1
        },
        success:function(data){
            console.log(data)
            console.log("좋아요")
            $(".likeCount").text(data);
        }, error:function(){
            console.log("ajax 통신 오류");
        }
    })
}

// 뉴스 싫어요 클릭시 실행되는 함수
function unlike(){
    let newsNo1 = $(".newsNo").val();
    let userNo1 = $(".commentWriter").val();

    $.ajax({
        url:"newsUnlike",
        data:{
            newsNo:newsNo1,
            userNo:userNo1
        },
        success:function(data){
            console.log("실어요")
            console.log(data)
            $(".likeCount").text(data);
        }, error:function(){
            console.log("ajax 통신 오류");
        }
    })
}

// 댓글 작성시 싨행되는 함수
function insertReply(data){

    let value = "";
    $("#replyWrap1").empty();
    for(let i in data){
        value += '<div class="replyProfile">' 
              + '  <img src="' + data[i].profile + '" alt="Commenter Profile">'
              + '  <div class="time">' 
              + '    <span class="writer">' + data[i].commentWriter + '</span>' 
              + '    <span>' + data[i].commentDate + '</span>' 
              + '  </div>' 
              + '</div>' 
              + '<div class="replyContent">' 
              + data[i].commentContent 
              +'</div>' 
              +'<hr>';
    }

    let size = data.length;

    $("#replyWrap1").html(value);
    $("#replyCount>span").text(size);
    $("#reply").val("");
}