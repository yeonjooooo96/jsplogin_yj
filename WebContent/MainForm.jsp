<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>     
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp!</title>
<script>
function logoutProc() {
	location.href="login/logoutProc.jsp";
}
</script>
</head>
<body>
<b> <font size="3" color="skyblue">메인화면입니다.</font> </b> <br />
<%
if(session.getAttribute("sessionID")==null)//login이 안 된 상태
{
	//로그인 화면으로 이동
	response.sendRedirect("login/loginForm.jsp");
}else{
%>
<h3>
	<font color="red"><%=session.getAttribute("sessionID") %></font>
	님 로그인 되었습니다.
</h3>
<br /><br />
<input type="button" value="logout" onclick="logoutProc();" />
<%	
}
%>
</body>
</html>