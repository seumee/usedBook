<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<c:import url="../default/header.jsp"/>
<br>
	<div class="wrap"  align="center">
		<table border="1" bordercolor="olive" width="800px" class=compactTable>
				<tr height="30px" style="background-color:DarkKhaki">
					<th width="250px">책 이름</th>
					<th width="150px">가격</th>
					<th width="100px">상태</th>
					<th width="100px">책꽂이 번호</th>
					<th width="100px">등록일자</th>
					<th width="100px">판매여부</th>
				</tr>
			<c:if test="${myList.size() == 0 }">
				<tr>
					<th colspan="6" height="40px" style="background-color:Wheat">
						등록된 거래가 없습니다.
					</th>
				</tr>
			</c:if>
			<c:forEach var="list" items="${myList }">
					<tr height="40px" style="background-color:Wheat">
						<td>${list.bookName }</td>
						<td>${list.price }</td>
						<c:choose>
						    <c:when test="${list.quality == 1 }">
						       	<td>좋음</td>
						    </c:when>
						    <c:when test="${list.quality == 2 }">
						        <td>보통</td>
						    </c:when>
						    <c:otherwise>
						        <td>나쁨</td>
						    </c:otherwise>
						</c:choose>
						<td>${list.partitionNum }</td>
						<td>${list.regDate }</td>
						<c:choose>
						    <c:when test="${list.state == 2 }">
						       	<td>예약중</td>
						    </c:when>
						    <c:when test="${list.state == 3 }">
						        <td>판매완료</td>
						    </c:when>
						    <c:otherwise>
						        <td>판매중</td>
						    </c:otherwise>
						</c:choose>	
					</tr>
			</c:forEach>
		</table>
		<table width="800px">
			<tr align="center">
				<c:forEach var="num" begin="1" end="${repeat }"> 
					<a href="?num=${num }" style="text-decoration:none;">
						[${num }]
					</a>
				</c:forEach>
			</tr>
			<tr align="right">
				<td>
					검색
				</td>
			</tr>
		</table>
	</div>
</body>
</html>