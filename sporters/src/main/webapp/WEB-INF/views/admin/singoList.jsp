<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="Sporters 신고관리" name="title" />
</jsp:include>
<jsp:include page="adminLeftSide.jsp">
	<jsp:param value="left_side" name="left_side" />
</jsp:include>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>
<style>

.tbl {
	border-spacing: 2px;
	border-collapse: collapse;
	text-align: center;
/* 	margin-left: auto; */
/* 	margin-right: auto; */
}

tr{
border-bottom: 1px solid #000;
padding-bottom:2px;
}

tr td{

}

.menu a{
	cursor:pointer;
	}
#addCategory{
	display: none;
	text-align: center;
	margin-left: auto;
	margin-right: auto;
	}
</style>
<script>
$('.admin').addClass('checked');

$(document).ready(function(){
    // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
    $("a").click(function(){
        var submenu = $(this).next("#addCategory");

        // submenu 펼치기
        if( submenu.is(":visible") ){
            submenu.slideUp();
        }else{
            submenu.slideDown();
        }
    });
});

	$(window).on('load', function(){
		fn_getCategoryList();
	});
	
	function fn_getCategoryList() {
		$.ajax({
			type: 'get',
			url : '/admin/getCategoryList',
			dataType : 'json',
			success : function(resData) {
				$('#categoryList').empty();
				$.each(resData, function(i, data){
						$('<tr>')
					  	.append($('<td>').text(data.singoCategoryNo))
					  	.append($('<td>').text(data.singoCategoryName))
					  	.append($('<td><a style="display:block;" href="/admin/removeCategory?singoCategoryNo='+data.singoCategoryNo+'"><i class="fa-sharp fa-solid fa-trash"></i></a>'))
					  	.appendTo('#categoryList');
				});
			}
		});
	};
	
	
	$(function(){
	
		$('#addCategoryFrm').submit(function(){
			
			// 만약 빈칸이라면 submit 방지
			if($('#categoryName').val() == '') {
				alert('카테고리 이름을 입력해주세요.');
				event.preventDefault();
				return;
			}
			
			$.ajax({
				type: 'post',
				url : '/admin/addCategory',
				data: 'categoryName=' + $('#categoryName').val(),
				success : function() {
					alert('성공적으로 카테고리가 추가되었습니다.');
				}
			});
			
		});
		
		
	});
</script>
<body>
<div class="body_wrap">
	<div class="code_wrap">
<a>▩▩▩카테고리 관리▩▩▩</a>
<section id="addCategory">
<form id="addCategoryFrm" method="get" >
<br>
	<label for="categoryName">카테고리 이름</label>
	<input type="text" id="categoryName">
	<button>Add</button>
</form>
<br>

<table class="tbl">
	<thead>
		<tr>
			<td>카테고리 번호</td>
			<td>카테고리 이름</td>
			<td>삭제</td>
		</tr>
	</thead>
	<tbody id="categoryList">
	
	</tbody>
	<tfoot>
		<tr>
			<td colspan="5" style="text-align: center;">
				${paging}
			</td>
		</tr>
	</tfoot>
</table>
</section>
<br>
<section>
	<table class="tbl">
		<thead>
			<tr>
				<th>신고글번호</th>
				<th>신고카테고리</th>
				<th>원글제목</th>
				<th>신고링크</th>
<!-- 				<th>작성자ID</th> -->
				<th>신고기타</th>
				<th>원글작성일</th>
				<th>삭제사유</th>
				<th>삭제일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${singoList}" var="singo" varStatus="vs">
				<tr>
					<td>${beginNo - vs.index}</td>
					<td>${singo.singoCategory}</td>
					<td>${singo.singoTitle}</td>
					<td><a>${singo.singoLink}</a></td>
<%-- 					<td>${singo.id}</td> --%>
					<td>${singo.singoUserReason}</td>
					<td>${singo.singoCreateDate}</td>
					<td>${singo.singoReason}</td>
					<td>${singo.singoRemoveDate}</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="5" style="text-align: center;">
						${paging}
				</td>
			</tr>
		</tfoot>
	</table>
</section>
</div>
</div>
</body>
</html>