<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<table width="400px" border="1" border-color="olive" style="justify-content:center">					
		<tr height="40px"> 
			<td colspan="2" align="center" style="background-color:DarkKhaki"> <h2>패스워드 확인</h1> </td>
		</tr>
		<tr height="40px">
			<th style="background-color:DarkKhaki" width="30%"> ID </th>
			<td colspan="2" style="background-color:Wheat" width="70%"> ${param.id}<input type="hidden" name="id"  size="40" value=${param.id }> </td>
		</tr>
		<tr height="40px">
			<th style="background-color:DarkKhaki" width="30%"> PASSWORD </th>
			<td colspan="2" style="background-color:Wheat" width="70%"> <input type="password" name="pw"  size="40" placeholder="password"> </td>
		</tr>
	</table>
</body>
</html>