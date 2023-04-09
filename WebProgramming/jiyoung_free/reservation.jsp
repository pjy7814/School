<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kpu.web.club.domain.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<link rel="stylesheet" href="resources/style.css" type="text/css"></link>
</head>
<body>
<%
			StudentVO student=(StudentVO)request.getAttribute("reservation");
%>
<div id="id">
	<%=student.getId() %> 님
</div>
<header> KPU 열람실 예약</header>
	<div>
		<form action="http://localhost:8080/jiyoung_free/StudentServlet?cmd=reser&user=<%=student.getId()%>" method="post">
		
		<fieldset>
			<legend>Reservation Form</legend>
			<ul>
				<li>학번 : <Input type="text" name="id" value=<%=student.getId() %> readonly></li>
				<li>이름 : <Input type="text" name="name" value=<%=student.getName() %> readonly></li>
				<li>날짜 : <Input type="date" name="date" autofocus required placeholder="****-**-**"></li>
				<jsp:useBean id="time" class="kpu.web.club.item.Time" scope="session"/>
				<li>시간 : <select name="time">
							<c:forEach items="${time.getTimeList() }" var="item">
								<option>${item }</option>
								</c:forEach>
						</select>
				<jsp:useBean id="room" class="kpu.web.club.item.Room" scope="session"/>
				<li>스터디룸 : <select name="room">
								<c:forEach items="${room.getRoomList() }" var="item">
								<option>${item }</option>
								</c:forEach>
							</select></li>
			</ul>
		</fieldset>
		<br>
		<fieldset>
			<input type="submit" name="submit" value="예약하기">
			<input type="reset" name="reset" value="초기화하기">
		</fieldset>
			
		</form>
	</div>
</body>
</html>