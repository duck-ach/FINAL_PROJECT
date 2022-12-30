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
    /* position: fixed; */
    width: 100%;
    height: 80px;
    top: 0;
    left: 0;
    background-color: rgb(17, 24, 39);
    z-index: 11;
}
.main_header_area_fix {
	width:100%;
}
.spoters_logo_area {
	position: absolute;
	top:0;
	width: 50px;
	margin-left: 20px;
}
.body_wrap { /* body태그 아래 바로 아래 div에 줄 부분 */
	padding-top:30px;
	padding-left: 245px;
}
.code_wrap { /* 코드가 들어갈 부분 */
	width : 100%;
}
</style>
</head>
<header class="main_header_area">
	<div class="main_header_area_fix">
		<nav class="spoters_logo_area">
			<a href="/admin/adminIndex"><img alt="logoImage" src="/resources/images/shopAdmin/sporters_logo.png" width="200px"></a> 
		</nav>
	</div>
</header>
 
