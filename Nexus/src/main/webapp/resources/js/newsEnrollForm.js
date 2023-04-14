
// function

// 이미지 업로드하는 메서드


function sendFile(file, editor){
    const formData = new FormData();
    formData.append('images',file);
        
    fetch('insert.n', {
        method: 'POST',
        body: formData,
    })
    .then((response) => response.json())
    .then((data) => {

        $(editor).summernote('insertImage', data.url)
        
    })
    .catch((error) => {
        $(editor).summernote('inserterrorImage', data.url)
    });
}

// 제출버튼 클릭시 title, newsContent가 잘있는지 확인하는 메서드

function confirm(){
    let $title = $("#newsTitle").val().trim();
    let $content = $("#newsContent").val();

    let checkcontent = $content.trim();

    let imgSrc = $(checkcontent).find('img').attr('src');
    console.log(imgSrc)
    $("#thumbnail").val(imgSrc);
    
    if($title=="" || checkcontent ==""){
        console.log("타이틀 또는 본문을 입력해주세요");
        return false;
    }else{
        return true;
    }

   
}


// $(function)

$(function(){
    $('#newsContent').summernote({
        height: 700,
        width : 1350,
        minHeight: null,
        maxHeight: null,
        focus: true,
        lang: "ko-KR",
        toolbar: [
            // [groupName, [list of button]]
            ['style', ['bold', 'italic', 'underline']],
            ['font', ['strikethrough', 'superscript', 'subscript']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['insert', ['link', 'picture', 'video','hr']],
            ['height', ['height']],
            ['view', ['fullscreen', 'codeview', 'help']]
        ],
        callbacks: {
          onImageUpload : function(files){
            sendFile(files[0],this);
          }
        }
     });



})

