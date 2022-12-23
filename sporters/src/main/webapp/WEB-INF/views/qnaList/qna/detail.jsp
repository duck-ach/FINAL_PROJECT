<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../layout/header.jsp">
	<jsp:param value="Spoters홈페이지" name="title" />
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script>
	$(function(){
		
	});
	
</script>
<body>

<section class="wrap"><!-- 기본틀 1 -->
	<section class="content_leyout_section"><!-- 기본틀 2 -->
		<div>
			<div style="font-size: 32px;"> QnA </div>
			<div>
				<input type="button" value="질문하기" onclick="location.href='/qna/write'">
			</div>
			<div>
				<table border="1">
					<thead>				
						<tr>
							<td>번호</td>
							<td>제목</td>
							<td>작성일</td>
							<td></td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${qnaList}" var="faq" varStatus="vs">
							<tr>
								<td>${beginNo - vs.index}</td>
								<td><a href="/qna/detail">${qna.qnaTitle}</a></td>
								<td>${qna.qnaCreateDate}</td>
								<td></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4">
								${paging}
							</td>
						</tr>
						<tr>
							<td colspan="4">검색</td>
						</tr>
					</tfoot>
				</table>
			</div>
		</div>
	</section><!-- 기본틀 2 -->
</section><!-- 기본틀 1 -->

</body>
</html>