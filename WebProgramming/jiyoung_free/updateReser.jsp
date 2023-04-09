<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kpu.web.club.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Reservation</title>
<link rel="stylesheet" href="resources/style.css" type="text/css"></link>
</head>
<body>
<div id="id">
	${user } 님
	</div>
<h2> KPU 열람실 예약 수정</h2>
	<div>
		<form action="http://localhost:8080/jiyoung_free/StudentServlet?cmd=update&user=<%=request.getAttribute("user") %>" method="post">
		<%
			StudentVO student=(StudentVO)request.getAttribute("reservation");
		%>
		<fieldset>
			<legend>Reservation Form</legend>
			<ul>
				<li>학번 : <Input type="text" name="id" value=<%=student.getId() %> readonly></li>
				<li>이름 : <Input type="text" name="name" value=<%=student.getName() %> readonly></li>
				<li>날짜 : <Input type="date" name="date" value=<%=student.getDate() %> readonly></li>
				<jsp:useBean id="time" class="kpu.web.club.item.Time" scope="session"/>
				<li>시간 : <select name="time" value=<%=student.getDate() %>>
							<c:forEach items="${time.getTimeList() }" var="item">
								<option>${item }</option>
								</c:forEach>
						</select>
				<jsp:useBean id="room" class="kpu.web.club.item.Room" scope="session"/>
				<li>스터디룸 : <select name="room" value=<%=student.getRoom() %>>
								<c:forEach items="${room.getRoomList() }" var="item">
								<option>${item }</option>
								</c:forEach>
							</select></li>
			</ul>
		</fieldset>
		<br>
		<div align="center">
			<input type="submit" name="submit" value="수정하기">
			<input type="reset" name="reset" value="초기화하기">
		</div>
			
		</form>
	</div>
</body>
</html>