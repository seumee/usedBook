<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
</head>
<body>
<c:import url="../default/header.jsp"/>
<br>
	<div class="wrap" align="center">
		<form action="user_check" method="post">
			<table width="450px" border="1" border-color="olive" style="justify-content:center">
				<tr height="50px">
					<th style="background-color:DarkKhaki;" width="25%">ID</th>
					<td style="background-color:Wheat" width="75%"> <input type="text" name="id" placeholder="input id"> 
					<input type="checkbox" name="autoLogin">AUTOLOGIN</td>
				</tr>
				<tr height="50px">
					<th style="background-color:DarkKhaki;" width="25%">PW</th>
					<td style="background-color:Wheat" width="75%"> <input type="password" name="pw" placeholder="input password"> </td>
				</tr>
		</table>
		<div>
		    <input type="submit" value="Login" class=ctmbtn>		
			<input type="button" value="Sign Up" onClick="location.href='register_form'" class=ctmbtn>
		</div>
		</form>
	</div>
</div>
</body>
</html>