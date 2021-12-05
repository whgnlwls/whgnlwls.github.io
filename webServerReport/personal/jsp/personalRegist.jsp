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
		<jsp:useBean id="dto" class="personal.personalDTO"/>
		<jsp:setProperty name="dto" property="*"/>
		<jsp:useBean id="dao" class="personal.personalDAO"/>
	</head>
	<body>
		<%
			if(dto.getUserId() == null || dto.getUserPasswd() == null || dto.getUserName() == null ||
				dto.getUserPhone() == null || dto.getUserEmail() == null || dto.getUserGender() == null ||
				dto.getUserId().trim().equals("") || dto.getUserPasswd().trim().equals("") || 
				dto.getUserName().trim().equals("") || dto.getUserPhone().trim().equals("") || 
				dto.getUserEmail().trim().equals("") || dto.getUserGender().trim().equals("") ) {
		%>
			<section><script>fnError();</script></section>
		<%
				return;
			}
		%>
		<%
			String[] uHobby = dto.getUserHobby();
			String[] sHobby = {"", "", ""};
			if(uHobby != null) {
				for(int i =0; i < uHobby.length; i++) {
					if(uHobby[i].equals("낚시")) {
						sHobby[0] = "낚시";
					}
					else if(uHobby[i].equals("바둑")) {
						sHobby[1] = "바둑";
					}
					else if(uHobby[i].equals("독서")) {
						sHobby[2] = "독서";
					}
				}
			}	
		
			int rec_no = dao.insertUser(dto.getUserId(), dto.getUserPasswd(), dto.getUserName(), dto.getUserPhone(), dto.getUserEmail()
					, dto.getUserGender(), sHobby);
			if(rec_no > 0) {
		%>
			<script>location.href="../html/personalLogin.html";</script>
		<% } else { %>
			<script>alert("회원가입 실패"); location.href="../html/personalLogin.html";</script>
		<% } %>
	</body>
</html>