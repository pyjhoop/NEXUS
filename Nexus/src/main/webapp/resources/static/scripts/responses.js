function getBotResponse(input) {

	let reply = "";
	
    //rock paper scissors
    if (input == "가위") {
        reply = "보";
    } else if (input == "바위") {
        reply = "가위";
    } else if (input == "가위") {
        reply = "바위";
    

    // Simple responses
    } else if (input == "안녕"|| input == "안녕하세요"|| input == "하이") {
        reply = "안녕하세요";
    } else if (input == "바이"|| input == "안녕히가세요"|| input == "잘가"|| input == "꺼져") {
        reply = "항상 여기 있을게요!";
     
    
    } else if (input.includes("넥서스")  || input.includes("nexus")) {
        reply = "NEXUS는 깃허브 연동을 통해 깃허브에 있는 다양한 정보들을 보여주고 협업하는 사용자들간의 일정관리, 의사소통 그리고 정보전달을 간편하고 명확하게 할 수 있도록 만들어주는 협업 툴입니다.";
    } else if (input.includes("로그인")   || input.includes("login")) {
        reply = "사용자는 로그인을 해야지만 프로그램을 이용할 수 있습니다. 사용자가 로그인 했을 때 자신의 repository와 issues가 보이는 메인 페이지로 이동합니다.";
    } else if (input.includes("회원가입") || input.includes("account")) {
        reply = "프로그램을 이용하기 위해 회원가입을 해야 합니다. 회원가입에는 일반 회원가입, 소셜 회원가입이 있다";
    } else if (input.includes("프로필")  || input.includes("profile")  || input.includes("개인정보")  || input.includes("personal")) {
        reply = "사용자는 마이프로필로 이동해 자신의 정보 조회가 가능합니다. 사용자는 정보조회를 통해 개인정보 수정 및 탈퇴 그리고 보안을 위해 자신의 로그인 기록을 조회 할 수 있고 관리자는 전체 회원정보 조회를 통해 회원정보 수정 또는 탈퇴가 가능합니다.";
    } else if (input.includes("리포지토리") || input.includes("repository")) {
        reply = "깃허브로 로그인한 유저는 repository를 연동해 사용할 수 있습니다. 카카오톡과 일반로그인 사용자들은 깃허브 토큰을 입력해야 repository와 그 세부 기능을 사용할 수 있습니다. 해당 기능들은 repository에서 특정 repository를 선택 했을때만 접근 가능합니다. 선택된 repository 명은 사이드바 상단에서 확인 가능합니다.";
    } else if (input.includes("이슈") || input.includes("issue")) {
        reply = "사용자는 issue를 작성 할 수 있으며 자신이 쓴 issue에 누군가 댓글을 남기면 실시간 알람 및 sns 알람을 받을 수 있고 종모양의 아이콘을 통해 내용을 확인 할 수 있습니다. (sns 알람은 개인정보 조회에서 수신 여부 체크할수있습니다)";
    } else if (input.includes("마일스톤")  || input.includes("milestone")) {
        reply = "milestone 목록을 확인 할 수 있고 각각의 milestone의 진행도를 확인 할 수 있습니다. 개별 milestone을 조회하면 milestone에 속한 이슈들을 조회 할 수 있습니다.";
    } else if (input.includes("캘린더") || input.includes("calendar")) {
        reply = "사용자는 캘린더를 이용해 일정관리를 할 수 있습니다.";
    } else if (input.includes("뉴스") || input.includes("news")) {
        reply = "news를 통해 피드형식으로 팀원들과 소통이 가능합니다";
    } else if (input.includes("친구")  || input.includes("friend")) {
        reply = "친구목록을 통해 친구검색, 추가, 삭제, 차단을 할 수 있습니다.";
    } else if (input.includes("채팅")  || input.includes("chat") || input.includes("메세지") || input.includes("메신저") || input.includes("messenger") || input.includes("message")) {
        reply = "채팅기능을 이용해 현재 협업하고 있는 사람들과 실시간 채팅을 할수있는 그룹채팅과 친구들과 채팅할수 있는 개인채팅 기능을 이용할 수 있습니다.";
    } else if (input.includes("모집")  || input.includes("pr")  || input.includes("recruit")) {
        reply = "협업을 위한 팀원 모집 기능을 통해 프로젝트를 같이할 사람들을 구할 수 있습니다.";
    }

    else {
    	console.log(input);
        reply = "궁금하신 기능의 키워드와 함께 질문을 해보세요!";
    }
    
    var settings = {
	  "url": "chat.bot",
	  "data": {"input": reply}
	};
	
	$.ajax(settings).done(function (response) {
	  console.log(response);
	});
    
    return reply;
}