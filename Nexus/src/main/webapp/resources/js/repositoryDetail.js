$(function(){
    
    function getContent(path, currPath){
        $.ajax({
        url:"ajaxGetContent",
        data:{path:path},
        success:function(data){

            //totalPath 수정하기
            let cpath = $("#totalPath").text();

            $("#totalPath").html($("#totalPath").html()+'/<span class="back" id="'+path+'">'+currPath+'</span>');
            
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
                           + '<div class="row">'
                           + '<div class="col-lg-8">'
                           + '<img alt="파일 이미지" src="resources/image/file.png" width="30px">'
                           + '<a class="clcik1" href="'+obj[i].download_url+'" target="_blank">'+obj[i].name+'</a>'
                           + '</div>'
                           + '<div class="col-lg-4">'
                           + '<span>'+obj[i].size+'</span>'
                           + '</div>'
                           + '</div>'
                           + '</div><hr>';
                }

                if(obj[i].name.indexOf(".md") != -1){
                    getMd(obj[i].download_url);
                }else{
                    $(".mdFile>div").hide();
                }
            }

            $(".clear").html(value);
            
        }, error:function(){
            console.log("실패")
        }
        })
    }

    function getbackContent(path){
        $.ajax({
        url:"ajaxGetContent",
        data:{path:path},
        success:function(data){

            //totalPath 수정하기
            let totalPath = $("#totalPath");
            let arr = path.split("/");
            console.log(arr);

            // pyjhoop/NEXUS를 위해
            let repoPath = $("#repoPath").text()+"/contents";

            value = "";
            for(let i in arr){
                if(i==0){
                    value+="<span>"+arr[i]+"</span>"
                }else if(i==1){
                    value+="<span class='origin' id='"+repoPath+"'>"+'/'+arr[i]+"</span>"
                }else if(arr[i]=='contents'){
                }else{
                    value+="<span class='back' id="+path+">"+'/'+arr[i]+"</span>";
                }

            }
            // console.log("value:"+value)
            totalPath.html(value);
            
            // 객체배열 
            const obj = JSON.parse(data);
            // console.log(obj)
            $(".clear").empty();

            let value1 = "";

            for(let i in obj){
                if(obj[i].type == 'dir'){
                    value1 += '<div>'
                           +  '<img alt="폴더 이미지" src="resources/image/folder.png" width="30px">'
                           + '<span class="folder">'+obj[i].name+'</span>'
                           +"</div><hr>";
                }else{
                    value1 += '<div>'
                           + '<div class="row">'
                           + '<div class="col-lg-8">'
                           + '<img alt="파일 이미지" src="resources/image/file.png" width="30px">'
                           + '<a class="clcik1" href="'+obj[i].download_url+'" target="_blank">'+obj[i].name+'</a>'
                           + '</div>'
                           + '<div class="col-lg-4">'
                           + '<span>'+obj[i].size+'</span>'
                           + '</div>'
                           + '</div>'
                           + '</div><hr>';
                }
                if(obj[i].name.indexOf(".md") != -1){
                    getMd(obj[i].download_url);
                }else{
                    $(".mdFile>div").hide();
                }
            }

            $(".clear").html(value1);
            
        }, error:function(){
            console.log("실패")
        }
        })
    }

    function getMd(url){
        $.ajax({
            url:"getMdFile",
            data:{url:url},
            success:function(data){
                console.log('성공');
                console.log(data);
                $(".mdFile>div").show();
                $(".mdFile>div").html(data);
            }, error:function(){
                console.log("실패");
            }

        })
    }


    $(document).on("click",".folder",function(){
        // console.log("클릭")

        //let hiddenpath = $("#hiddenpath").val();

        let totalPath = $("#totalPath").text();
        let currPath = $(this).text();

        // hiddenpath.val(hiddenpath.val() + '/'+currPath);

        let lastPath = totalPath+'/'+currPath;
        let repoPath = $("#repoPath").text();

        
        
        // console.log(lastPath.replace(repoPath,""));
        let c = lastPath.replace(repoPath,"").replace(" ","");


        // console.log(lastPath);
        // console.log("last:"+lastPath.replace(repoPath,""));
        // console.log("c:"+c)


        let path = repoPath+'/contents'+"/"+c;
        path.replace("//","/");


        // console.log("path:"+path);


        getContent(path, currPath);
    })

    $(document).on("click",".back",function(){
        
        let path = $(this).attr('id').replaceAll("//","/");

        getbackContent(path);
    })

    $(document).on("click",".origin",function(){
        let path = $(this).attr('id');
        getbackContent(path);
    })



   
})

