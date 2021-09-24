<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html> <!-- formText1.jsp -->
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale = 1">
		<title>폼 학습</title>
	</head>
	<body>
		<section>
			<h2>JSP form</h2>
			<section>
				<h2>선택 성별 : <%=request.getParameter("gender")%><br/></h2>
			</section>
		</section>
	</body>
</html>
