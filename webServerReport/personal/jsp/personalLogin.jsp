<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<link rel="stylesheet" href="https://whgnlwls.github.io/webServerReport/personal/css/personalStyle.css"/>
		<title>PERSONAL PROJECT</title>
	</head>
	<body>
		입력한 계정 정보<br/>
		아이디 = <%=request.getParameter("userName")%><br/>
		비밀번호 = <%=request.getParameter("userPassword")%>
	</body>
</html>
