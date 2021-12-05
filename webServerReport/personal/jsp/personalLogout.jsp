<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<link rel="stylesheet" href="../css/personalStyle.css"/>
		<title>PERSONAL PROJECT</title>
		<jsp:useBean id="dto" class="personal.personalDTO" scope="session"/>
		<jsp:useBean id="dao" class="personal.personalDAO"/>
	</head>
	<body>
		<%
			if(dto.isLoginStat()) {
				dto.setUserId(null);
				dto.setUserPasswd(null);
				dto.setLoginStat(false);
		%>
			<script>location.href="../html/personalLogin.html";</script>
		<%
			}
			else {
		%>
			<script>alert("로그인 되지 않음"); location.href="../html/personalLogin.html";</script>
		<%
			}
		%>
	</body>
</html>
