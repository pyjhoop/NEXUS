//1. 페이지 로딩 완료시 채팅창을 맨 아래로 내리기.
// 즉시 실행함수. IIFE

$("#selectUser").on("keyup",function(key){
    if(key.keyCode==13) {
        $("#search-btn").trigger('click');
    }
});


$(function() {
    var displayChatting = document.getElementsByClassName("list-unstyled")[0];
   
  
    if (displayChatting != null) {
         displayChatting.scrollTop = displayChatting.scrollHeight;
     }
});



var input = document.getElementById("inputChatting");

input.addEventListener("keyup", function (event) {
  if (event.keyCode === 13) {
    event.preventDefault();
    document.getElementById("send").click();
  }
});


document.getElementById("send").addEventListener("click", sendMessage);


//채팅보내는함수
function sendMessage() {

    //채팅이 입력되는 textarea요소 가져오기.
    const inputChatting = document.getElementById("inputChatting");

    //클라이언트가 채팅내용을 입력하지 않은상태로 보내기 버튼을 누른경우
    if (inputChatting.value.trim().length == 0) {
        
        alert("채팅내용을 입력해주세요..");

        inputChatting.value = ""; // 공백문자 제거해주기.
        inputChatting.focus();
    } else { // 입력이 된경우
        //메세지 입력시 필요한 데이터를 js객체로 생성.
        const chatMessage = {
            "userNo": userNo,
            "userName": userName,
            "roomNo": roomNo,
            "chattingContent": inputChatting.value,
            "profile":profile
        };

      
        //displayChatting.appendChild(myChatting);
    
        // JSON.parse(문자열) : JSON -> JS object로 변환
        // JSON.stringify(객체) : JS Ojbect -> JSON

        // console.log(chatMessage);
         //console.log(JSON.stringify(chatMessage));

        // // chatSocket(웹소켓객체)를 이용하여 메세지 보내기
        // // chatSocket.send(값) : 웹소켓 핸들러로 값을 보냄.

        chatSocket.send(JSON.stringify(chatMessage));

         inputChatting.value = "";
    }

}

// 웹소켓에서  sendMessage라는 함수가 실행되었을때 -> 메세지가 전달되었을때

