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
		<div class="chat_container">
			<div>
        		<textarea id="messageWindow" rows="15" cols="85" readonly="true"></textarea><br/>
        		<input id="inputMessage" type="text"/><br/>
        		<div>
        			<input class="submit_button_in" type="submit" onclick="send()" style='cursor:pointer;' value="전송" onkeyup="enterkey()"/>
        			<input class="submit_button_in" type="button" onclick="location.href='../jsp/personalFind.jsp'" style='cursor:pointer;' value="유저검색"/>
   					<input class="submit_button_in" type="button" onclick="location.href='../jsp/personalLogout.jsp'" style='cursor:pointer;' value="로그아웃"/>
   					<input class="submit_button_in" type="button" onclick="location.href='../jsp/personalDeregist.jsp'" style='cursor:pointer;' value="회원탈퇴"/>
        		</div>
   			</div>
		</div>
		<div>
     		<footer class="footer">
        	<h4>Personal Project Page</h4>
      		</footer>
   	 	</div>
		<script>
			var textarea = document.getElementById("messageWindow");
  			var webSocket = new WebSocket('ws://localhost:8089/JSPWORK/broadcasting');
    		var inputMessage = document.getElementById('inputMessage');
    		
 			webSocket.onerror = function(event) {
  	 			onError(event)
			};

			webSocket.onopen = function(event) {
  			 	onOpen(event)
			};

			webSocket.onmessage = function(event) {
 				onMessage(event)
			};

			function onMessage(event) {
   	  			textarea.value += "수신 : " + event.data + "\n";
			}

			function onOpen(event) {
   	  			textarea.value += "연결 성공\n";
			}

			function onError(event) {
  				alert(event.data);
			}

			function send() {
 	    		textarea.value += "송신 : " + inputMessage.value + "\n";
 	    		webSocket.send(inputMessage.value);
     			inputMessage.value = "";
	 		}
		</script>
	</body>
</html>