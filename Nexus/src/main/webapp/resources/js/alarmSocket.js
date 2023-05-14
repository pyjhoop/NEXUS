function issueWeb() {
  console.log("11111111111111111111111");

  const userNo = "${loginUser.userNo}";
  const userName = "${loginUser.userName}";
  // const issueNumber = "${issueNumber}";
  // const authorName = "${authorName}";
  const profile = "${loginUser.profile}";
  // const contextPath = "${contextPath}";
  const newTitle = "${newTitle}";

  console.log(userNo);
  console.log(userName);
  console.log(profile);
  console.log(newTitle);

  const issueSocket = new SockJS("http://localhost:8010/nexus/issue");

  issueSocket.onopen = function () {
    console.log("onopendf");

    const message = {
      newTitle: newTitle,
      userNo: userNo,
      userName: userName,
      profile: profile,
    };
    issueSocket.send(JSON.stringify(message));

    console.log("aaaaaaaa");
  };
}