chatSocket.onmessage = function(e) {
    //debugger;
    // 매개변수 e : 발생한 이벤트에 대한 정보를 담고있는 객체 
    // e.data  : 전달된 메세지 -> message.getPayload() -> (JSON형태) 로

    // 전달받은 메세지를 JS객체로 변환
    const chatMessage = JSON.parse(e.data); // js객체로 변환.
   // console.log(chatMessage.chattingContent.substr(0, 2));
    let myChatting = "";
    if(chatMessage.invite == 'O'){
        myChatting = "<li class='chat-invite'>" +
        chatMessage.userName + 
        "님이 입장하셨습니다." +
        "</li>";
    }else if(chatMessage.invite == 'X'){
        alert('이미 이 채팅방에 존재하는 유저입니다!');
        return;

    }else if(chatMessage.invite == 'Z'){
        myChatting = "<li class='chat-invite'>" +
        chatMessage.userName + 
        "님이 방을 나가셨습니다." +
        "</li>";
        if(chatMessage.userNo == userNo){
            location.href="selectChat.ih";
        }
  
    }else{
    //내가쓴 채팅
    if (chatMessage.userNo == userNo) {
        if(chatMessage.invite == 'F'){
            myChatting += "<li class='media sent'>" +
            "<div class='media-body2'>" +
            "<div class='msg-box'>" +
            "<div>" +
            "<div class='chat-msg-attachments'>";
            if(chatMessage.chattingContent.substr(0, 2) == '파일'){
            myChatting +=   "<div>" +
                            "<a href=" +
                            chatMessage.changeName +
                            " download=" +
                            chatMessage.originName +
                             " >" +
                            chatMessage.originName +
                            "<i class='bx bxs-download'>" +
                            "</i>" +
                            "</a>";  
            }else{
             myChatting += "<div class='chat-attachment'>" +
                            "<img src=" +
                            chatMessage.changeName +
                            " class='chat-img'>" +
                            "<div class='chat-attach-caption'>" +
                            chatMessage.originName +
                            "</div>" +
                            "<a href=" +
                            chatMessage.changeName +
                            " download=" +
                            chatMessage.originName +
                            " class='chat-attach-download'>" +
                            "<i class='bx bxs-download'>" +
                            "</i>" +
                            "</a>";
            }
           
            myChatting +=   "</div>" +
                            "</div>" +
                            "<ul class='chat-msg-info'>" +
                            "<li>" +
                            "<div class='chat-time'>" +
                            "<span>" +
                            chatMessage.today +
                            "</span>" +
                            "</div>" +
                            "</li>" +
                            "</ul>" +
                            "</div>" +
                            "</div>" +
                            "</div>" +
                            "</li>";
        }else{
        
        myChatting = "<li class='media sent'>" +
        "<div class='media-body2'>" +
        "<div class='msg-box'>" +
        "<div>" +
        "<p>" + 
        chatMessage.chattingContent +
        "</p>" +
        "<ul class='chat-msg-info'>" +
        "<li>" +
        "<div class='chat-time'>" +
        "<span>" +
        chatMessage.today +
        "</span>" +
        "</div>" +
        "</li>" +
        "</ul>" +
        "</div>" +
        "</div>" +
        "</div>" +
        "</li>";
        }
    } else {
        if(chatMessage.invite == 'F'){
            myChatting += "<li class='media d-flex received'>" +
            "<div class='avatar'>" +
            "<img src= " +
            chatMessage.profile + 
            " class='w-px-40 h-px-40 rounded-circle'>"+
            "<div id='cnt-name'>" +
            chatMessage.userName + 
            "</div>" +
            "</div>" +
            "<div class='media-body'>" +
            "<div class='msg-box'>" +
            "<div>" +
            "<div class='chat-msg-attachments'>";
            if(chatMessage.chattingContent.substr(0, 2) == '파일'){
                myChatting +=   "<div>" +
                                "<a href=" +
                                chatMessage.changeName +
                                " download=" +
                                chatMessage.originName +
                                 " >" +
                                chatMessage.originName +
                                "<i class='bx bxs-download'>" +
                                "</i>" +
                                "</a>";  
                }else{
                 myChatting += "<div class='chat-attachment'>" +
                                "<img src=" +
                                chatMessage.changeName +
                                " class='chat-img'>" +
                                "<div class='chat-attach-caption'>" +
                                chatMessage.originName +
                                "</div>" +
                                "<a href=" +
                                chatMessage.changeName +
                                " download=" +
                                chatMessage.originName +
                                " class='chat-attach-download'>" +
                                "<i class='bx bxs-download'>" +
                                "</i>" +
                                "</a>";
                }
                myChatting +=     "</div>" +
                                    "</div>" +
                                    "<ul class='chat-msg-info'>" +
                                    "<li>" +
                                    "<div class='chat-time'>" +
                                    "<span>" +
                                    chatMessage.today +
                                    "</span>" +
                                    "</div>" +
                                    "</li>" +
                                    "</ul>" +
                                    "</div>" +
                                    "</div>" +
                                    "</div>" +
                                    "</li>";
        }else{

        myChatting = "<li class='media d-flex received'>" +
        "<div class='avatar'>" +
        "<img src= " +
        chatMessage.profile + 
        " class='w-px-40 h-px-40 rounded-circle'>"+
        "<div id='cnt-name'>" +
        chatMessage.userName + 
        "</div>" +

        "</div>" +
        "<div class='media-body'>" +
        "<div class='msg-box'>" +
        "<div>" +
        "<p>" + 
        chatMessage.chattingContent +
        "</p>" +
        "<ul class='chat-msg-info'>" +
        "<li>" +
        "<div class='chat-time'>" +
        "<span>" +
        chatMessage.today +
        "</span>" +
        "</div>" +
        "</li>" +
        "</ul>" +
        "</div>" +
        "</div>" +
        "</div>" +
        "</li>";
        }
    }
    }
    // 채팅창
    displayChatting = document.getElementsByClassName("chat-body")[0];
     // 채팅창에 채팅 추가
     $('.list-unstyled').append(myChatting);
     //inputChatting.value = "";

    // 채팅창을 제일밑으로 내리기
    $('#room-scroll2').scrollTop($('#room-scroll2').prop('scrollHeight'));
   // displayChatting.scrollTop = displayChatting.scrollHeight;
    // scrollTop : 스크롤 이동
    // scrollHeight : 스크롤이되는 요소의 전체 높이.

};

