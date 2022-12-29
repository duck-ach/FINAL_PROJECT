<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="관리자페이지" name="title" />
</jsp:include>

<style>
body, html {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;

}
#menu_wrap {
	position: absolute;
	top : 80px;
	background-color: rgb(17, 24, 39);
	padding-left:8px;
	width: 250px;
	height: 100%;
	border-right: 1px solid #FFF;
	border-radius: 17px;
	padding-top: 8px;
}
.main_menu {
	border-bottom: 1px solid #FFF;
}
ul li{
	margin:10px 0;
	padding: 20px;
}

ul li:hover{
	margin:10px 0;
	background-color: rgb(56,65,81);
}
ul li a{
	font-size: 20px;
	color: rgb(156, 163, 175);
} 

</style>
<script>
	$('.admin').addClass('checked');
</script>
<body>

<div id="menu_wrap">
	<div class="main_menu">
		<ul>
			<li><a href="/admin/singoList">신고관리</a></li>
			<li><a href="/admin/adminFreeList">게시판관리</a></li>
			<li><a href="/admin/userAdmin">유저관리</a></li>

		</ul>
	</div>
	<div>
		<ul>
			<li><a href="/">Sporters 메인페이지</a></li>
		</ul>
	</div>
</div>

</body>
</html>