$(function(){
    $(".rounded-pill").click(function(){
                
        var location = document.querySelector("body").offsetTop;
        window.scrollTo({top: location, behavior: 'smooth'});

    })
})