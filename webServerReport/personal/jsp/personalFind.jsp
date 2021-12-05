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
		<div>
  			<header>
      			<p>Daejeon University</p>
      			<h1>조휘진</h1>
    		</header>
  		</div>
		<%
  			if(dto.isLoginStat() != true) {
  		%>
  		<script>alert("접근 실패"); location.href="../html/personalLogin.html";</script>
  		<%
  			}
  		%>
		<form action="../jsp/personalResult.jsp" method="post">
			<fieldset>
				<legend>검색</legend>
				<select name="searchSelect">
					<option value="userAll" selected>전체</option>
					<option value="userName">이름</option>
					<option value="userHobby">취미</option>
				</select>
				<input type="text" name="userSearch"/>
				<input class="submit_button_in" type="submit" value="검색">
			</fieldset>
		</form>
		<div><input class="submit_button_in" type="button" onclick="location.href='../jsp/personalChat.jsp'" style='cursor:pointer;' value="뒤로가기"/></div>
		<div>
      		<footer class="footer">
        		<h4>Personal Project Page</h4>
      		</footer>
    	</div>
	</body>
</html>