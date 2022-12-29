<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../layout/header.jsp">
	<jsp:param value="Spoters홈페이지" name="title" />
</jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js" integrity="sha512-3j3VU6WC5rPQB4Ld1jnLV7Kd5xr+cq9avvhwqzbH/taCRNURoeEpoPBK9pDyeukwSxwRPJ8fDgvYXd6SkaZ2TA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"/>

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
							<td>작성자</td>
							<td>작성일</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${qna}" var="qna" varStatus="vs">
							<tr>
								<td>${beginNo - vs.index}</td>
								<c:if test="${qna.isPw == 1}">
									<td><i class="fa-solid fa-lock"></i><a href="/qna/lock?qnaNo=${qna.qnaNo}">${qna.qnaTitle}</a></td>
								</c:if>
								<c:if test="${qna.isPw == 0}">
									<td><a href="/qna/detail?qnaNo=${qna.qnaNo}">${qna.qnaTitle}</a></td>
								</c:if>
								<td>${qna.qnaId}</td>
								<td>${qna.qnaCreateDate}</td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="4" style="text-align: center;">
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