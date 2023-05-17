function handleAjaxSuccess(data) {
  var tableBody = $("#issueTableBody");

  for (var i = 0; i < data.length; i++) {
    var item = data[i];

    var row = $("<tr></tr>");

    var number = $("<td></td>").text(item.number);
    row.append(number);

    var titleColumn = $("<td></td>").attr("colspan", "3").css("width", "26%");
    var anchorElement = $("<a></a>")
      .attr("href", "issueDetail.mini?ino=" + item.number)
      .addClass("textA");
    var iconElement = $("<i></i>").addClass(
      "fab fa-angular fa-lg text-danger me-3"
    );
    var strongElement = $("<strong></strong>").text(item.title);
    anchorElement.append(iconElement, strongElement);
    titleColumn.append(anchorElement);
    row.append(titleColumn);

    var createAt = $("<td></td>").text(item.createdAt);
    row.append(createAt);

    var labelsColumn = $("<td></td>").css("width", "28%");
    $.each(item.labels, function (index, label) {
      var badge = $("<span></span>").addClass("badge rounded-pill");

      if (label === "bug") {
        badge.addClass("bg-label-danger");
      } else if (label === "enhancement") {
        badge.addClass("bg-label-info");
      } else if (label === "duplicate") {
        badge.addClass("bg-label-dark");
      } else if (label === "documentation") {
        badge.addClass("bg-label-primary");
      } else if (label === "invalid") {
        badge.addClass("bg-label-warning");
      } else if (label === "help wanted") {
        badge.addClass("bg-label-success");
      } else {
        badge.addClass("bg-label-secondary");
      }

      badge.text(label);
      labelsColumn.append(badge);
    });
    row.append(labelsColumn);

    var userColumn = $("<td></td>").css("width", "10%");
    var userAvatar = $("<ul></ul>").addClass(
      "list-unstyled users-list m-0 avatar-group d-flex align-items-center"
    );
    var userAvatarItem = $("<li></li>")
      .addClass("avatar avatar-xs pull-up")
      .attr("data-bs-toggle", "tooltip")
      .attr("data-popup", "tooltip-custom")
      .attr("data-bs-placement", "top")
      .attr("title", item.user);
    var userAvatarImage = $("<img>")
      .attr("src", item.profile)
      .attr("alt", "")
      .addClass("rounded-circle");
    userAvatarItem.append(userAvatarImage);
    userAvatar.append(userAvatarItem);
    userColumn.append(userAvatar);
    row.append(userColumn);

    var assigneesColumn = $("<td></td>").css("width", "13%");
    var assigneesList = $("<ul></ul>").addClass(
      "list-unstyled users-list m-0 avatar-group d-flex align-items-center"
    );
    $.each(item.assignees, function (index, assignee) {
      var assigneeItem = $("<li></li>")
        .addClass("avatar avatar-xs pull-up")
        .attr("data-bs-toggle", "tooltip")
        .attr("data-popup", "tooltip-custom")
        .attr("data-bs-placement", "top")
        .attr("title", assignee);
      var assigneeImage = $("<img>")
        .attr("src", item.assigneeProfiles[index])
        .attr("alt", "")
        .addClass("rounded-circle");
      assigneeItem.append(assigneeImage);
      assigneesList.append(assigneeItem);
    });
    assigneesColumn.append(assigneesList);
    row.append(assigneesColumn);

    var milestoneColumn = $("<td></td>").css("width", "10%");
    var milestoneContent = $("<div></div>").addClass("dropdown");
    var milestoneText = $("<span></span>").text(item.milestone);
    var milestoneButton = $("<button></button>")
      .addClass("btn p-0 dropdown-toggle hide-arrow")
      .attr("type", "button")
      .attr("data-bs-toggle", "dropdown");
    var milestoneIcon = $("<i></i>").addClass("bx bx-dots-vertical-rounded");
    var milestoneMenu = $("<div></div>").addClass("dropdown-menu");
    var moveMenuItem = $("<a></a>")
      .addClass("dropdown-item")
      .attr("href", "javascript:void(0)")
      .html('<i class="bx bx-send me-1"></i> 이동');
    var deleteMenuItem = $("<a></a>")
      .addClass("dropdown-item")
      .attr("href", "javascript:void(0)")
      .html('<i class="bx bx-trash me-1"></i> 삭제');

    // Check if milestone is empty and add the 'invisible' class
    if (!item.milestone) {
      milestoneContent.addClass("invisible");
    }

    milestoneContent.append(
      milestoneText,
      milestoneButton.append(milestoneIcon),
      milestoneMenu.append(moveMenuItem, deleteMenuItem)
    );
    milestoneColumn.append(milestoneContent);
    row.append(milestoneColumn);

    tableBody.append(row);
    // 데이터 처리 로직
  }
}
