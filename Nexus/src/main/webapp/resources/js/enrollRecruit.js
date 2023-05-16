
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
    let $content = $("#summernote").val();

    let checkcontent = $content.trim();

    let imgSrc = $(checkcontent).find('img').attr('src');
    console.log(imgSrc)
    $("#thumbnail").val(imgSrc);
   
}


// $(function)

$(function(){
    $('#summernote').summernote({
        
        minHeight: null,
        maxHeight: null,
       
        lang: "ko-KR",
        toolbar: [
            // [groupName, [list of button]]
            ['style', ['style']],
            ['style', ['bold', 'italic', 'underline']],
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['insert', ['link', 'picture', 'video','hr']],
            ['height', ['height']],
            ['view', ['fullscreen', 'codeview', 'help','undo','redo']]
        ],
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
		fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
        callbacks: {
          onImageUpload : function(files){
            sendFile(files[0],this);
          }
        }
     });



})

