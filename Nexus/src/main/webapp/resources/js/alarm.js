	    function updateBellIcon() {
												        $(".ringring").addClass("bx-tada");
												        $(".redpoint").removeClass("visually-hidden");
												        setTimeout(() => {
												          $("i.bx-bell").removeClass("bx-tada");
												          
												          $.ajax({
												              type: "POST",
												              url: "removeRingSession",
												              success: function(data) {
												                  console.log("Session invalidated");
												              }
												          });
												          
												          
												          
												        }, 10000);
												        
												        
												      }
												      


											      
 function deleteTie() {
   $('.tie').remove();
    $(".redpoint").addClass("visually-hidden");
    const alermMsg = document.getElementById('alermMsg');
     alermMsg.innerHTML = '새로운 알림이 없습니다';
}
	
	
			

		
	