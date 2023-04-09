$(function(){
    
    $(".active").removeClass("active");
    $(".news").addClass("active")
    let timer;
    let page = 1;
    const $observer = document.getElementById('observer');
    const io = new IntersectionObserver((entries) => {
        clearTimeout(timer);
        if (entries[0].isIntersecting) {
        //timer = setTimeout(() => makeListElement(), 1000);
        //let page = Number($("#page").val())+1;
        page+=1;
        console.log(page);
        $.ajax({
            url:"ajaxNewsList.p",
            data: {"page":page},
            success:function(data){
                if(data.length == 0){
                    page-=1;
                }
    
                $.each(data, function(index, item) {
                    // Create a new card element
                    var card = $('<div>').addClass('card mb-5');
                    
                    // Add the first row to the card
                    var firstRow = $('<div>').addClass('firstrow').css('display', 'flex');
                    var profile = $('<div>').addClass('col-md-2 col-4 profile1').css('display', 'flex');
                    profile.append($('<img>').attr('src', item.profile).addClass('profile rounded-circle'));
                    profile.append($('<span>').addClass('username d-flex align-items-center justify-content-center').text(item.userNo));
                    firstRow.append(profile);
                    firstRow.append($('<div>').addClass('col-md-5 col-4 d-flex align-items-center justify-content-center title').text(item.newsTitle));
                    firstRow.append($('<div>').addClass('col-md-5 col-4 d-flex align-items-center justify-content-center').text(item.createDate));
                    card.append(firstRow);
                    
                    // Add the second row to the card
                    var secondRow = $('<div>').addClass('row');
                    secondRow.append($('<div>').addClass('col-md-6 imgp').css('padding-right', '0px').append($('<img>').attr('src', item.image).addClass('imgplace')));
                    var contentsCol = $('<div>').addClass('col-md-6').css('padding', '40px');
                    contentsCol.append($('<div>').addClass('contents').html(item.newsContent));
                    contentsCol.append($('<div>').addClass('reply').text('여기는 댓글 자리입니다.'));
                    var inputReply = $('<div>').addClass('inputreply');
                    inputReply.append($('<img>').attr('src', item.profile).addClass('rounded-circle'));
                    inputReply.append($('<input>').addClass('form-control').attr('id', 'inputtext').attr('placeholder', '댓글 작성'));
                    inputReply.append($('<button>').addClass('btn btn-primary').attr('type', 'button').text('Primary'));
                    contentsCol.append(inputReply);
                    secondRow.append(contentsCol);
                    card.append(secondRow);
                    
                    // Append the card to the target div
                    $('.list').append(card);
                    });
                
                console.log(data);
            }, error:function(){
                console.log("ajax 오류 발생")
            }
        })
        
        
        }
    });
    io.observe($observer);

})
