<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="관리자페이지" name="title" />
</jsp:include>
<body>

<div class="wrap">
<h1>회원 관리</h1>

<form id="user_search" method="post">
	<select name="users" id="user_select">
		<option value="">회 원 분 류</option>
		<option value="id">아이디</option>
		<option value="name">이름</option>
		<option value="user_no">회원번호</option>
	</select>
	<input type="text" id="query" name="query">
	<input type="button" id="btn_search" value="검색">
	<input type="button" id="btn_init" value="초기화"><br>
</form>

<table border="1">
	<thead>
		<tr>
			<td>회원번호</td>
			<td>회원 아이디</td>
			<td>닉네임</td>
			<td>회원 이름</td>
			<td>회원 성별</td>
			<td>회원 이메일</td>
			<td>회원 연락처</td>
			<td>회원 가입일</td>
			<td>회원 포인트</td>
			<td><button class="btn_deleteUser">탈퇴처리</button></td>
			<td><select id="ban"></select><button class="btn_banUser">정지처리</button></td>
		</tr>
	</thead>
	<tbody id="list">
	
	</tbody>
</table>
</div>


</body>
</html>