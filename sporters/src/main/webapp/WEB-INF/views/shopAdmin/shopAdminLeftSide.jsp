<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script>
	$('.shopAdmin').addClass('checked');
</script>
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
	background-color: #C8C8FF;
	padding-left:8px;
	width: 250px;
	height: 22%;
	border-right: 1px solid #FFF;
	border-radius: 17px;
	padding-top: 8px;
}
.main_menu {
	border-bottom: 1px solid #FFF;
}
ul li{
	margin:10px 0;
}
ul li a{
	font-size: 20px;
} 

</style>
<body>

<div id="menu_wrap">
	<div class="main_menu">
		<ul>
			<li><a href="/shopAdmin/categoryManage">카테고리관리</a></li>
			<li><a href="/shopAdmin/prod/write">상품등록</a></li>
			<li><a href="/shopAdmin/prodManage">상품관리</a></li>
			<li><a href="/shopAdmin/orderManage">주문관리</a></li>
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