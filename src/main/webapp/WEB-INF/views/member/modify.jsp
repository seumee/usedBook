<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Member</title>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap" align="center">

			<form action="modify_form" method="post">
				<br>
				<c:import url="../member/pwdCheck.jsp"/>
				
				<input type="submit" value="check" class=ctmbtn>
			</form>
		</div>	
</body>
</html>