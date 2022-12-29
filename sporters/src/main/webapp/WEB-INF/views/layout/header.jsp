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
<!-- 
<link rel="stylesheet" type="text/css" href="/resources/css/left_menus.css">
<script src="/resources/js/left_menus.js"></script>
 -->
<style type="text/css">
	html,body{
	height:100%;
	position: relative; 
	
		/*
			width:1280px;
			margin:0 auto;
		*/
	
	}
	.main_header_area{
	position: relative;
	/*
	position: fixed;
	*/
		width:100%;
		top: 0;
	    left: 0;
	    background-color: #EDEBFE;
	    z-index: 11;
	}
	.main_header_area_fix{
/*	position: fixed;*
	   width:1280px;
	  margin: 0 auto;
	  */
	}
	
	.spoters_logo_area{
	    padding: 50px 100px 0 100px;
	    display: flex;
	    /* border: 1px solid #000; */
	    /* background-color: #fff; */
	    flex-direction: row;
	    align-content: stretch;
	    flex-wrap: nowrap;
	    justify-content: space-between;
	    align-items: baseline;
	}
	.spoters_logo{
		width:300px; 
	}
	.spoters_logo img{
		width:100%;
	}
	
	/*
		.left_side_gnd_area{
		position: fixed;
		
		left:0px;
		
		
		left:0%;
		top:164px;
		border:1px solid #000;
		width: 240px;
	}
	
	
	*/

	.wrap{
		position:relative;
		top:0px;
		margin: 50px auto;
	   
	    width: 70%;
	    overflow: hidden;
	/*    border: 2px solid #000;*/
	}
	
	.wrap .content_leyout_section{
		width:100%;		
	}
	

</style>
</head>
<!--  
<script type="text/javascript">
$(function(){
//	var header_height = $('.main_header_area').height()  +  50;
//	$('.wrap').css({marginTop: header_height });
});


</script>
-->

<div id="left_side_gnd_area"  class="left_side_gnd_area">
	
	<jsp:include page="../layout/left_side.jsp">
		<jsp:param value="left_side" name="left_side" />
	</jsp:include>
</div>

<header class="main_header_area">
	<div class="main_header_area_fix">
	<nav class="spoters_logo_area">
		<h1 class="spoters_logo"><a href="/"><img alt="we are best team!" src="/resources/images/spoters_logo_2.jpg"></a></h1>
		<div style="font-size: 18px; ">
			<c:if test="${loginUser != null}">
			
				${loginUser.nickname} 님 활동적인 하루되세요!🦾🦾	<br>
				
				<span><a href="/users/mypage">MYPAGE</a> ｜ <a href="/users/logout">LOGOUT</a></span>	
			</c:if>	
			
			<c:if test="${loginUser == null}">
				<span><a href="/users/login/form">로그인</a> ｜ <a href="/users/agree/form">회원가입</a></span>
			</c:if>
		</div>
	
	</nav>	
	</div>



<!--
<div id="left_side_gnd_area"  class="left_side_gnd_area">
          
      <ul>
        <li><a href="/users/agree/form">회원가입</a> </li>
	 	<li><a href="/users/login/form">로그인</a> </li>
	 	<li><a href="/local/list">지역별게시판</a> </li>
	 	<li><a href="/spoReview/list">운동후기게시판</a> </li>
	 	<li><a href="/free/list">자유게시판</a> </li>
	 	<li><a href="/shop/list">쇼핑몰</a> </li>
	 	<li><a href="/supp/singo">신고게시판</a> </li>
	 	<li><a href="/qna/list">고객문의게시판</a> </li>
	 	<li><a href="/faq/list">자주하는질문</a> </li>
	 	<li><a href="/admin/adminIndex">관리자게시판</a> </li>
	 	<li><a href="/admin/shopIndex">쇼핑몰관리자게시판</a> </li>
      </ul>    
  </div>
  -->

</header>