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
  			if(dto.isLoginStat() != true) {
  		%>
  		<script>alert("접근 실패"); location.href="../html/personalLogin.html";</script>
  		<%
  			}
  		
			int rec_no = dao.removeUser(dto.getUserId());
			if(rec_no > 0) {
		%>
			<script>alert("회원탈퇴 성공"); location.href="../html/personalLogin.html";</script>
		<% } else { %>
			<script>alert("회원탈퇴 실패"); location.href="../html/personalLogin.html";</script>
		<% } %>
		
	</body>
</html>