$(function(){
    
    function getContent(path, currPath){
        $.ajax({
        url:"ajaxGetContent",
        data:{path:path},
        success:function(data){

            //totalPath 수정하기
            let cpath = $("#totalPath").text();
            console.log("cpaht : "+cpath.replaceAll(" ",""))

            $("#totalPath").html($("#totalPath").html()+' / <span class="back" id="'+path+'">'+currPath+'</span>');
            
            // 객체배열 
            const obj = JSON.parse(data);
            console.log(obj)
            $(".clear").empty();

            let hiddenpath = $("#hiddenpath");
            hiddenpath.val(hiddenpath.val() + '/'+currPath);

            let value = "";

            for(let i in obj){
                if(obj[i].type == 'dir'){
                    value += '<div>'
                           +  '<img alt="폴더 이미지" src="resources/image/folder.png" width="30px">'
                           + '<span class="folder">'+obj[i].name+'</span>'
                           +"</div><hr>";
                }else{
                    value += '<div>'
                           + '<img alt="파일 이미지" src="resources/image/file.png" width="30px">'
                           + '<a class="clcik1" href="'+obj[i].download_url+'" target="_blank">'+obj[i].name+'</a>'
                           + '</div><hr>';
                }
            }

            $(".clear").html(value);
            
        }, error:function(){
            console.log("실패")
        }
        })
    }


    $(document).on("click",".folder",function(){
        console.log("클릭")

        let hiddenpath = $("#hiddenpath").val();

        let currPath = $(this).text();

        // hiddenpath.val(hiddenpath.val() + '/'+currPath);

        let lastPath = hiddenpath+'/'+currPath;

        console.log(lastPath);

        let path = $("#repoPath").text().replaceAll(" ","")+'/contents/'+lastPath;
        console.log(path);
        getContent(path, currPath);
    })

    $(document).on("click",".back",function(){
        console.log("클릭")
        // 클릭시 

        
        let path = $(this).attr('id').replaceAll("//","/");

        console.log($(this).attr('id').replaceAll("//","/"))

        // // hiddenpath.val(hiddenpath.val() + '/'+currPath);

        // let lastPath = hiddenpath+'/'+currPath;

        // console.log(lastPath);

        // let path = $("#repoPath").text().replaceAll(" ","")+'/contents/'+lastPath;
        // console.log(path);
         getbackContent(path);
    })


   
})

