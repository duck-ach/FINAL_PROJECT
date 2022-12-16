<%@page import="java.util.Optional"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	Optional<String> opt = Optional.ofNullable(request.getParameter("title"));
	String title = opt.orElse("Welcome Spoters");
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
<style type="text/css">
	body{
		
			width:1280px;
			margin:0 auto;
		
	
	}
	.main_header_area{
	position: fixed;
		width:100%;
		top: 0;
	    left: 0;
	    background-color: #EDEBFE;
	}
	.main_header_area_fix{
	/*	position:;*/
	   width:1280px;
	  margin: 0 auto;
	}
	.spoters_logo_area{
		width:1280px;
		padding:50px 0 0 100px;
	/*	border:1px solid #000;*/
	/*	background-color: #fff;*/
	}
	.spoters_logo{
		width:300px; 
	}
	.spoters_logo img{
		width:100%;
	}
		.left_side_gnd_area{
		position: fixed;
		/*
		left:0px;
		top:164px;
		*/
		left:0%;
		border:1px solid #000;
		width: 240px;
	}
	
	
	

	.wrap{
		margin: 100px auto;
	   
	    width: 70%;
	    overflow: hidden;
	    border: 2px solid #000;
	}
	
	.wrap .content_leyout_section{
		width:100%;
		
		
		
	}
	

</style>
</head>
<script type="text/javascript">
$(function(){
	var header_height = $('.main_header_area').height()  +  50;
	$('.wrap').css({marginTop: header_height });
});


</script>



<header class="main_header_area">
	<div class="main_header_area_fix">
	<nav class="spoters_logo_area">
		<h1 class="spoters_logo"><a href="/"><img alt="we are best team!" src="/resources/images/spoters_logo_2.jpg"></a></h1>
	</nav>
	
	

	
	</div>
</header>

<nav class="left_side_gnd_area">
		 <ul>
		 	<li><a href="/users/agree/form">회원가입</a> </li>
		 	<li><a href="/users/login/form">로그인</a> </li>
		 	<li><a href="/local/list">지역별게시판</a> </li>
		 	<li><a href="/spoReview/list">운동후기게시판</a> </li>
		 	<li><a href="/free/list">자유게시판</a> </li>
		 	<li><a href="/shop/list">쇼핑몰</a> </li>
		 	<li><a href="/supp/singo">신고게시판</a> </li>
		 	<li><a href="/supp/qnaList">고객문의게시판</a> </li>
		 	<li><a href="/admin/adminIndex">관리자게시판</a> </li>
		 	<li><a href="/admin/shopIndex">쇼핑몰관리자게시판</a> </li>
		 </ul>
	</nav>
