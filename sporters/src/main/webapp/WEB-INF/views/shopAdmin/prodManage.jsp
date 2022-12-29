<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="쇼핑몰상품관리" name="title" />
</jsp:include>
<jsp:include page="shopAdminLeftSide.jsp">
	<jsp:param value="left_side" name="left_side" />
</jsp:include>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<body>
<script>

	// shopAdmin css
	$('.shopAdmin').addClass('checked');
	
	$(function(){
		$('.attach_img').tooltip();
		
		// 검색 submit 확인
		$('#frm_search').submit(function(event){
			if($('#column').val() == '' || $('#query').val() == ''){
				alert('검색 조건을 확인하세요.');
				event.preventDefault();
				return;
			}
		});
		
		// 자동 완성
		$('#query').keyup(function(){
			if($('#column').val() == 'PROD_NAME' || $('#column').val() == 'PROD_CONTENT' || $('#column').val() == 'ORIGIN'){
				return;
			}
			if($(this).val() == ''){
				return;
			}
			$('#auto_complete').empty();
			$.ajax({
				/* 요청 */
				type: 'get',
				url: '/shopAdmin/prod/autoComplete',
				data: $('#frm_search').serialize(),
				/* 응답 */
				dataType: 'json',
				success: function(resData){
					if(resData.status == 200){
						$.each(resData.list, function(i, prod){
							$('#auto_complete')
							.append($('<option>').val(prod[resData.column]));
						});
					}
				}
			});
		});
	});
</script>
<div class="body_wrap">
	<div class="code_wrap">
		<a href="/shopAdmin/prodManage">상품관리</a>
		<div>
			<span>상품목록 (전체 ${totalRecord}개)</span>
			<a href="/shopAdmin/prod/write">상품등록</a>
		</div>
		<div>
			<form id="frm_search" action="/shopAdmin/prodSearch">
				<select name="column" id="column">
					<option value="">===선택===</option>
					<option value="PROD_NO">상품번호</option>
					<option value="PROD_NAME">상품이름</option>
					<option value="PROD_CONTENT">상품설명</option>
					<option value="ORIGIN">원산지</option>
				</select>
				<input type="text" name="query" id="query" list="auto_complete">
				<datalist id="auto_complete"></datalist>
				<input type="submit" value="상품검색">
			</form>
			<form>
				<select name="orderCol" id="orderCol">
					<option value="PROD_NO">상품번호순</option>
					<option value="PRICE">가격순</option>
					<option value="STOCK">재고순</option>
					<option value="PROD_CREATE_DATE">상품등록일순</option>
				</select>
				<span>
					<input type="submit" value="조회">
				</span>
			</form>
		</div>
		<hr>
		<table>
			<thead>
				<tr>
					<th>순번</th>
					<th>상품번호</th>
					<th>대표사진</th>
					<th>카테고리</th>
					<th>상품명</th>
					<th>원산지</th>
					<th>가격</th>
					<th>할인가격</th>
					<th>재고</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${prodList}" var="prod" varStatus="vs">
					<tr>
						<td>${beginNo - vs.index}</td>
						<td>${prod.prodNo}</td>
						<td>
							<c:if test="${prod.prodThumbnail.isThumbnail == 1}">
								<img src="/shopAdmin/prod/display?prodNo=${prod.prodNo}" width="100px" class="attach_img" alt="thumbnail_img" title="${prod.prodThumbnail.tnFilesystem}">
							</c:if>
							<c:if test="${prod.prodThumbnail.isThumbnail == 0 || prod.prodThumbnail.isThumbnail == null}">
								<img src="/resources/images/shopAdmin/no-image.jpeg" width="100px" class="attach_img" alt="thumbnail_img" title="${prod.prodName}">
							</c:if>
						</td>
						<td>${prod.prodCategory.prodCategoryName}</td>
						<td><a href="/shopAdmin/prod/detail?prodNo=${prod.prodNo}">${prod.prodName}</a></td>
						<td>${prod.origin}</td>
						<td>${prod.price}</td>
						<td>${prod.discount}</td>
						<td>${prod.stock}</td>
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
	</div>
</div>
</body>
</html>