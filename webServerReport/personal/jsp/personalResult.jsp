<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.util.* " %>
<%@ page import="personal.personalDTO" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<meta name="viewport" content="width=device-width, initial-scale=1"/>
		<title>PERSONAL PROJECT</title>
		<link rel="stylesheet" href="../css/personalStyle.css"/>
		<jsp:useBean id="dto" class="personal.personalDTO" scope="session"/>
		<jsp:useBean id="dao" class="personal.personalDAO"/>
	</head>
	<body>
		<%
			if(dto.isLoginStat() == true) {
		%>
		<div>
  			<header>
      			<p>Daejeon University</p>
      			<h1>조휘진</h1>
    		</header>
  		</div>
		<div style="overflow-x:auto; overflow-y:auto;">
			<table class="ex1">
				<tr><th>아이디</th><th>이름</th><th>전화번호</th><th>이메일</th><th>성별</th><th>취미</th><th>가입일</th></tr>
				<%
					String searchSelect = request.getParameter("searchSelect");
					String userSearch = request.getParameter("userSearch");
					
					List<personalDTO> list = new ArrayList<personalDTO>();
					if(searchSelect == null || userSearch == null) {
						response.sendRedirect("../jsp/personalFind.jsp");
					}
					if("userAll".equals(searchSelect)) {
						list = dao.findAllUser(userSearch);
					} else if("userHobby".equals(searchSelect)) {
						list = dao.findHobbyUser(userSearch);
					} else if("userName".equals(searchSelect)) {
						list = dao.findNameUser(userSearch, searchSelect);
					}
					String hobby[] = {"", "", ""};
					for (int i = 0; i < list.size(); i++) {
						hobby = list.get(i).getUserHobby();
					%>
					<tr>
						<td><%= list.get(i).getUserId() %></td>
						<td><%= list.get(i).getUserName() %></td>
						<td><%= list.get(i).getUserPhone() %></td>
						<td><%= list.get(i).getUserEmail() %></td>
						<td><%= list.get(i).getUserGender() %></td>
						<td><%= hobby[0] %> <%= hobby[1] %> <%= hobby[2] %></td>
						<td><%= list.get(i).getUserRegdate() %></td>
					</tr>
					<% 
						}
					%>
			</table>
		</div>
		<div><input class="submit_button_in" type="button" onclick="location.href='../jsp/personalFind.jsp'" style='cursor:pointer;' value="뒤로가기"/></div>
		<div><input class="submit_button_in" type="button" onclick="location.href='../jsp/personalLogout.jsp'" style='cursor:pointer;' value="로그아웃"/></div>
		<% 
			}
			else {
		%>
			<script>alert("로그인 되지 않음"); location.href="../html/personalLogin.html";</script>
		<%
			}
		%>
		<div>
     	  <footer class="footer">
   		     <h4>Personal Project Page</h4>
    	  </footer>
  	  	</div>
	</body>
</html>