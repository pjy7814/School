<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
<link rel="stylesheet" href="resources/style.css" type="text/css"></link>
</head>
<body>
<div id="id">
<%
if(request.getAttribute("id") != null){
	%>
	
	${id } 님
	
	<% 
	
} else { %>
	<a href="http://localhost:8080/jiyoung_free/login.jsp" target="_self">로그인하러 가기</a>
	<%
}
%>
</div>

	<div align="center" >
		
		
		<h2> KPU 스터디룸 예약 시스템</h2>
		<img src="resources/kpu.jpg"/><br>
		
		
		<% 
			if(request.getAttribute("id") != null){
				if(request.getAttribute("id").equals("admin")){
					%>
					<a href="http://localhost:8080/jiyoung_free/StudentServlet?cmd=list&id=<%=request.getAttribute("id") %>" target="_self">예약 확인하기 </a>
					
					<%
				} else{
				%>
				
				<div style='line-height:150%'>
				<a href="http://localhost:8080/jiyoung_free/StudentServlet?cmd=reser&id=<%=request.getAttribute("id") %>" target="_self">예약하러 가기</a> <br>
				<a href="http://localhost:8080/jiyoung_free/StudentServlet?cmd=list&id=<%=request.getAttribute("id") %>" target="_self">내 예약 확인하기 </a>
				</div>
				
				
				<%
				}
			} else{
				%>
				<div id='loginMSG'>
					<l><mytag:print/></l><br><br>
				</div>
				
				
				<%
			}
		%>

	</p>
	</div>
</body>
</html>