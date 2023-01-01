<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modify Form</title>

</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap" align="center">
		<div>
			<form action="modify" method="post">
				<br>
				<table width="400px" border="1" border-color="olive" style="justify-content:center">
				<tr height="40px"> 
						<td colspan="2" align="center" style="background-color:DarkKhaki"> <h2>회원 정보 수정</h1> </td>
					</tr>
					<tr height="40px">
						<th style="background-color:DarkKhaki" width="30%"> ID </th>
						<td style="background-color:Wheat" width="70%"> ${info.id }<input type="hidden" value="${info.id }" name="id"> </td>
					</tr>
					<tr height="40px">
						<th style="background-color:DarkKhaki"> NAME </th>
						<td style="background-color:Wheat"> <input type="text" size="40" value="${info.name }" name="name"> </td>
					</tr>
					<tr height="40px">
						<th style="background-color:DarkKhaki"> PHONE </th>
						<td style="background-color:Wheat"> <input type="tel" size="40" value="${info.phone }" name="phone"> </td>
					</tr>
					<tr height="40px">
						<th style="background-color:DarkKhaki"> STUDENTID </th>
						<td style="background-color:Wheat" width="70%"> ${info.studentId }<input type="hidden" value="${info.studentId }" name="studentId"> </td>
					</tr>
					<tr height="40px">
						<th style="background-color:DarkKhaki" width="30%"> PASSWORD </th>
						<td style="background-color:Wheat" width="70%"> <input type="password" name="pw"> </td>
					</tr>
				</table>
						<input type="submit" value="modify" class=ctmbtn>
			</form>
		</div>
	</div>
</body>
</html>