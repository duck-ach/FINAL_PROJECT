<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="관리자페이지" name="title" />
</jsp:include>
<jsp:include page="adminLeftSide.jsp">
	<jsp:param value="left_side" name="left_side" />
</jsp:include>
<script>
	$('.admin').addClass('checked');
</script>
<body>


</body>
</html>