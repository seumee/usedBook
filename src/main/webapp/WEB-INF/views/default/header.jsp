<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	*{margin: 0;}
	.wrap{width: 1000px; margin:auto;}
	.header{width: 1000px; text-align: "center";}
	.ctmbtn{margin: 6px 3px; background-color:burlywood; border-radius: 4px; width: 80px;}
	.title{
			text-align: center;
			font-size: 70pt;
			text-shadow: 10px 10px 20px black;
			margin-top: 0;
			padding-bottom: 20px;
			font-family: "Copperplate", fantasy;
			letter-spacing: 5px;
		}
		.title a:link{color: burlywood; text-decoration: none;}
		.title a:visited{color: burlywood; text-decoration: none;}
	.compactTable{
			table-layout:fixed;
		}
		.compactTable td{text-overflow:ellipsis; overflow:hidden; white-space:nowrap;}
		.compactTable tr{text-overflow:ellipsis; overflow:hidden; white-space:nowrap;}
		nav{background-color: olive; width=1000px;}
		.navdiv{width:100%; background-color: olive;}
		.navsubdiv{width:100%; background-color: Tan;}
		.subnav{background-color: Tan; width=1000px;}
		
		nav ul{list-style: none; display: flex; justify-content: right;}
		nav ul li{padding:10px;}
		nav ul li a{text-decoration: none; color: white;}
		nav ul li a:hover{
			color: burlywood; border-bottom: 2px solid burlywood;
			transition: all 0.25s; padding-bottom: 3px;
			text-decoration: none;
		}
		.subnav ul li a:hover{
			color: maroon; border-bottom: 2px solid maroon;
			transition: all 0.25s; padding-bottom: 3px;
			text-decoration: none;
		}
		
</style>


</head>
<body>
	<div class="wrap">
		<div class="header">
			<!-- <h1 style="background: red;" class="title">CARE LAB</h1> -->
			<!-- <h1 class="title">CARE LAB</h1> -->
			<h1 class="title"><a href="/usedbook/">USED BOOK</a></h1>
		</div>
	</div>
<div class="navdiv">
	<div class="wrap">
		<nav>
			<ul>
				<li>
					<a href="/usedbook/board/list/all">전체 판매글</a>
				</li>
				<c:choose>
					<c:when test="${loginUser != null }">
						<li>
							<a href="/usedbook/member/myList">내 거래목록</a>
						</li>
						<li>
							<a href="/usedbook/member/myPage">마이페이지</a>
						</li>
						<li>
							<a href="/usedbook/member/logout">로그아웃</a>							
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="/usedbook/member/login">로그인</a>							
						</li>						
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
	</div>
</div>	
</body>
</html>