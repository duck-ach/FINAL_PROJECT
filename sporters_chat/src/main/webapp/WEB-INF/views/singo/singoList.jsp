<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="../layout/adminHeader.jsp">
	<jsp:param value="신고게시판" name="title" />
</jsp:include>
<style>
table, th {
	text-align: center;
}
/* 글쓰기 버튼 위치 설정 */
#pagingBox {
	position: relative;
}

#btnBox {
	position: absolute;
	top: 0;
	bottom: 0;
	right: 0;
	height: 40px;
	margin: auto;
}
</style>
<body>
	<h1>신고게시판</h1>
	<div>
		<button>신고글 작성하기</button>
	</div>
	
	<script type="text/javascript">
$(document).ready(function() {
	
	//글쓰기 버튼 누르면 이동
	$("#btnWrite").click(function() {
		location.href="/board/report/write";
	});
	
});
</script>



	<div>
		<h1>신고게시판</h1>
	</div>
	<br>
	<div style="text-align: right; margin-right: 50px;">
		홈 > 게시판 > <strong>신고게시판</strong>
	</div>
	<hr>
	<table class="table table-striped table-hover table-condensed">

		<thead>
			<tr>
				<th style="width: 10%;">번호</th>
				<th style="width: 45%;">제목</th>
				<th style="width: 15%;">작성자</th>
				<th style="width: 10%;">조회수</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach items="${singoList}" var="i">
				<tr>
					<td>${i.boardno }</td>
					<td><a id="moveDetail" href="/free/increase/hit?freeNo=${gallery.freeNo}">${gallery.title}</a></td>
					<td>${i.userid }</td>
					<td>${i.hit }</td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

	<div id="pagingBox">
		<c:import url="/WEB-INF/views/layout/reportPaging.jsp" />

		<div id="btnBox">
			<button id="btnWrite" class="btn btn-primary" style="text-align: right; margin-right: 50px;">글쓰기</button>
		</div>
	</div>
	<hr>
	<table>
		<thead>
			<tr>
				<th>카테고리</th>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자닉네임</th>
				<th>작성일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${galleryList}" var="singo" varStatus="vs">
				<tr>
					<td>${beginNo - vs.index}</td>
					<td><a id="moveDetail"
						href="/free/increase/hit?freeNo=${gallery.freeNo}">${gallery.title}</a></td>
					<td>${singo.users.id}</td>
					<td>${singo.users.nickname}</td>
					<td>${singo.users.gender}</td>
					<td>${singo.createDate}</td>
					<td>${singo.hit}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>