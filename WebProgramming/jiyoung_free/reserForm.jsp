<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="kpu.web.club.domain.*, java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation Form</title>
<link rel="stylesheet" href="resources/style.css" type="text/css"></link>
</head>
<body>

<div id="id">
	${id } 님
</div>
	<div align="center">
	<h2>전체 예약 확인</h2>
	
	
	<table border=2>
			<tr><td>학번</td><td>이름</td><td>날짜</td><td>시간</td><td>열람실</td><td>수정</td><td>삭제</td></tr>
			<%
				List<StudentVO> studentList = (List<StudentVO>)request.getAttribute("reservationList");
				if(studentList != null){
					if(request.getAttribute("id").equals("admin")){
						for(StudentVO vo: studentList){
							
							%>
									<tr>
									<td><%=vo.getId() %></a></td>
									<td><%=vo.getName() %></td>
									<td><%=vo.getDate() %></td>
									<td><%=vo.getTime() %></td>
									<td><%=vo.getRoom() %></td>
									<td><a href="http://localhost:8080/jiyoung_free/StudentServlet?cmd=update&id=<%=vo.getId() %>&date=<%=vo.getDate()%>&user=<%=request.getAttribute("id")%>" target="_self">열람실/시간 수정하기</a></td>
									<td><a href="http://localhost:8080/jiyoung_free/StudentServlet?cmd=delete&id=<%=vo.getId() %>&date=<%=vo.getDate()%>&user=<%=request.getAttribute("id")%>" target="_self">삭제하기</a></td>
							<% 
						}
					} else {
							for(StudentVO vo: studentList){
								if(vo.getId().equals(request.getAttribute("id"))){
							%>
									<tr>
									<td><%=vo.getId() %></a></td>
									<td><%=vo.getName() %></td>
									<td><%=vo.getDate() %></td>
									<td><%=vo.getTime() %></td>
									<td><%=vo.getRoom() %></td>
									<td><a href="http://localhost:8080/jiyoung_free/StudentServlet?cmd=update&id=<%=vo.getId() %>&date=<%=vo.getDate()%>&user=<%=request.getAttribute("id")%>" target="_self">열람실/시간 수정하기</a></td>
									<td><a href="http://localhost:8080/jiyoung_free/StudentServlet?cmd=delete&id=<%=vo.getId() %>&date=<%=vo.getDate()%>&user=<%=request.getAttribute("id")%>" target="_self">삭제하기</a></td>
							<% 
								} else{}
							}
					}
					
					
				
				}
			%>
		</table><br><br>
		<a href="http://localhost:8080/jiyoung_free/home.jsp" target="_self">메인 페이지 이동</a> <br>
	</div>



</body>
</html>