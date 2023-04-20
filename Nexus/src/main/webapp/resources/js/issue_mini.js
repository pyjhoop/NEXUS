$(function() {
  // Initialize the profile list to be hidden
  $('.profiles-list').hide();
  
  // Function to generate profile li elements based on selected options
  function generateProfiles() {
    // Get the selected options
    var selectedOptions = $('#defaultSelect option:selected');
    
    // Clear the previous selected profile list
    $('.profiles-list ul').empty();
    
    // Add the selected profile li elements
    selectedOptions.each(function() {
      var profileName = $(this).text();
      var profileImgUrl = ''; // Add the profile image URL
      var profileLi = '<li class="avatar avatar-m pull-up" title="' + profileName + '"><img src="' + profileImgUrl + '" alt="" class="rounded-circle" /></li>';
      $('.profiles-list ul').append(profileLi);
    });
  }
  
  // Generate the profile list on select change
  $('#defaultSelect').on('change', function() {
    generateProfiles();
    $('.profiles-list').show();
  });
  
  // Toggle the profile list on label click
  $('label[for="defaultSelect"]').on('click', function() {
    $('.profiles-list').toggle();
  });
  
  $('#create-issue-btn').on('click', function() {
    // TODO: Submit the issue form
  });
});


// ------------------------- 멀티 input





// ---------------------------------------

 /* ------------ 중간에 li 추가하는 거 작동 안됨! ------------ */
      
    
      
      
      $(function() {
    	  $('#defaultSelect').on('change', function() {
    	    // Get the selected options
    	    
    	    console.log("하이");
    	    
    	    var selectedOptions = $('#defaultSelect option:selected');
    	    
    	    // Clear the previous selected profile list
    	    $('.profiles-list ul').empty();
    	    
    	    // Add the selected profile li elements
    	    selectedOptions.each(function() {
    	      var profileName = $(this).text();
    	      var profileImgUrl = ''; // Add the profile image URL
    	      var profileLi = '<li class="avatar avatar-m pull-up" title="이혜민"><img src="../assets/img/avatars/5.png" alt="" class="rounded-circle" /> 이혜민 </li>';
    	      $('.profiles-list ul').append(profileLi);
    	    });
    	    
    	    // Show the profile list
    	    $('.profiles-list').show();
    	  });
    	  
    	  $('#create-issue-btn').on('click', function() {
    	    // TODO: Submit the issue form
    	  });
    	});

  
      $(function() {
    	    $('#defaultSelect').on('click', function() {
    	      $('.form-select').toggleClass('opened');
    	    });
    	  });


// ------------------------------------------

// 수정 + 삭제 버튼 클릭시

function postFormSubmit(num) {
    if (num == 1) { // 수정하기 클릭시
        $("#postForm").attr("action", "issueUpdate.mini").submit();

    } else { // 삭제하기 클릭시
        $("#postForm").attr("action", "issueDelete.mini").submit();
    }
}



