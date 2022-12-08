<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="layout/header.jsp">
	<jsp:param value="Spoters홈페이지" name="title" />
</jsp:include>
<body>
WELCOME TO SPOTERS
<a href="${contextPath}/local/list">지역별게시판</a>
<a href="${contextPath}/spoReview/list">자유게시판</a>
<a href="${contextPath}/free/list">자유게시판</a>
<a href="${contextPath}/shop/list">쇼핑몰게시판</a>
<a href="${contextPath}/admin/adminIndex">관리자게시판</a>
<a href="${contextPath}/admin/shop/list">쇼핑몰관리자게시판</a>
</body>
</html>