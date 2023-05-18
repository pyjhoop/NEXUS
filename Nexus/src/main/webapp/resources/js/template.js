$(function(){
    
    $("#hotNews").click(function(){
        var newsNo1 = $("#newsNo");
        location.href="newsDetail.p?nNo="+newsNo1.val();
    })

    $("#tokenSubmit").click(function(){
        var token = $("#gitToken").val();
        $.ajax({
            url:"enrollToken",
            data:{token:token},
            type:"POST",
            success:function(data){
               
                alertify.alert(data);
                location.href="repository.p";

            }, error:function(){
                alertify.alert("등록중에 에러가 발생했습니다. 다시 등록해주세요");
            }
        })
    })

    var $hotNews = $("#hotNews");
    $.ajax({
        url:"selectHotNews",
        type:"GET",
        success:function(data){
            console.log(data);
            var newsNo = $("#newsNo");
            newsNo.val(data.newsNo);
            $hotNews.html(data.newsTitle);

        },error: function(){
            console.log("ajax 통신 에러")
        }
    })

    

    setInterval(() =>{
        $.ajax({
            url:"selectHotNews",
            type:"GET",
            success:function(data){
                console.log(data);
                var newsNo = $("#newsNo");
                newsNo.val(data.newsNo);
                $hotNews.html(data.newsTitle);

            },error: function(){
                console.log("ajax 통신 에러")
            }
        })
    }, 5000)
})