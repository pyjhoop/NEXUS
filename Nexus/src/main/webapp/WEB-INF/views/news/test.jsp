<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.css" />
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/turndown/7.1.2/turndown.js" integrity="sha512-vs+sfpOrzS4lF58OlkJP4vJSeUPKQFbhEeVA4wycLrlwThE+oKkbIWxi40ADv3UdmLLrRnfgTL3mGDLT+nih6Q==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
 	<div class="viewer1"></div>

	<div class="t"></div>
 	
	
	
	<script>
	
		const turndownService = new TurndownService();
		
		const m = "${value}"
		console.log(m);

		$(".t").html(m)
		const markdown = turndownService.turndown(m);
		console.log(markdown)

		
	
		const Viewer = toastui.Editor;
		const viewer = new Viewer({
			  el: document.querySelector('.viewer1'),
			  height: '600px',
			  initialValue: '# hello'
			});
		viewer.setMarkdown(markdown)
		
		
	</script>
	
</body>
</html>