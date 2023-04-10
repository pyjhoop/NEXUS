$(function(){

    $("#enroll").click(function(){
        location.href="newsEnrollForm.p";
    })
    
    $(".active").removeClass("active");
    $(".news").addClass("active")


    // 무한 스크롤
    // let timer;
    // let page = 1;
    // const $observer = document.getElementById('observer');
    // const io = new IntersectionObserver((entries) => {
    //     clearTimeout(timer);
    //     if (entries[0].isIntersecting) {
    //     //timer = setTimeout(() => makeListElement(), 1000);
    //     //let page = Number($("#page").val())+1;
    //     page+=1;
    //     //console.log(page);
    //     $.ajax({
    //         url:"ajaxNewsList.p",
    //         data: {"page":page},
    //         success:function(data){
    //             if(data.length == 0){
    //                 page-=1;
    //             }
    //             let value = "";
    //             let val = "";
    //             $.each(data, function(index, item) {
    //                 value+="<div class=\"card mb-5 ct\">" +
    //                 "<div class=\"firstrow\" style=\"display: flex;\">" +
    //                     "<div class=\"col-md-2 col-4 profile1\" style=\"display: flex;\">" +
    //                         "<img src=\"" + item.profile + "\" alt=\"프로필\" class=\"profile rounded-circle\">" +
    //                         "<span class=\"username d-flex align-items-center justify-content-center\">" + item.userNo + "</span>" +
    //                     "</div>" +
    //                     "<div class=\"col-md-5 col-4 d-flex align-items-center justify-content-center title\">" + item.newsTitle + "</div>" +
    //                     "<div class=\"col-md-5 col-4 d-flex align-items-center justify-content-center\">" + item.createDate + "</div>" +
    //                 "</div>" +
    //                 "<div class=\"row row-bordered g-0\">" +
    //                     "<div class=\"col-md-6 contents\" style=\"padding-right: 0px;\">" +
    //                         "<div>" + item.newsContent + "</div>" +
    //                     "</div>" +
    //                     "<div class=\"col-md-6\" style=\"padding: 40px;\">" +
    //                         "<div class=\"reply re" + item.newsNo + "\">" +
                                
    //                         "</div>" +
    //                         "<div class=\"inputreply\">" +
    //                             "<img src=\""+"${loginUser.profile}"+"\" alt=\"\">" +
    //                             "<input type=\"text\" class=\"form-control\" id=\"inputtext\" placeholder=\"댓글 작성\" aria-describedby=\"defaultFormControlHelp\">" +
    //                             "<input type=\"hidden\" name=\"userNo\" id=\"userNo\" value=\"" + "${loginUser}.userNo" + "\">" +
    //                             "<button type=\"button\" class=\"" + item.newsNo + " btn btn-primary \">submit</button>" +
    //                         "</div>" +
    //                     "</div>" +
    //                 "</div>" +
    //             "</div>";

    //             });

    //             $(".cpadding").html($(".cpadding").html()+value);
               

    //             let list = "";
    //             for(let i in data){
    //                 list += data[i].newsNo +" "
    //             }

    //             $.ajax({
    //                 url:"ajaxNewsReplyList.p",
    //                 data:{list:list.trim()},
    //                 success:function(data1){
    //                     console.log(data1)
    //                 }, error:function(){

    //                 }
    //             })
                
    //         }, error:function(){
    //             console.log("ajax 오류 발생")
    //         }
    //     })
        
        
    //     }
    // });
    // io.observe($observer);

    // 댓글 등록시 ajax 처리
    $(".inputreply button").click(function(){
       // newNo
        let no = $(this)[0].classList[0];
        //console.log(no)
        //console.log($(this).siblings("#userNo").val())
        let userNo = $(this).siblings("#userNo").val();
        let value = $(this).siblings("#inputtext").val();

        let $input = $(this).siblings("#inputtext");

        let reply = $(".re"+no);
        //console.log(reply)

        
        if($(this).siblings("#inputtext").val().trim().length != 0){
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
                    console.log(val);
                    reply.html(val);



                }, error:function(){

                }
            })
        }
    })

    //엔터시 댓글 입력하기
    // $("body").on("keyup","#inputtext",function(event){
    //     if(event.which == 13){
    //         console.log($(this).siblings(".btn"))
    //         $(this).siblings(".btn").click();
    //     }
    // })
   
    
//     $(".inputreply").on("click","button", function(event){
//         console.log($(this));
//         let no = $(this)[0].classList[0];
//         //console.log(no)
//         //console.log($(this).siblings("#userNo").val())
//         let userNo = $(this).siblings("#userNo").val();
//         let value = $(this).siblings("#inputtext").val();

//         let $input = $(this).siblings("#inputtext");

//         let reply = $(".re"+no);
//         //console.log(reply)

        
//         if($(this).siblings("#inputtext").val().trim().length != 0){
//             $.ajax({
//                 url:"nrinsert.p",
//                 data:{
//                     newsNo:no,
//                     commentWriter:userNo,
//                     commentContent:value
//                 },
//                 success:function(data){
//                     $input.val("");

//                     let val = "";

//                     for(let i in data){
//                         val += "<div style=\"display: flex;\">" +
//                                 "<img alt=\"\" src=\"" + data[i].profile + "/resources/image/laoh.jpg\" class=\"reImg\">" +
//                                 "<div class=\"rediv\">" +
//                                     "<span class=\"reWriter\">" + data[i].commentWriter + "</span>" +
//                                     "<span class=\"reDate\">" + data[i].commentDate + "</span>" +
//                                     "<br>" +
//                                     "<span class=\"reComment\">" + data[i].commentContent + "</span>" +
//                                 "</div>" +
//                             "</div>" +
//                             "<br>";
//                     }
//                     console.log(val);
//                     reply.html(val);



//                 }, error:function(){

//                 }
//     })


// }
// })
})
