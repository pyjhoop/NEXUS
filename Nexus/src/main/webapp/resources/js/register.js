$(function(){
    
    // 아이디 정규식 체크 영문자 시작 숫자포함 6~20
    $("#userId").focusout(function(){
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
                    console.log(data)
                    console.log(userId.val())
                    if(data == 0){
                        userId.after("<span class='text-primary inf'>사용가능</span>");
                    }else{
                        userId.after("<span class='text-danger inf'>존재하는 아이디 입니다</span>");
                    }
                },
                error:function(){
                    userId.after("<span class='text-danger inf'>서버가 불안정해 잠시후 다시 시도해주세요</span>");
                }
            })
        }else{
            userId.after("<span class='text-warning inf'>영문자 시작으로 숫자포함 6~20글자를 입력해주세요</span>")
        }

    })

    // 비밀번호 정규식 체크 영문자 시작 숫자와 
    $("#userPwd").focusout(function(){
        $(".inf1").remove();
        const regEx = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
        const pwd = $(this);
        if(regEx.test(pwd.val())){
            pwd.after("<span class='text-primary inf1'>사용가능</span>")
        }else{
            pwd.after("<span class='text-danger inf1'>영문자와 숫자 특수문자를 조합해 8자 이상 입력해주세요</span>")
        }
    })

    // 비밀번호 재확인 
    $("#pwdConfirm").focusout(function(){
        $(".inf2").remove();
        const pwdFirm = $(this);
        const pwdRaw = $("#userPwd").val();
        if(pwdFirm.val() == pwdRaw){
            pwdFirm.after("<span class='text-primary inf2'>비밀번호가 일치합니다</span>")
        }else{
            pwdFirm.after("<span class='text-danger inf2'>비밀번호가 일치하지 않습니다</span>")
        }
    })

})

// 이메일 정규식 체크 및 false일 경우 button 작동 막음
function firm(){
    $(".inf3").remove();
    const regEx = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    const email = $("#email");
    if(regEx.test(email.val())){
        console.log("hi")
        
        const email = $("#email");
        console.log(email.val());

        $.ajax({
            url:"mailCheck?email="+email.val(),
            type:"GET",
            success(data){
                console.log(data);
                code = data;
            }
        })

        $("#code").blur(function(){
            const inputCode = $("#code");
            if(inputCode.val() === code){
                inputCode.after("<span class='text-primary inf4'>코드가 일치합니다.</span>")
            }else{
                inputCode.after("<span class='text-danger inf4'>코드가 일치하지 않습니다.</span>")
            }
        })

        return true;
    }else{
        email.after("<span class='text-danger inf3'>이메일이 유효하지 않습니다</span>")
        return false;
    }
}