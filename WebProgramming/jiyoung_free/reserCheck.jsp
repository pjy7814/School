<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kpu.web.club.domain.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation Check</title>
<link rel="stylesheet" href="resources/style.css" type="text/css"></link>
</head>
<body>

<div id="id">
	${user } 님
</div>
<h2 align="center">예약 확인하기</h2>
	<p id=sect><%=request.getAttribute("greetings") %><br>
	
	<div>
		<%
			StudentVO student = (StudentVO)request.getAttribute("student");
			
			%>
		<table border ="1">
		<tr>
			<th>계정</th>
			<td><%=student.getId() %>
		</tr>
		<tr>
			<th>이름</th>
			<td><%=student.getName() %>
		</tr>
		<tr>
			<th>열람실</th>
			<td><%=student.getRoom() %>
		</tr>
		<tr>
			<th>날짜</th>
			<td><%=student.getDate() %>
		</tr>
		<tr>
			<th>시간</th>
			<td><%=student.getTime() %>
		</tr>
		
		
		</table>
		<div style='line-height:150%'>
			<a href="http://localhost:8080/jiyoung_free/home.jsp" target="_self">홈으로 이동</a> <br>
			<a href="http://localhost:8080/jiyoung_free/StudentServlet?cmd=list&id=<%=request.getAttribute("user") %>" target="_self">예약 확인하기 </a>
		</div>
		
		
		
		
	</div>

</body>
</html>