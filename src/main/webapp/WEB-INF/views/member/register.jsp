<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register_Form</title>

<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function idCheck() {
		$("#id").on("propertychange change keyup paste input", function() {
			let id = $("#id").val()
			if(id) {			
				$.ajax({
					url: "check_ovr/"+id, type: "get",
					dataType: "text",
					success: function(isOvr) {
						if(isOvr == 1) 
							$("#ovr").html("아이디 중복!")
						else
							$("#ovr").html("")
					}
				})
			}
		})
	}
</script>

<script>
	function stNumCheck() {
		$("#stNum").on("propertychange change keyup paste input", function() {			
			let stNum = $("#stNum").val()
			if(stNum) {
				$.ajax({
					url: "lenCheck/"+stNum, type: "get",
					dataType: "text",
					success: function(lenCheck) {
						if(lenCheck == 1) 
							$("#len").html("8자리 학번")
						else
							$("#len").html("")
					}
				})
			}
		})
	}
</script>

</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap" align="center">
		<div>
			<form action="register" method="post">
				<br>
				<table width="600px" border="1" border-color="olive" style="justify-content:center">
					<tr height="40px">
						<th style="background-color:DarkKhaki;" width="35%"> 
							ID <span style="font-size:30%; color:red;" id="ovr">  </span>
						</th>
						<td style="background-color:Wheat" width="65%"> 
							<input type="text" id="id" name="id" size="40" placeholder="아이디" oninput="idCheck()"> 
						</td>
					</tr>
					<tr height="40px">
						<th style="background-color:DarkKhaki"> PASSWORD </th>
						<td  style="background-color:Wheat"> <input type="password" name="pw" size="40" placeholder="패스워드"> </td>
					</tr>
					<tr height="40px">
						<th style="background-color:DarkKhaki"> PHONE </th>
						<td style="background-color:Wheat"> <input type="tel" name="phone" size="40" placeholder="전화번호"> </td>
					</tr>
					<tr height="40px">
						<th style="background-color:DarkKhaki">
							STUDENT ID <span style="font-size:30%; color:red;" id="len">  </span>
						</th>
						<td style="background-color:Wheat"> 
							<input type="text" name="studentId" id="stNum" size="40" placeholder="학번" oninput="stNumCheck()"> 
						</td>
					</tr>					
					<tr height="40px">
						<th style="background-color:DarkKhaki"> NAME </th>
						<td style="background-color:Wheat"> <input type="text" name="name" size="40" placeholder="이름"> </td>
					</tr>
					
					
				</table>
						<input type="submit" value="register" class=ctmbtn>
			</form>
		</div>
	</div>

</body>
</html>