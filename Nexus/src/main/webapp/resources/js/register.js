$(function(){
    
    // 아이디 정규식 체크 영문자 시작 숫자포함 6~20
    $("#userId").keyup(function(){
        $(".inf").remove();
        const idExp = /^[a-z]+[a-z0-9]{5,19}$/i
        const id = $(this).val();
        var form = {userId : id}
        const userId = $("#userId");
        if(idExp.test(id)){
            $.ajax({
                url: "idCheck.me.p",
                type:"POST",
                data: form,
                success:function(data){
                    if(data == 0){
                        userId.after("<span class='text-primary inf'>사용가능</span>");
                        userId.removeClass('dis')
                        userId.css("border-color","");
                    }else{
                        userId.after("<span class='text-danger inf'>존재하는 아이디 입니다</span>");
                        userId.addClass("dis");
                    }
                },
                error:function(){
                    userId.after("<span class='text-danger inf'>서버가 불안정해 잠시후 다시 시도해주세요</span>");
                    userId.addClass("dis");
                }
            })
        }else{
            userId.after("<span class='text-warning inf'>영문자 시작으로 숫자포함 6~20글자를 입력해주세요</span>")
            userId.addClass("dis");
        }

    })

    // 비밀번호 정규식 체크 영문자 시작 숫자와 
    $("#userPwd").keyup(function(){
        $(".inf1").remove();
        const regEx = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
        const pwd = $(this);
        if(regEx.test(pwd.val())){
            pwd.after("<span class='text-primary inf1'>사용가능</span>")
            pwd.removeClass("dis");
            pwd.css("border-color","");
        }else{
            pwd.after("<span class='text-danger inf1'>영문자와 숫자 특수문자를 조합해 8자 이상 입력해주세요</span>")
            pwd.addClass("dis");
        }
    })

    // 비밀번호 재확인 
    $("#pwdConfirm").focusout(function(){
        $(".inf2").remove();
        const pwdFirm = $(this);
        const pwdRaw = $("#userPwd").val();
        if(pwdRaw != ''){
            if(pwdFirm.val() == pwdRaw){
                pwdFirm.after("<span class='text-primary inf2'>비밀번호가 일치합니다</span>")
                pwdFirm.removeClass("dis")
                pwdFirm.css("border-color","");
            }else if((pwdFirm.val() != pwdRaw )){
                pwdFirm.after("<span class='text-danger inf2'>비밀번호가 일치하지 않습니다</span>")
                pwdFirm.addClass("dis");
            }
        }
    })

    $("#userName").focusout(function(){
        $(".inf5").remove();
        if($(this).val() == ""){
            $(this).parent().after("<span class='text-danger inf5'>이름은 필수입니다.</span>")
            $(this).addClass("dis");
        }else{
            $(this).removeClass("dis")
            $(this).css("border-color","");
        }
    })


})

// 이메일 정규식 체크 및 false일 경우 button 작동 막음
function firm(){
    $(".inf3").remove();
    const regEx = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    const email = $("#email");
    email.addClass("dis")
    email.css("border-color","");
    if(regEx.test(email.val())){
        
        const email = $("#email");
        email.removeClass("dis")

        $.ajax({
            url:"mailCheck?email="+email.val(),
            type:"GET",
            success(data){
                code = data;
            }
        })

        var time = 180;
        var min = "";
        var sec = "";

        var x = setInterval(function(){
            min = parseInt(time/60);
            sec = time%60+'';
            if(sec.length == 1){
                sec = sec+'0';
            }

            $("#timer").text(min+":"+sec);
            time--;
            if(time < 0){
                clearInterval(x);
                $("#timer").text("시간초과");
            }
        },1000)

        const timer = $("#timer");
        const c = $(".c");

        $("#condeFirm").click(function(){
            const inputCode = $("#code");
            inputCode.css("border-color","");
            $(".inf4").text("");
            if(inputCode.val() === code){
                clearInterval(x);
                timer.text("");
                c.after("<span class='text-primary inf4'>코드 인증성공</span>")
                inputCode.removeClass("dis");
            }else{
                c.after("<span class='text-danger inf4'>코드 인증실패</span>")
                inputCode.addClass("dis");
            }
        })

        return true;
    }else{
        email.after("<span class='text-danger inf3'>이메일이 유효하지 않습니다</span>")
        email.addClass("dis");
        return false;
    }

    
}

function final(){
    const dis = $(".dis");
    console.log(dis)
    dis.css("border-color","red");
    console.log($("#terms-conditions").is(":checked"));
    if($("#terms-conditions").is(":checked")){
        if(dis.length == 0){
            return true;
        }else{
            return false;
        }
    }else{
        return false;
    }
}