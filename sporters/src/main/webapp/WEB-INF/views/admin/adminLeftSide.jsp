<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
	width: 200px;
	height: 100%;
	border-right: 1px solid #FFF;
	padding-top: 8px;
}
#com_menu {
	padding-bottom:20px;
	border-bottom: 1px solid #FFF;
}
#shop_menu {
	padding-bottom:20px;
	border-bottom: 1px solid #FFF;
}

ul li{
	vertical-align : bottom;
	padding: 20px 20px 20px 27px;
}

ul li:hover{
	background-color: rgb(56,65,81);
}
ul li a, a{
	text-align:left;
	font-size: 18px;
	color: rgb(156, 163, 175);
}
div {
	padding-left: 15px;
}
i	{
	margin-top:10px;
	color:rgb(156, 163, 175);
	font-size: 20px;
}
p{
margin-top:10px;
height: 50px;
}
.upper_menu:hover{
cursor:pointer;
}


</style>
<script src="https://kit.fontawesome.com/02dc4a9c97.js" crossorigin="anonymous"></script>
<script>
	
	$(document).ready(function(){
	    $("p").click(function(){
	        var submenu = $(this).next("#com_menu, #shop_menu");

	        // submenu 펼치기
	        if( submenu.is(":visible") ){
	            submenu.slideUp();
	        }else{
	            submenu.slideDown();
	        }
	    });
	});
</script>
<body>

<div id="menu_wrap">
	<div>
		<p class="upper_menu">
		<i class="fa-solid fa-users"></i>&nbsp;
		<a>커뮤니티 관리</a>
		</p>
		<ul id="com_menu">
			<li><a href="/admin/userAdmin">- 유저관리</a></li>
			<li><a href="/admin/singoList">- 신고관리</a></li>
			<li><a href="/admin/adminFreeList">- 게시판관리</a></li>
		</ul>
	</div>
	<div>
	<p class="upper_menu">
	<i class="fa-solid fa-basket-shopping"></i>&nbsp;
	<a>쇼핑몰 관리</a>
	</p>
		<ul id="shop_menu">
			<li><a href="/shopAdmin/categoryManage">- 카테고리관리</a></li>
			<li><a href="/shopAdmin/prod/write">- 상품등록</a></li>
			<li><a href="/shopAdmin/prodManage">- 상품관리</a></li>
			<li><a href="/shopAdmin/orderManage">- 주문관리</a></li>
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