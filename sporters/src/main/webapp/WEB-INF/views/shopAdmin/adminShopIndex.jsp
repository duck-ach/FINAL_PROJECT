<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="Sporters 쇼핑몰 관리자페이지" name="title" />
</jsp:include>
<body>
<img alt="logoImage" src="${contextPath}/resources/images/shopAdmin/mainLogoImage.jpeg" width="100px">
<hr>

<ul>
	<li><a href="/shopAdmin/prodWrite">상품등록</a></li>
	<li><a href="/shopAdmin/prodManage">상품관리</a></li>
	<li><a href="/shopAdmin/orderManage">주문관리</a></li>
</ul>
</body>
</html>