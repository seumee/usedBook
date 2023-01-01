<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	/* 
	※ 휴대폰 번호 마스킹
	ex1) 원본 데이터 : 01012345678, 변경 데이터 : 010****5678
	ex2) 원본 데이터 : 010-1234-5678, 변경 데이터 : 010-****-5678
	ex3) 원본 데이터 : 0111234567, 변경 데이터 : 011***4567
	ex4) 원본 데이터 : 011-123-4567, 변경 데이터 : 011-***-4567
	*/
	function maskingPhone(str){
		let originStr = str;
		let phoneStr;
		let maskingStr;
		
		if (originStr.toString().split('-').length != 3)
		{ // 1) -가 없는 경우
			phoneStr = originStr.length < 11 ? originStr.match(/\d{10}/gi) : originStr.match(/\d{11}/gi);
			if(originStr.length < 11)
			{ // 1.1) 0110000000
				maskingStr = originStr.toString().replace(phoneStr, phoneStr.toString().replace(/(\d{3})(\d{3})(\d{4})/gi,'$1***$3'));
			}
			else
			{ // 1.2) 01000000000
				maskingStr = originStr.toString().replace(phoneStr, phoneStr.toString().replace(/(\d{3})(\d{4})(\d{4})/gi,'$1****$3'));
			}
		}else
		{ // 2) -가 있는 경우
			phoneStr = originStr.match(/\d{2,3}-\d{3,4}-\d{4}/gi);
			if(/-[0-9]{3}-/.test(phoneStr))
			{ // 2.1) 00-000-0000
				maskingStr = originStr.toString().replace(phoneStr, phoneStr.toString().replace(/-[0-9]{3}-/g, "-***-"));
			} else if(/-[0-9]{4}-/.test(phoneStr))
			{ // 2.2) 00-0000-0000
				maskingStr = originStr.toString().replace(phoneStr, phoneStr.toString().replace(/-[0-9]{4}-/g, "-****-"));
			}
		}
		document.write(maskingStr);
	}
</script>

</head>
<body>
<c:import url="../default/header.jsp"/>
<c:import url="underList.jsp"/>
	<br>
	<div class="wrap"  align="center">
		<table border="1" bordercolor="olive" width="800px" class=compactTable>
				<tr height="30px" style="background-color:DarkKhaki">
					<th width="200px">책 이름</th>
					<th width="150px">판매자 전화번호</th>
					<th width="100px">가격</th>
					<th width="50px">상태</th>
					<th width="100px">책꽂이 번호</th>
					<th width="100px">등록일자</th>
					<th width="100px">판매여부</th>
				</tr>
			<c:if test="${list.size() == 0 }">
				<tr>
					<th colspan="6" height="40px" style="background-color:Wheat">
						등록된 거래가 없습니다.
					</th>
				</tr>
			</c:if>
			<c:forEach var="list" items="${list }">
				<tr height="40px" style="background-color:Wheat">
					<td>${list.bookName }</td>
					<td><script>maskingPhone("${list.phone}")</script></td>
					
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
			<tr align="left">
				<td>
					<input type="text" name="search" id="search">
					<input type="button" value="검색" class=ctmbtn onclick="">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>