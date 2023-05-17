
// 수정 + 삭제 버튼 클릭시

function postFormSubmit(num) {
  if (num == 1) {
    // 수정하기 클릭시
    $("#postForm").attr("action", "issueUpdate.mini").submit();
  } else {
    // 삭제하기 클릭시
    $("#postForm").attr("action", "issueDelete.mini").submit();
  }
}



				
				
		
				
				
				
	
				
				
				
				