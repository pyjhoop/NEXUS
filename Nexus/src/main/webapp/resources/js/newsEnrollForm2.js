
var editor;
$(function(){

   editor = new toastui.Editor({
    el: document.querySelector('#editor'),
    height: '600px',
    initialEditType: 'markdown',
    initialValue: '# Hello, World!',
    previewStyle: 'vertical',
    toolbarItems:[
    ['heading', 'bold', 'italic', 'strike'],
    ['hr', 'quote'],
    ['ul', 'ol', 'task'],
    ['image'],
    ['scrollSync'],
    ],
    hooks:{
      addImageBlobHook:(blob, callback) => {
        const formData = new FormData();
        formData.append('images',blob);
        
        fetch('insert.n', {
              method: 'POST',
              body: formData,
            })
              .then((response) => response.json())
              .then((data) => {
                console.log(data.url);
                callback(data.url, '사진 대체 텍스트 입력');
              })
              .catch((error) => {
                callback('image_load_fail', '사진 대체 텍스트 입력');
              });
          }
    
      }
    
});

editor.removeToolbarItem("Code",false);
var markdownValue = editor.getMarkdown();	
console.log(markdownValue); // Output: "# Hello, World!"

// 에디터 내용 가져오기
$("#btn1").click(function(){
    console.log(editor.getMarkdown());
    console.log(editor.getHTML());
    viewer.setMarkdown(editor.getMarkdown())
})
})


function test(){
  $("#newsContent").val(editor.getHTML());
  console.log($("#newsContent").val());
  return true;
}