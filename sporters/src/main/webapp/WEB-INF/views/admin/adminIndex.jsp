<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="관리자페이지" name="title" />
</jsp:include>
<body>

	<a href="${contextPath}/admin/userAdmin">유저관리</a>
	<a href="${contextPath}/admin/singoList">신고관리</a>
	<a href="${contextPath}/admin/adminFreeList">게시판관리</a>

</body>
</html>