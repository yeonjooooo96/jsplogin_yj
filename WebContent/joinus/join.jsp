<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8");%>     
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>join.jsp</title>
<link rel="stylesheet" href="../css/join.css" />
</head>
<body>
<h2>join.jsp</h2>
<h2>회원가입</h2>
<form action="joinProc.jsp" method="post">
	<p style="color:red;">
	<%
	if(request.getAttribute("errors")!=null){
		List<String> errors=(List)request.getAttribute("errors");//joinProc.jsp에서 에러 리스트를 가져옴
		for(int i=0; i<errors.size(); i++){
	%>
		<%=errors.get(i) %> <br />
		
	<%		
		}
	}
	%>
	</p>

	<label for="id">아이디</label>
	<input type="text" name="id" />
	<input type="button" value="중복확인" />
	<br />
	<label for="">비밀번호</label>
	<input type="text" name="pwd"  /> <br />
	<label for="">비번확인</label>
	<input type="text" name="pwd2"  /> <br />
	<label for="">이름</label>
	<input type="text" name="name"  /> <br />
	<label for="">성별</label>
	<select name="gender" >
		<option value="남성">남성</option>
		<option value="여성">여성</option>
	</select> <br />
	<label for="">생년월일</label>
	<input type="text" name="year" size="5" />년
	<input type="text" name="month" size="5" />월
	<input type="text" name="day" size="5" />일
	
	<input type="radio" name="Islunar" value="양력" checked />양력
	<input type="radio" name="Islunar" value="음력" checked />음력 <br />
	
	<label for="">핸드폰번호</label>
	<input type="tel" name="cphone" />예)010-1111-5555 <br />
	<label for="">이메일</label>
	<input type="email" name="email" /> <br />
	<label for="">취미</label>
	<input type="checkbox" name="habit" value="music" />음악
	<input type="checkbox" name="habit" value="movie" />영화
	<input type="checkbox" name="habit" value="trip" />여행 <br />
	<input type="submit" value="확인" />
</form>
</body>
</html>