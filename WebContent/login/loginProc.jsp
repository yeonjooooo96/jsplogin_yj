<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>
<%
String id=request.getParameter("id");
String pass=request.getParameter("password");

//db연결
String sql="select pwd from member where id=?";
Class.forName("oracle.jdbc.driver.OracleDriver");
//접속
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String user="scott";
String pw="123456";
Connection con=DriverManager.getConnection(url,user,pw);
//실행
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs=pstmt.executeQuery();//select 실행

String ypass="";
int x=-1;
String msg="";
if(rs.next()){
	ypass=rs.getString("pwd");
	if(ypass.equals(pass))//pass 일치
		x=1;
	else//pass 불일치
		x=0;
}else{//아이디가 존재하지 않는 상태
	x=-1;
}
System.out.println("xxxx :"+x);
if(x==1){
	session.setAttribute("sessionID", id);//session에 sessionID란 이름으로 id보관
	msg="../MainForm.jsp";
}else if(x==0){
	msg="loginForm.jsp?msg=0";//msg=0인 상태값을 가져감
}else{
	msg="loginForm.jsp?msg=-1";//msg=-1인 상태값을 가져감
}
response.sendRedirect(msg);


%>    
<!-- <!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jsp!</title>
</head>
<body>
<h2>loginProc.jsp</h2>
</body>
</html> -->