<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" href="resources/style.css" type="text/css"></link>
</head>
<body>
<div align="center">
<h2> KPU 로그인 </h2>
<img src="resources/kpu.jpg"/><br>
</div>
	<div align="center">
		<form action="http://localhost:8080/jiyoung_free/StudentServlet?cmd=login" method="post">
		
		<fieldset>
		<div id="login">
		아이디 <Input type="text" name="id" width="100px" autofocus required placeholder="ID"><br>
		
		비밀번호 <Input type="password" name="passwd" width="100px" autofocus required placeholder="PASSWORD">
		
		</div>
		<input type="submit" name="submit" value="로그인">
		
		
		
		
		
		
			
		</fieldset>
			
		</form>
	</div>
</body>
</html>