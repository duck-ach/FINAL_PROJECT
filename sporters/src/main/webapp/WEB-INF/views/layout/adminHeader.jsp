<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	Optional<String> opt = Optional.ofNullable(request.getParameter("title"));
	String title = opt.orElse("Welcome To Admin!");
	pageContext.setAttribute("title", title);
	pageContext.setAttribute("contextPath", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title}</title>
<script src="/resources/js/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="/resources/summernote-0.8.18-dist/summernote-lite.min.css">
<script src="/resources/summernote-0.8.18-dist/summernote-lite.min.js"></script>
<script src="/resources/summernote-0.8.18-dist/lang/summernote-ko-KR.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/reset.css">
<script>

	
</script>
<style type="text/css">
html,body{
	height:100%;
	position: relative; 
}
.main_header_area{
	position: relative;
	width:100%;
    z-index: 11;
}
.spoters_logo_area {
	position: absolute;
	top:0;
	width: 50px;
}
.adminIndex {
	position: absolute;
	right:0;
}
.checked {
	color: #5b59d9;
}
.body_wrap { /* body태그 아래 바로 아래 div에 줄 부분 */
	padding-top: 107px;
	padding-left: 286px;
}
.code_wrap { /* 코드가 들어갈 부분 */
	width : 1000px;
}
</style>
</head>
<header class="main_header_area">
	<div class="main_header_area_fix">
		<nav class="spoters_logo_area">
			<a href="/admin/shopIndex"><img alt="logoImage" src="/resources/images/shopAdmin/mainLogoImage.jpeg" width="200px"></a> 
		</nav>
		<nav class="adminIndex">
				<a href="/admin/userAdmin" class="admin">SPORTERS ADMIN</a>&nbsp;&nbsp;
				<a href="/admin/shopIndex" class="shopAdmin">SHOP ADMIN</a>
		</nav>
	</div>
</header>
 
