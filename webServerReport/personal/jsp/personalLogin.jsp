<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<script>
			function fnError() {
				alert("내용을 모두 입력하세요");
				history.back();
			}
		</script>
		<link rel="stylesheet" href="../css/personalStyle.css"/>
		<title>PERSONAL PROJECT</title>
		<jsp:useBean id="dto" class="personal.personalDTO" scope="session"/>
		<jsp:setProperty name="dto" property="*"/>
		<jsp:useBean id="dao" class="personal.personalDAO"/>
	</head>
	<body>
		<%
			if(dto.getUserId() == null || dto.getUserPasswd() == null ||
				dto.getUserId().trim().equals("") || dto.getUserPasswd().trim().equals("")) {
		%>
			<section><script>fnError();</script></section>
		<%
				return;
			}
			
			boolean existId = dao.checkId(dto.getUserId());
			boolean existPwd = dao.checkPwd(dto.getUserId(), dto.getUserPasswd());
			if(existId == true && existPwd == true) {
				dto.setLoginStat(true);
		%>
			<script>location.href="../jsp/personalChat.jsp";</script>
		<% } else { %>
			<script>alert("로그인 실패"); location.href="../html/personalLogin.html";</script>
		<% } %>
	</body>
</html>
