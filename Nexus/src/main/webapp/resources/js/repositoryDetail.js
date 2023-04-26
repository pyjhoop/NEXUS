$(function(){
    //코드에디터 설정
    
    $("#repository").addClass('active');

    $("#repoConsub").click(function(){
        var con = $("#repoContent").val();
        var no = $("#repoNo1").val();

        $.ajax({
            url:"updateRepoContent.p",
            data:{repoNo:no, repoContent:con},
            success:function(data){
                console.log(data);
                $("#close1").click();
                $(".repoCont p").html(data);
            }, error:function(){

            }
        })
    })


    // 초대버튼 클릭시 ajax로 넘기기
    $("#add").click(function(){

        var gitId = $("#gitId").val();
        
        if($.trim(gitId).length > 0){

            $.ajax({
                url:"addRepoMember.p",
                data:{id:$.trim(gitId)},
                success:function(data){
                    console.log(data)
                    if(data == ""){
                        alert("이미 초대한 아이디입니다.")
                    }else{
                        alert("초대완료")
                    }
                    $("#gitId").val("");
                }, error:function(){

                }
            })
        }else{
            alert("아이디를 입력해주세요")
        }

    })

    // 추방버튼 클릭시 ajax로 넘기기
    $("#remove").click(function(){

        var gitId = $("#gitId").val();
        
        if($.trim(gitId).length > 0){
            
            $.ajax({
                url:"removeRepoMember.p",
                data:{id:$.trim(gitId)},
                success:function(data){
                    console.log(data);
                    if(data == 204){
                        alert("추방 완료")
                    }else{
                        alert("아이디가 잚")
                    }

                }, error:function(){

                }
            })

        }
    })

    



    
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
                           + '<span class="clcik1" id="'+obj[i].download_url+'" target="_blank">'+obj[i].name+'</span>'
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
            var path1 = repoPath;

            for(let i in arr){
                if(i==0){
                    value+="<span>"+arr[i]+"</span>"
                }else if(i==1){
                    value+="<span class='origin' id='"+repoPath+"'>"+'/'+arr[i]+"</span>"
                }else if(arr[i]=='contents'){
                }else{
                    path1+="/"+arr[i];
                    value+="<span class='back' id="+path1+">"+'/'+arr[i]+"</span>";
                }

            }
            // console.log("value:"+value)
            totalPath.html(value);
            
            // 객체배열 
            const obj = JSON.parse(data);
            console.log(obj)
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
                           + '<span class="clcik1" id="'+obj[i].download_url+'" target="_blank">'+obj[i].name+'</span>'
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

    function getFileContent(path, name){
        $.ajax({
        url:"ajaxFileContent",
        data:{path:path},
        success:function(data){
            //console.log("성공")
            console.log(data);

            // $("#batch_content").empty();
            $(".CodeMirror").remove();

            var ex = "";

            var num = true;

            switch(name){
                case 'java': ex='text/x-java'; break;
                case 'sql': ex = 'text/x-sql'; break;
                case 'md': ex='text/x-markdown'; num=false; break;
                case 'css': ex = "css"; break;
                case 'js' : ex = 'javascript'; break;
                case 'jsp' : ex='text/html'; break;
                case 'xml' : ex='text/xml'; break;
            }

            $("#lmodal").click(); // 모달 띄움


            var textarea = document.getElementById('batch_content');
            // 에디터 설정

            var editor = CodeMirror.fromTextArea(textarea, {
                lineNumbers: num,  //왼쪽 라인넘버 표기
                lineWrapping: true, //줄바꿈. 음.. break-word;
                theme: "darcula",   //테마는 맘에드는 걸로.
                mode: ex, //모드는 sql 모드
                val: 'dsa'
            });

    
            editor.setSize("100%", "700px");

            
            setTimeout(function() {
                
                editor.setValue(data);
              }, 250);

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

    $(document).on("click",".clcik1",function(){
        let path = $(this).attr("id");
        let ex = $(this).text().lastIndexOf(".");

        let name = $(this).text().substr(ex+1);
        console.log(name)
        getFileContent(path, name);

        // 모달 관련
    // $(".clcik1").click(function(){
    //     let url = $(this).attr("id");
    //     console.log(url)
    //     $("#lmodal").click();
    //     $("#exLargeModal").click();
    // })
    })



   
})

