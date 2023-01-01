<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Info Page</title>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<br>
		<div class="wrap" align="center">
			<table width="400px" border="1" border-color="olive" style="justify-content:center">
					<tr height="40px">
					<th style="background-color:DarkKhaki" width="30%">ID</th> <td style="background-color:Wheat">${info.id }</td>
					</tr>
					<tr height="40px">
					<th style="background-color:DarkKhaki">NAME</th> <td style="background-color:Wheat">${info.name }</td>
					</tr>
					<tr height="40px" style="background-color:DarkKhaki">
					<th style="background-color:DarkKhaki">PHONE</th> <td style="background-color:Wheat">${info.phone }</td>
					</tr>
					<tr height="40px" style="background-color:DarkKhaki">
					<th style="background-color:DarkKhaki">STUDENT ID</th> <td style="background-color:Wheat">${info.studentId }</td>
					</tr>
				</table>
			<%-- <input type="button" value="수정" onClick="location.href='modify_form?id=${info.id}'" class=ctmbtn> --%>
			<input type="button" value="수정" onClick="location.href='modify_check?id=${info.id}'" class=ctmbtn>
			<input type="button" value="탈퇴" onClick="location.href='delete_form?id=${info.id}'" class=ctmbtn>
		</div>
</body>
</html>